SELECT
	s.song AS cancao,
    COUNT(*) as reproducoes
FROM PlayHistory
INNER JOIN Songs AS s
	ON s.id = PlayHistory.song_id
GROUP BY s.song, s.id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;