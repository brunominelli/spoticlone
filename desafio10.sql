SELECT
	s.song AS nome,
    COUNT(ph.song_id) AS reproducoes
FROM
	SpotifyClone.PlayHistory AS ph
INNER JOIN SpotifyClone.Songs AS s
	ON s.id = ph.song_id
INNER JOIN SpotifyClone.Users AS u
	ON u.id = ph.user_id
WHERE u.plan_id = 1 OR u.plan_id = 3
GROUP BY s.song
ORDER BY s.song;