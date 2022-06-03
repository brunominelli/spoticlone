SELECT
	u.username AS usuario,
    COUNT(*) AS qtde_musicas_ouvidas,
    ROUND(SUM(s.seconds) / 60, 2) AS total_minutos
FROM SpotifyClone.PlayHistory AS ph
INNER JOIN SpotifyClone.Users AS u
	ON u.id = ph.user_id
INNER JOIN SpotifyClone.Songs AS s
    ON s.id = ph.song_id
GROUP BY u.username;