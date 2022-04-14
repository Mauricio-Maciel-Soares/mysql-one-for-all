SELECT u.user_name AS usuario, 
CASE
WHEN MAX(YEAR(h.history_date)) = 2021 THEN 'Usuário ativo'
ELSE 'Usuário inativo'
END AS condicao_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.historical AS h
ON u.user_id = h.user_id
GROUP BY u.user_name
ORDER BY u.user_name;
