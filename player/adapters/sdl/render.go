package sdl

import (
	"fmt"
	"image/color"
	"log"

	"github.com/veandco/go-sdl2/sdl"
	"github.com/veandco/go-sdl2/ttf"
)

type RenderData struct {
	Background *sdl.Texture
	Lines      []string
}

func (data *RenderData) Patch(new RenderData) {
	if new.Background != nil {
		if data.Background != nil {
			if err := data.Background.Destroy(); err != nil {
				log.Println("Faild to destroy background while replacing it", err)
			}
		}
		data.Background = new.Background
	}
	if new.Lines != nil {
		data.Lines = new.Lines
	}
}

func (data *RenderData) Destroy() error {
	if data.Background != nil {
		return data.Background.Destroy()
	}
	return nil
}

type RenderContext struct {
	renderer *sdl.Renderer
	font     *ttf.Font
	data     RenderData
}

func (rc *RenderContext) Render() error {
	err := rc.renderer.SetDrawColor(0, 0, 0, 255)
	if err != nil {
		return err
	}
	err = rc.renderer.Clear()
	if err != nil {
		return err
	}
	fmt.Println("Done!")

	fmt.Print("Background... ")
	if rc.data.Background != nil {
		err = rc.renderer.Copy(rc.data.Background, nil, nil)
		if err != nil {
			return err
		}
		fmt.Println("Done!")
	} else {
		fmt.Println("Bypass.")
	}

	width, height, err := rc.renderer.GetOutputSize()
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
	renderLines := make([]RenderLine, len(rc.data.Lines))
	for lineIndex, line := range rc.data.Lines {

		// line = adjustCase(line, rc.params.LetterCase)

		lineCenterY := centerY + float32((lineIndex*2-len(rc.data.Lines))*rc.font.LineSkip())/2 + 60
		textSurface, err := rc.font.RenderUTF8Blended(line, sdlColor(color.White))
		if err != nil {
			return err
		}
		textWidth := textSurface.W
		textHeight := textSurface.H
		renderLines[lineIndex].Rect = textSurface.ClipRect

		textTexture, err := rc.renderer.CreateTextureFromSurface(textSurface)
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
	err = rc.renderer.SetDrawColor(0, 0, 0, 200)
	if err != nil {
		return err
	}
	rc.renderer.FillRect(&totalRect)

	// Text
	for _, renderline := range renderLines {
		err = rc.renderer.Copy(renderline.Texture, &renderline.Rect, &renderline.Target)
		if err != nil {
			return err
		}
	}

	rc.renderer.Present()
	return nil
}
