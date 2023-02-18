package sdl

import (
	"fmt"
	"image/color"

	"github.com/mniak/louvorja/player"
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
	filename *ttf.Font

	background syncTexture
}

type AdapterParams struct {
	FontPath string
	FontSize int
	Display  int
}

func NewAdapter(params AdapterParams) (adapter *sdlAdapter, err error) {
	adapter = new(sdlAdapter)
	defer func() {
		if err != nil {
			adapter.Finish()
		}
	}()
	adapter.filename, err = ttf.OpenFont(params.FontPath, params.FontSize)
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
	if ad.filename != nil {
		ad.filename.Close()
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

func (ad *sdlAdapter) ShowVerse(verse player.Verse) error {
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

	if len(verse.Text) > 0 {
		textSurface, err := ad.filename.RenderUTF8BlendedWrapped(verse.Text, sdlColor(color.White), 1000)
		if err != nil {
			return err
		}
		textTexture, err := ad.renderer.CreateTextureFromSurface(textSurface)
		textSurface.Free()
		if err != nil {
			return err
		}
		err = ad.renderer.Copy(textTexture, nil, nil)
		if err != nil {
			return err
		}
	}

	ad.renderer.Present()
	fmt.Println(verse.Text)
	fmt.Println("---------------------")
	return nil
}

func sdlColor(c color.Color) sdl.Color {
	r, g, b, a := c.RGBA()
	return sdl.Color(color.RGBA{uint8(r), uint8(g), uint8(b), uint8(a)})
}
