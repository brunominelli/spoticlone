SELECT 
	COUNT(user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.PlayHistory
WHERE user_id = 3;