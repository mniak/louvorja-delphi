package songs

import (
	"database/sql"
	"fmt"

	_ "github.com/mattn/go-sqlite3"
)

type Database struct {
	db *sql.DB
}

func (db *Database) Close() error {
	if db.db != nil {
		return db.db.Close()
	}
	return nil
}

func LoadDatabaseFromSQLite(dbFileName string) (*Database, error) {
	db, err := sql.Open("sqlite3", fmt.Sprintf("file:%s?cache=shared", dbFileName))
	if err != nil {
		return nil, err
	}
	result := &Database{
		db: db,
	}
	return result, nil
	// db, err := accessdbwe.Open("adodb", "config/BD.json")
	// rows, err := db.Query("SELECT * FROM ALBUM")
	// // albumsTable, err := dblib.Scan(file, "ALBUM")
	// if err != nil {
	// 	return nil, err
	// }
	// // fmt.Println(albumsTable...)
	// fmt.Println(rows)
	// return &DBDatabase{}, nil
}

// func (db *Database) Albums() ([]DBAlbum, error) {
// 	return []DBAlbum{
// 		{
// 			db:   db.db,
// 			ID:   712,
// 			Name: "Hinário Adventista",
// 		},
// 	}, nil
// }

// type DBAlbum struct {
// 	db   *sql.DB
// 	ID   int
// 	Name string
// }

// func (alb DBAlbum) Songs() ([]stan, error) {
// 	return []DBSong{
// 		// {
// 		// 	ID:   1,
// 		// 	Name: "Santo, Santo, Santo!",
// 		// },
// 	}, nil
// }
