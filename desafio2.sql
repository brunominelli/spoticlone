SELECT
	COUNT(DISTINCT s.song) AS cancoes,
    COUNT(DISTINCT ar.artist) AS artistas,
    COUNT(DISTINCT al.album) AS albuns
FROM SpotifyClone.Albums AS al
INNER JOIN SpotifyClone.Songs AS s
INNER JOIN SpotifyClone.Artists AS ar;