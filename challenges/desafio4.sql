SELECT nome AS pessoa_usuaria, IF(YEAR(MAX(history.data_repro)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM pessoa_usuaria AS nome INNER JOIN historico AS history ON nome.usuario_id = history.usuario_id
GROUP BY history.usuario_id
ORDER BY nome;
