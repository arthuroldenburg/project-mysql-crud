SELECT artist.artista AS artista, album, COUNT(*) AS pessoas_seguidoras
FROM albums AS album INNER JOIN artistas AS artist ON album.artista_id = artist.artista_id INNER JOIN seguindo_artistas AS seguindo ON seguindo.artista_id = artist.artista_id
GROUP BY artista , album
ORDER BY COUNT(artist.artista_id) DESC , artist.artista , album;
