package sdl

import (
	"fmt"
	"image/color"

	"github.com/mniak/louvorja/player"
	"github.com/veandco/go-sdl2/sdl"
	"github.com/veandco/go-sdl2/ttf"
)

type sdlAdapter struct {
	window *sdl.Window
	font   *ttf.Font
}

func Init(fontpath string) (adapter *sdlAdapter, err error) {
	adapter = new(sdlAdapter)
	defer func() {
		if err != nil {
			adapter.Finish()
		}
	}()
	err = sdl.Init(sdl.INIT_VIDEO)
	if err != nil {
		return
	}

	adapter.window, err = sdl.CreateWindow("Louvor JA Player Standalone",
		sdl.WINDOWPOS_UNDEFINED, sdl.WINDOWPOS_UNDEFINED,
		800, 600,
		sdl.WINDOW_SHOWN,
	)
	if err != nil {
		return
	}

	ttf.Init()
	adapter.font, err = ttf.OpenFont(fontpath, 96)
	if err != nil {
		return
	}
	return
}

func (ad *sdlAdapter) Finish() {
	if ad.font != nil {
		ad.font.Close()
	}
	ttf.Quit()
	if ad.window != nil {
		ad.window.Destroy()
	}
	sdl.Quit()
}

func (ad *sdlAdapter) ShowVerse(verse player.Verse) error {
	verse.Text = "Line 1\nLine 2"
	winSurface, err := ad.window.GetSurface()
	if err != nil {
		return err
	}
	textSurface, err := ad.font.RenderUTF8BlendedWrapped(verse.Text, sdlColor(color.White), 1000)
	if err != nil {
		return err
	}
	err = textSurface.Blit(&textSurface.ClipRect, winSurface, &winSurface.ClipRect)
	textSurface.Free()
	if err != nil {
		return err
	}
	err = ad.window.UpdateSurface()
	if err != nil {
		return err
	}
	fmt.Println(verse.Text)
	fmt.Println("---------------------")
	return nil
}

func sdlColor(c color.Color) sdl.Color {
	r, g, b, a := c.RGBA()
	return sdl.Color(color.RGBA{uint8(r), uint8(g), uint8(b), uint8(a)})
}
