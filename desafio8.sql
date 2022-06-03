SELECT
	ar.artist AS artista,
    al.album AS album
FROM SpotifyClone.Artists AS ar
INNER JOIN SpotifyClone.Albums AS al
	ON al.artist_id = ar.id
LIMIT 2;