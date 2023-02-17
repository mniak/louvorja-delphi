package player

type Song struct {
	Name   string
	Verses []Verse
}

type Verse struct {
	Text string
	Time int
}
