package player

type Display interface {
	ShowVerse(verse Verse) error
	SetBackgroundImage(filename string) error
}
