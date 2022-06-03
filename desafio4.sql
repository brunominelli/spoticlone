SELECT
	u.username AS 'usuario',
    IF(
		MAX(YEAR(ph.play_date)) < 2021,
		'Usuário inativo',
        'Usuário ativo'
	) AS 'condicao_usuario'
FROM SpotifyClone.Users AS u
INNER JOIN SpotifyClone.PlayHistory AS ph
	ON u.id = ph.user_id
GROUP BY u.username;