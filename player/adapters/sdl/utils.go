package sdl

import (
	"image/color"
	"strings"

	"github.com/veandco/go-sdl2/img"
	"github.com/veandco/go-sdl2/sdl"
)

func LoadImageToTexture(renderer *sdl.Renderer, filename string) (*sdl.Texture, error) {
	imgSurf, err := img.Load(filename)
	if err != nil {
		return nil, err
	}
	texture, err := renderer.CreateTextureFromSurface(imgSurf)
	imgSurf.Free()
	return texture, err
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
