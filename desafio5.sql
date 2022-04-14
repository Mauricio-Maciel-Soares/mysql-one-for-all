SELECT s.song_name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.historical AS h
ON s.song_id = h.song_id
GROUP BY h.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
