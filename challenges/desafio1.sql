-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artistas(
  artista VARCHAR(100) NOT NULL PRIMARY KEY
) engine = InnoDB;

INSERT INTO artistas (artista)
VALUES
  ('Baco Exu do Blues'),
  ('Beyoncé'),
  ('Blind Guardian'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Queen');

CREATE TABLE albums(
  album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(100) NOT NULL,
  artista VARCHAR(100) NOT NULL,
  FOREIGN KEY (artista) REFERENCES artistas(artista)
) engine = InnoDB;

INSERT INTO albums (album, artista)
VALUES
  ('QVVJFA', 'Baco Exu do Blues'),
  ('Renaissance', 'Beyoncé'),
  ('Somewhere Far Beyond', 'Blind Guardian'),
  ('Falso Brilhante', 'Elis Regina'),
  ('Vento de Maio', 'Elis Regina'),
  ('I Put A Spell On You', 'Nina Simone'),
  ('Jazz', 'Queen'),
  ('Hot Space', 'Queen');

CREATE TABLE musicas(
  musicas_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  album_id INT NOT NULL,
  artista VARCHAR(100) NOT NULL,
  musicas VARCHAR(800) NOT NULL,
  duracao_segundos INT NOT NULL,
  ano_lancamento INT NOT NULL,
  FOREIGN KEY (artista) REFERENCES artistas(artista),
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

INSERT INTO musicas (album_id, artista, musica, duracao_segundos, ano_lancamento)
VALUES
  (2, 'Beyoncé', "BREAK MY SOUL", 279, 2022),
  (2, 'Beyoncé', "VIRGO'S GROOVE", 369, 2022),
  (2, 'Beyoncé', "ALIEN SUPERSTAR", 116, 2022),
  (7, 'Queen', "Don't Stop Me Now", 203, 1978),
  (8, 'Queen', "Under Pressure", 152, 1982),
  (4, 'Elis Regina', "Como Nossos Pais", 105, 1998),
  (5, 'Elis Regina', "O Medo de Amar é o Medo de Ser Livre", 207, 2001),
  (1, 'Baco Exu do Blues', "Samba em Paris", 267, 2003),
  (3, 'Blind Guardian', "The Bard's Song", 244, 2007),
  (6, 'Nina Simone', "Feeling Good", 100, 2012);

CREATE TABLE planos (
  plano VARCHAR(100) NOT NULL PRIMARY KEY,
  valor_plano decimal(4,2) NOT NULL
) engine = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

CREATE TABLE usuarios (
  usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plano VARCHAR(100) NOT NULL,
  data_assinatura VARCHAR(20) NOT NULL,
  FOREIGN KEY (plano) REFERENCES planos(plano)
) engine = InnoDB;

INSERT INTO usuarios (nome, idade, plano, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 'gratuito', '2019-10-20'),
  ('Robert Cecil Martin', 58, 'gratuito', '2017-01-06'),
  ('Ada Lovelace', 37, 'familiar', '2017-12-30'),
  ('Martin Fowler', 46, 'familiar', '2017-01-17'),
  ('Sandi Metz', 58, 'familiar', '2018-04-29'),
  ('Paulo Freire', 19, 'universitário', '2018-02-14'),
  ('Bell Hooks', 26, 'universitário', '2018-01-05'),
  ('Christopher Alexander', 85, 'pessoal', '2019-06-05'),
  ('Judith Butler', 45, 'pessoal', '2020-05-13'),
  ('Jorge Amado', 58, 'pessoal', '2017-02-17');

CREATE TABLE seguindo_artistas (
  usuario_id INT NOT NULL,
  artista VARCHAR(100),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista) REFERENCES artistas(artista)
) engine = InnoDB;

INSERT INTO seguindo_artistas (usuario_id, artista)
VALUES
  (1, 'Beyoncé'),
  (1, 'Queen'),
  (1, 'Elis Regina'),
  (2, 'Beyoncé'),
  (2, 'Elis Regina'),
  (3, 'Queen'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (5, 'Nina Simone'),
  (6, 'Nina Simone'),
  (6, 'Beyoncé'),
  (7, 'Nina Simone'),
  (9, 'Elis Regina'),
  (10, 'Queen');

CREATE TABLE historico (
  historico_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  historico_repro VARCHAR(100),
  data_repro VARCHAR(100),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO historico (usuario_id, historico_repro, data_repro)
VALUES
  (1, 'Samba em Paris', '2022-02-28 10:45:55'),
  (1, "VIRGO'S GROOVE", '2020-05-02 05:30:35'),
  (1, 'Feeling Good', '2020-03-06 11:22:33'),
  (2, 'Feeling Good', '2022-08-05 08:05:17'),
  (2, 'O Medo de Amar é o Medo de Ser Livre', '2020-01-02 07:40:33'),
  (3, 'Feeling Good', '2020-11-13 16:55:13'),
  (3, "VIRGO'S GROOVE", '2020-12-05 18:38:30'),
  (4, 'Samba em Paris', '2021-08-15 17:10:10'),
  (5, 'Samba em Paris', '2022-01-09 01:44:33'),
  (5, 'Under Pressure', '2020-08-06 15:23:43'),
  (6, 'O Medo de Amar é o Medo de Ser Livre', '2017-01-24 00:31:17'),
  (6, 'BREAK MY SOUL', '2017-10-12 12:35:20'),
  (7, "Don't Stop Me Now", '2011-12-15 22:30:49'),
  (8, "Don't Stop Me Now", '2012-03-17 14:56:41'),
  (9, "The Bard's Song", '2022-02-24 21:14:22'),
  (10, "ALIEN SUPERSTAR", "2015-12-13 08:30:22");