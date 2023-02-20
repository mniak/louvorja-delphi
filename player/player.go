package player

import (
	"path/filepath"
	"strings"
	"time"
)

type Player struct {
	SongLoader SongLoader
	Display    Display
	ImagesDir  string
}

const santoSantoSantoID = "1728"

func (p *Player) PresentLyrics() error {
	song, err := p.SongLoader.SongByID(santoSantoSantoID)
	if err != nil {
		return err
	}

	imgPath := filepath.Join(p.ImagesDir, song.CoverImage)
	err = p.Display.SetBackgroundImage(imgPath)
	if err != nil {
		return err
	}

	p.Display.ShowTitle(song.Title)
	for _, verse := range song.Verses {
		// if verse.Time < elapsed {
		// 	fmt.Println("BLANK SLIDE")
		// 	continue
		// }
		// timeNum := verse.Time - elapsed
		// elapsed = verse.Time

		// timeToSleep := convertTime(timeNum)
		// fmt.Println("Sleeping:", timeToSleep)
		// fmt.Println()
		// time.Sleep(timeToSleep)

		time.Sleep(2 * time.Second)
		p.Display.ShowVerse(strings.Split(verse.Text, "\n")...)
	}
	return nil
}
