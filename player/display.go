package player

type Display interface {
	ShowVerse(lines ...string) error
	SetBackgroundImage(filename string) error
}
