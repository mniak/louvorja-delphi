package sdl

import (
	"image/color"

	"github.com/veandco/go-sdl2/img"
	"github.com/veandco/go-sdl2/sdl"
	"github.com/veandco/go-sdl2/ttf"
)

var initialized bool

func Init() error {
	err := sdl.Init(sdl.INIT_VIDEO)
	if err != nil {
		return err
	}

	err = ttf.Init()
	if err != nil {
		sdl.Quit()
		return err
	}
	initialized = true
	return nil
}

func Quit() {
	ttf.Quit()
	sdl.Quit()
}

type sdlAdapter struct {
	params   AdapterParams
	window   *sdl.Window
	renderer *sdl.Renderer
	font     *ttf.Font

	background syncTexture
}

type AdapterParams struct {
	FontPath string
	FontSize float32
	Display  int
}

func NewAdapter(params AdapterParams) (adapter *sdlAdapter, err error) {
	adapter = new(sdlAdapter)
	defer func() {
		if err != nil {
			adapter.Finish()
		}
	}()
	adapter.font, err = ttf.OpenFont(params.FontPath, int(params.FontSize))
	if err != nil {
		return
	}

	mode, err := sdl.GetCurrentDisplayMode(params.Display)
	if err != nil {
		return
	}
	adapter.window, adapter.renderer, err = sdl.CreateWindowAndRenderer(
		mode.W, mode.H,
		sdl.WINDOW_HIDDEN|sdl.WINDOW_FULLSCREEN)
	if err != nil {
		return
	}
	adapter.window.Show()
	return
}

func (ad *sdlAdapter) Finish() {
	if ad.font != nil {
		ad.font.Close()
	}
	if ad.renderer != nil {
		ad.renderer.Destroy()
	}
	if ad.window != nil {
		ad.window.Destroy()
	}
}

func (ad *sdlAdapter) SetBackgroundImage(filename string) error {
	imgSurf, err := img.Load(filename)
	if err != nil {
		return err
	}
	texture, err := ad.renderer.CreateTextureFromSurface(imgSurf)
	texture.Query()
	imgSurf.Free()
	if err != nil {
		return err
	}
	ad.background.Replace(texture)
	return nil
}

func (ad *sdlAdapter) ShowVerse(lines ...string) error {
	err := ad.renderer.Clear()
	if err != nil {
		return err
	}

	err = ad.background.UseLocked(func(bg *sdl.Texture) error {
		return ad.renderer.Copy(bg, nil, nil)
	})
	if err != nil {
		return err
	}

	width, height, err := ad.renderer.GetOutputSize()
	if err != nil {
		return err
	}
	centerX := float32(width) / 2
	centerY := float32(height) / 2

	var totalRect sdl.Rect

	for lineIndex, line := range lines {
		lineCenterY := centerY + float32(lineIndex*ad.font.LineSkip())
		textSurface, err := ad.font.RenderUTF8Blended(line, sdlColor(color.White))
		if err != nil {
			return err
		}
		textWidth := textSurface.W
		textHeight := textSurface.H

		textTexture, err := ad.renderer.CreateTextureFromSurface(textSurface)
		textSurface.Free()
		if err != nil {
			return err
		}

		targetRect := sdl.Rect{
			W: textWidth,
			H: textHeight,
			X: int32(centerX - float32(textWidth)/2),
			Y: int32(lineCenterY - float32(textHeight)/2),
		}
		if lineIndex == 0 {
			totalRect = targetRect
		} else {
			totalRect = expandRect(totalRect, targetRect)
		}
		err = ad.renderer.Copy(textTexture, &textSurface.ClipRect, &targetRect)
		if err != nil {
			return err
		}
	}
	totalRect = growRect(totalRect, 20, 30, 10, 30)

	ad.renderer.SetDrawBlendMode(sdl.BLENDMODE_BLEND)
	ad.renderer.SetDrawColor(0, 0, 120, 100)
	ad.renderer.FillRect(&totalRect)

	ad.renderer.Present()
	return nil
}

func sdlColor(c color.Color) sdl.Color {
	r, g, b, a := c.RGBA()
	return sdl.Color(color.RGBA{uint8(r), uint8(g), uint8(b), uint8(a)})
}
