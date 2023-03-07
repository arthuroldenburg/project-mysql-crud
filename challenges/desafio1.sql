-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artistas(
  artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO artistas(artista)
VALUES
  ('Baco Exu do Blues'),
  ('Beyoncé'),
  ('Blind Guardian'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Queen');

CREATE TABLE pessoa_usuaria (
  usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL
) engine = InnoDB;

INSERT INTO pessoa_usuaria(nome, idade)
VALUES
  ('Barbara Liskov', 82),
  ('Robert Cecil Martin', 58),
  ('Ada Lovelace', 37),
  ('Martin Fowler', 46),
  ('Sandi Metz', 58),
  ('Paulo Freire', 19),
  ('Bell Hooks', 26),
  ('Christopher Alexander', 85),
  ('Judith Butler', 45),
  ('Jorge Amado', 58);

CREATE TABLE albums(
  album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(100) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO albums(album, artista_id)
VALUES
  ('QVVJFA', 1),
  ('Renaissance', 2),
  ('Somewhere Far Beyond', 3),
  ('Falso Brilhante', 4),
  ('Vento de Maio', 4),
  ('I Put A Spell On You', 5),
  ('Jazz', 6),
  ('Hot Space', 6);

CREATE TABLE musicas (
    musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_id INT NOT NULL,
    musica VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    lancamento DATE NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) ENGINE = InnoDB;

INSERT INTO musicas (album_id, musica, artist_id, duracao, lancamento)
VALUES
  (2, 'BREAK MY SOUL', 2, 279, '2022-01-01'),
  (2, "VIRGO'S GROOVE", 2, 369, '2022-01-01'),
  (2, 'ALIEN SUPERSTAR', 2, 116, '2022-01-01'),
  (7, "Don't Stop Me Now", 6, 203, '1978-01-01'),
  (8, 'Under Pressure', 6, 152, '1982-01-01'),
  (4, 'Como Nossos Pais', 4, 105, '1998-01-01'),
  (5, 'O Medo de Amar é o Medo de Ser Livre', 4, 207, '2001-01-01'),
  (1, 'Samba em Paris', 1, 267, '2003-01-01'),
  (3, "The Bard's Song", 3, 244, '2007-01-01'),
  (6, 'Feeling Good', 5, 100, '2012-01-01');

CREATE TABLE planos(
  plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(100) NOT NULL,
  valor_plano decimal(4,2) NOT NULL
) engine = InnoDB;

INSERT INTO planos(plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

CREATE TABLE usuarios(
  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  usuario INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura VARCHAR(20) NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id),
  FOREIGN KEY (usuario) REFERENCES pessoa_usuaria(usuario_id)
) engine = InnoDB;

INSERT INTO usuarios(usuario, plano_id, data_assinatura)
VALUES
  (1, 1, '2019-10-20'),
  (2, 1, '2017-01-06'),
  (3, 4, '2017-12-30'),
  (4, 4, '2017-01-17'),
  (5, 4, '2018-04-29'),
  (6, 2, '2018-02-14'),
  (7, 2, '2018-01-05'),
  (8, 3, '2019-06-05'),
  (9, 3, '2020-05-13'),
  (10, 3, '2017-02-17');

CREATE TABLE seguindo_artistas (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(user_id),
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) engine = InnoDB;

INSERT INTO seguindo_artistas (artista_id, usuario_id)
VALUES
	(2, 1),
  (6, 1),
  (4, 1),
  (2, 2),
  (4, 2),
  (6, 3),
  (1, 4),
  (3, 5),
  (5, 5),
  (5, 6),
  (2, 6),
  (5, 7),
  (4, 9),
  (6, 10);

CREATE TABLE historico(
  usuario_id INT NOT NULL,
  musica INT NOT NULL,
  data_repro VARCHAR(100) NOT NULL,
  artista INT NOT NULL,
  FOREIGN KEY (musica) REFERENCES musicas(musica_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(user_id),
  FOREIGN KEY (artista) REFERENCES artistas(artista_id),
  CONSTRAINT PRIMARY KEY(usuario_id, artista)
) engine = InnoDB;
-- usuario, musica, artista
INSERT INTO historico(usuario_id, musica, artista, data_repro)
VALUES
  (1, 8, 1, '2022-02-28 10:45:55'),
  (1, 2, 2, '2020-05-02 05:30:35'),
  (1, 10, 5, '2020-03-06 11:22:33'),
  (2, 10, 5, '2022-08-05 08:05:17'),
  (2, 7, 4, '2020-01-02 07:40:33'),
  (3, 10, 5, '2020-11-13 16:55:13'),
  (3, 2, 2, '2020-11-13 16:55:13'),
  (4, 8, 1, '2021-08-15 17:10:10'),
  (5, 8, 1, '2022-01-09 01:44:33'),
  (5, 5, 6, '2020-08-06 15:23:43'),
  (6, 7, 6, '2017-01-24 00:31:17'),
  (6, 1, 2, '2017-10-12 12:35:20'),
  (7, 4, 6, '2011-12-15 22:30:49'),
  (8, 4, 6, '2012-03-17 14:56:41'),
  (9, 9, 3, '2022-02-24 21:14:22'),
  (10, 3, 2, '2015-12-13 08:30:22');