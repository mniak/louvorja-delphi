package player

type Song struct {
	Title      string
	CoverImage string
	Verses     []Verse
}

type Verse struct {
	Text string
	Time int
}
