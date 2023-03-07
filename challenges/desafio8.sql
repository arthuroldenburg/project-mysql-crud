SELECT artist.artista AS artista, album
FROM albums AS album INNER JOIN artistas AS artist WHERE album.artista_id = 4 AND artista = 'Elis Regina';
