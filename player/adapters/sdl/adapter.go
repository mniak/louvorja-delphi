package sdl

import (
	"image/color"
	"strings"

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

type LetterCase uint8

const (
	UpperCase LetterCase = iota
	NormalCase
	LowerCase
)

type AdapterParams struct {
	FontPath   string
	FontSize   float32
	LetterCase LetterCase
	Display    int
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

	err = adapter.renderer.SetDrawBlendMode(sdl.BLENDMODE_BLEND)
	if err != nil {
		return
	}

	// Color of the box
	err = adapter.renderer.SetDrawColor(0, 0, 0, 200)
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

	type RenderLine struct {
		Texture *sdl.Texture
		Rect    sdl.Rect
		Target  sdl.Rect
	}

	// Pre-render texts and calculate position
	renderLines := make([]RenderLine, len(lines))
	for lineIndex, line := range lines {

		line = adjustCase(line, ad.params.LetterCase)

		lineCenterY := centerY + float32((lineIndex*2-len(lines))*ad.font.LineSkip())/2 + 60
		textSurface, err := ad.font.RenderUTF8Blended(line, sdlColor(color.White))
		if err != nil {
			return err
		}
		textWidth := textSurface.W
		textHeight := textSurface.H
		renderLines[lineIndex].Rect = textSurface.ClipRect

		textTexture, err := ad.renderer.CreateTextureFromSurface(textSurface)
		textSurface.Free()
		if err != nil {
			return err
		}
		renderLines[lineIndex].Texture = textTexture

		targetRect := sdl.Rect{
			W: textWidth,
			H: textHeight,
			X: int32(centerX - float32(textWidth)/2),
			Y: int32(lineCenterY - float32(textHeight)/2),
		}

		renderLines[lineIndex].Target = targetRect
	}

	// Box
	for idx, line := range renderLines {
		if idx == 0 {
			totalRect = line.Target
		} else {
			totalRect = expandRect(totalRect, line.Target)
		}
	}
	totalRect = growRect(totalRect, 20, 30, 10, 30)
	ad.renderer.FillRect(&totalRect)

	// Text
	for _, renderline := range renderLines {
		err = ad.renderer.Copy(renderline.Texture, &renderline.Rect, &renderline.Target)
		if err != nil {
			return err
		}
	}

	ad.renderer.Present()
	return nil
}

func sdlColor(c color.Color) sdl.Color {
	r, g, b, a := c.RGBA()
	return sdl.Color(color.RGBA{uint8(r), uint8(g), uint8(b), uint8(a)})
}

func adjustCase(line string, letterCase LetterCase) string {
	switch letterCase {
	case UpperCase:
		return strings.ToUpper(line)
	case LowerCase:
		return strings.ToLower(line)
	default:
		return line
	}
}
