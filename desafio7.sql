SELECT
	ar.artist AS artista,
    al.album as album,
	COUNT(*) AS seguidores
FROM SpotifyClone.Following AS f
INNER JOIN SpotifyClone.Users AS u
	ON u.id = f.user_id
INNER JOIN SpotifyClone.Artists AS ar
	ON ar.id = f.artist_id
INNER JOIN SpotifyClone.Albums as al
	ON al.artist_id = ar.id
GROUP BY ar.artist, al.album
ORDER BY seguidores DESC, artista ASC, album ASC; 