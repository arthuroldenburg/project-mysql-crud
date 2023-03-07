SELECT music.musica AS cancao, COUNT(histoy.musica) AS reproducoes FROM musicas AS music INNER JOIN historico AS histoy ON music.musica_id = histoy.musica
GROUP BY music.musica_id
ORDER BY reproducoes DESC, cancao LIMIT 2;
