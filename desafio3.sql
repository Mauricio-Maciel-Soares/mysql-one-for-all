SELECT u.user_name AS usuario,
COUNT(h.song_id) AS qtde_musicas_ouvidas,
ROUND(SUM(s.song_length) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.historical AS h
ON u.user_id = h.user_id
INNER JOIN SpotifyClone.songs AS s
ON s.song_id = h.song_id
GROUP BY u.user_name
ORDER BY u.user_name;

