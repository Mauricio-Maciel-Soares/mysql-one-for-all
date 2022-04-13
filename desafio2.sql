SELECT COUNT(DISTINCT songs.song_name) AS cancoes,
COUNT(DISTINCT artists.artist_name) AS artistas,
COUNT(DISTINCT albuns.album_name) AS albuns
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albuns AS albuns;
