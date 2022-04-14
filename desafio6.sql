SELECT MIN(su.price) AS faturamento_minimo,
	MAX(su.price) AS faturamento_maximo,
    ROUND(SUM(su.price) / COUNT(u.user_name), 2) AS faturamento_medio,
    SUM(su.price) AS faturamento_total
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.subscriptions AS su
ON u.plan_id = su.plan_id;
