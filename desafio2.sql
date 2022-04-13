SELECT COUNT(DISTINCT s.song_name) AS cancoes,
COUNT(DISTINCT ar.artist_name) AS artistas,
COUNT(DISTINCT al.album_name) AS albuns
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albuns AS al;
