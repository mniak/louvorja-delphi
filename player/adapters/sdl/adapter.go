package sdl

import (
	"image/color"
	"log"

	"github.com/samber/lo"
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
	params  AdapterParams
	window  *sdl.Window
	context RenderContext
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

	font, err := ttf.OpenFont(params.FontPath, int(params.FontSize))
	adapter.context.font = font
	if err != nil {
		return
	}

	mode, err := sdl.GetCurrentDisplayMode(params.Display)
	if err != nil {
		return
	}

	window, renderer, err := sdl.CreateWindowAndRenderer(
		mode.W, mode.H,
		sdl.WINDOW_HIDDEN|sdl.WINDOW_FULLSCREEN,
	)
	adapter.window = window
	adapter.context.renderer = renderer
	if err != nil {
		return
	}

	err = renderer.SetDrawBlendMode(sdl.BLENDMODE_BLEND)
	if err != nil {
		return
	}

	err = adapter.context.Render()
	if err != nil {
		return
	}
	adapter.window.Show()
	return
}

func (ad *sdlAdapter) Finish() {
	if ad.context.font != nil {
		ad.context.font.Close()
	}
	if ad.context.renderer != nil {
		if err := ad.context.renderer.Destroy(); err != nil {
			log.Println("Faild to destroy background while replacing it", err)
		}
	}
	if err := ad.context.data.Destroy(); err != nil {
		log.Println("Faild to destroy background while replacing it", err)
	}
	if ad.window != nil {
		if err := ad.window.Destroy(); err != nil {
			log.Println("Faild to destroy background while replacing it", err)
		}
	}
}

func (ad *sdlAdapter) SetBackgroundImage(filename string) error {
	tex, err := LoadImageToTexture(ad.context.renderer, filename)
	if err != nil {
		return err
	}
	ad.context.data.Patch(RenderData{
		Background: tex,
	})
	return ad.context.Render()
}

func (ad *sdlAdapter) ShowVerse(lines ...string) error {
	lines = lo.Map(lines, func(line string, _ int) string {
		return adjustCase(line, ad.params.LetterCase)
	})

	ad.context.data.Patch(RenderData{
		Text:      lines,
		TextColor: color.White,
	})
	return ad.context.Render()
}

func (ad *sdlAdapter) ShowTitle(title string) error {
	title = adjustCase(title, ad.params.LetterCase)

	ad.context.data.Patch(RenderData{
		Text:      []string{title},
		TextColor: color.RGBA{R: 0xef, G: 0xb4},
	})
	return ad.context.Render()
}
