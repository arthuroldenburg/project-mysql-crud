SELECT user.nome AS pessoa_usuaria, COUNT(history.usuario_id) AS musicas_ouvidas, ROUND(SUM(music.duracao) / 60, 2) AS total_minutos
FROM pessoa_usuaria AS user INNER JOIN historico AS history ON user.usuario_id = history.usuario_id INNER JOIN musicas AS music ON history.musica = music.musica_id
GROUP BY history.usuario_id
ORDER BY user.nome;
