SELECT ar.artist_name AS artista,
	al.album_name AS album,
    COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artist_id = al.artist_id
INNER JOIN SpotifyClone.followed_artists AS f
ON ar.artist_id = f.artist_id
GROUP BY al.album_id
ORDER BY COUNT(f.artist_id) DESC, ar.artist_name ASC, al.album_name;
