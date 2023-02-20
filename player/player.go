package player

import (
	"strings"
	"time"
)

type Player struct {
	SongLoader SongLoader
	Display    Display
}

const santoSantoSantoID = "1728"

func (p *Player) PrintLyrics() error {
	song, err := p.SongLoader.SongByID(santoSantoSantoID)
	if err != nil {
		return err
	}

	imgPath := "config/imagens/hasd_018.jpg"
	err = p.Display.SetBackgroundImage(imgPath)
	if err != nil {
		return err
	}

	// var elapsed int
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

		p.Display.ShowVerse(strings.Split(verse.Text, "\n")...)
		time.Sleep(2 * time.Second)
	}
	return nil
}

// func converteTempos() {
// 	var tempo string
// 	var txt []string

// 	txt := TStringList.Create;
// 	for i := 0; i < len(lbTempos.Items); i++   {
// 		txt.Clear;
// 		tempo := lbTempos.Items[i];
// 		if Pos(':',tempo) > 0  {
// 			strings.Split(':'], [], PChar(tempo), txt);
// 			tempo := StrToInt('0'+txt[0])*60)+StrToInt('0'+txt[1]));
// 			tempo := BASS_ChannelSeconds2Bytes(bass_channel,StrToFloat(tempo)));
// 			lbTempos.Items[i] := tempo;
// 		}
// 	}
// }
