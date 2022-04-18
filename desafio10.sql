SELECT s.song_name AS nome,
	COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.historical AS h
ON s.song_id = h.song_id
INNER JOIN SpotifyClone.users AS u
ON u.user_id = h.user_id
INNER JOIN SpotifyClone.subscriptions AS su
ON u.plan_id = su.plan_id
WHERE su.plan = 'gratuito' OR su.plan = 'pessoal'
GROUP BY s.song_name
ORDER BY s.song_name;
