package songs

import (
	"fmt"
	"io"

	accessdbwe "github.com/bennof/accessDBwE"
)

type MDBDatabase struct{}

func LoadDatabaseFromMDB(file io.ReadSeeker) (*MDBDatabase, error) {
	db, err := accessdbwe.Open("adodb", "config/BD.json")
	rows, err := db.Query("SELECT * FROM ALBUM")
	// albumsTable, err := mdblib.Scan(file, "ALBUM")
	if err != nil {
		return nil, err
	}
	// fmt.Println(albumsTable...)
	fmt.Println(rows)
	return &MDBDatabase{}, nil
}

func (db MDBDatabase) Albums() ([]MDBAlbum, error) {
	return []MDBAlbum{
		{
			ID:   712,
			Name: "Hin�rio Adventista",
		},
	}, nil
}

type MDBAlbum struct {
	ID   int
	Name string
}

func (alb MDBAlbum) Songs() ([]MDBSong, error) {
	return []MDBSong{
		// {
		// 	ID:   1,
		// 	Name: "Santo, Santo, Santo!",
		// },
	}, nil
}

type MDBSong struct{}

func (s MDBSong) Lyrics() ([]Verse, error) {
	return []Verse{
		// {
		// 	ID:   1,
		// 	Name: "Santo, Santo, Santo!",
		// },
	}, nil
}

type Verse struct {
	Text string
}
