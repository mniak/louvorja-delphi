package sdl

import (
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
	adapter.context = NewRenderContext()

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

	// mode, err := sdl.GetCurrentDisplayMode(params.Display)
	// if err != nil {
	// 	return
	// }

	window, renderer, err := sdl.CreateWindowAndRenderer(
		// mode.W, mode.H,
		int32(800), int32(600),
		// sdl.WINDOW_HIDDEN|sdl.WINDOW_FULLSCREEN,
		sdl.WINDOW_SHOWN,
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

	// Color of the box
	err = renderer.SetDrawColor(0, 0, 250, 200)
	if err != nil {
		return
	}

	err = adapter.context.StartRendering()
	if err != nil {
		return
	}
	// adapter.window.Show()
	return
}

func (ad *sdlAdapter) Finish() {
	if ad.context.font != nil {
		ad.context.font.Close()
	}
	if ad.context.renderer != nil {
		ad.context.renderer.Destroy()
	}
	ad.context.data.Destroy()
	if ad.window != nil {
		ad.window.Destroy()
	}
}

func (ad *sdlAdapter) SetBackgroundImage(filename string) error {
	tex, err := LoadImageToTexture(ad.context.renderer, filename)
	if err != nil {
		return err
	}
	return ad.context.UpdateData(RenderData{
		Background: tex,
	})
}

func (ad *sdlAdapter) ShowVerse(lines ...string) error {
	return ad.context.UpdateData(RenderData{
		Lines: lines,
	})
}
