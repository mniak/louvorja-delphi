package sqlite

import (
	"database/sql"

	"github.com/mniak/louvorja/player"
)

func (ad *sqliteAdapter) SongByID(songID string) (player.Song, error) {
	var song player.Song

	const script = `
		select ORDEM, LETRA, TEMPO
		from MUSICAS_LETRA
		where MUSICA = ?
		order by ORDEM asc
	`
	rows, err := ad.db.Queryx(script, songID)
	if err != nil {
		return song, err
	}
	for rows.Next() {
		var row MusicasLetraRow
		err = rows.StructScan(&row)
		if err != nil {
			return song, err
		}

		var verse player.Verse
		if row.Letra.Valid {
			verse.Text = row.Letra.String
		}
		verse.Time = row.Tempo
		song.Verses = append(song.Verses, verse)
	}
	return song, nil
}

type MusicasLetraRow struct {
	Ordem int            `db:"ORDEM"`
	Letra sql.NullString `db:"LETRA"`
	Tempo int            `db:"TEMPO"`
}
