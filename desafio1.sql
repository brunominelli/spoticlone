DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.Plans (
	id INT NOT NUll AUTO_INCREMENT,
    plan VARCHAR(255) NOT NULL,
    price FLOAT(8,2) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Users (
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    singin_date DATE NOT NULL,
    plan_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (plan_id)
		REFERENCES Plans(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Artists (
	id INT NOT NULL AUTO_INCREMENT,
    artist VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Albums (
	id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id)
		REFERENCES Artists(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Songs (
	id INT NOT NULL AUTO_INCREMENT,
    song VARCHAR(255) NOT NULL,
    seconds INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id)
		REFERENCES Albums(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.PlayHistory (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    play_date DATETIME NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id)
		REFERENCES Users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (song_id)
		REFERENCES Songs(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Following (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id)
		REFERENCES Users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (artist_id)
		REFERENCES Artists(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Plans
	(plan, price)
VALUES
	('Gratuito', 0),
    ('Universitário', 5.99),
    ('Pessoal', 6.99),
    ('Familiar', 7.99);

INSERT INTO SpotifyClone.Users
	(username, age, singin_date, plan_id)
VALUES
    ('Thati', 23, '2019-10-20', 1),
	('Cintia', 35, '2017-12-30', 4),
	('Bill', 20, '2019-06-05', 2),
	('Roger', 45, '2020-05-13', 3),
	('Norman', 58, '2020-05-17', 3),
	('Patrick', 33, '2017-01-06', 4),
	('Vivian', 26, '2018-01-05', 2),
	('Carol', 19, '2018-02-14', 2),
	('Angelina', 42, '2018-04-29', 4),
	('Paul', 46, '2017-01-17', 4);

INSERT INTO SpotifyClone.Artists
	(artist)
VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

INSERT INTO SpotifyClone.Albums
	(album, release_year, artist_id)
VALUES
	('Envious', '1990', 1),
    ('Exuberant', '1993', 1),
    ('Hallowed Steam', '1995', 2),
    ('Incandescent', '1998', 3),
    ('Temporary Culture', '2001', 4),
    ('Library of liberty', '2003', 4),
    ('Chained Down', '2007', 5),
    ('Cabinet of fools', '2012', 5),
    ('No guarantees', '2015', 5),
    ('Apparatus', '2015', 6);

INSERT INTO SpotifyClone.Songs 
	(song, seconds, album_id)
VALUES
	("Soul For Us", 200, 1),
	("Reflections Of Magic", 163, 1),
	("Dance With Her Own", 116, 1),
	("Troubles Of My Inner Fire", 203, 1),
	("Time Fireworks", 152, 1),
	("Magic Circus", 105, 2),
	("Honey, So Do I", 207, 2),
	("Sweetie, Let's Go Wild", 139, 2),
	("She Knows", 244, 2),
	("Fantasy For Me", 100, 3),
	("Celebration Of More", 146, 3),
	("Rock His Everything", 223, 3),
	("Home Forever", 231, 3),
	("Diamond Power", 241, 3),
	("Let's Be Silly", 132, 3),
	("Thang Of Thunder", 240, 4),
	("Words Of Her Life", 185, 4),
	("Without My Streets", 176, 4),
	("Need Of The Evening", 190, 4),
	("History Of My Roses", 222, 4),
	("Without My Love", 111, 4),
	("Walking And Game", 123, 4),
	("Young And Father", 197, 4),
	("Finding My Traditions", 179, 5),
	("Walking And Man", 229, 5),
	("Hard And Time", 135, 5),
	("Honey, I'm A Lone Wolf", 150, 5),
	("She Thinks I Won't Stay Tonight", 166, 5),
	("He Heard You're Bad For Me", 154, 5),
	("He Hopes We Can't Stay", 210, 5),
	("I Know I Know", 117, 5),
	("He's Walking Away", 159, 5),
	("He's Trouble", 138, 5),
	("I Heard I Want To Bo Alone", 120, 5),
	("I Ride Alone", 151, 5),
	("Honey", 79, 6),
	("You Cheated On Me", 95, 6),
	("Wouldn't It Be Nice", 213, 6),
	("Baby", 136, 6),
	("You Make Me Feel So..", 83, 6);

INSERT INTO SpotifyClone.PlayHistory
	(user_id, song_id, play_date)
VALUES
	(1, 36, "2020-02-28 10:45:55"),
	(1, 25, "2020-05-02 05:30:35"),
	(1, 23, "2020-03-06 11:22:33"),
	(1, 14, "2020-08-05 08:05:17"),
	(1, 15, "2020-09-14 16:32:22"),
	(2, 34, "2020-01-02 07:40:33"),
	(2, 24, "2020-05-16 06:16:22"),
	(2, 21, "2020-10-09 12:27:48"),
	(2, 39, "2020-09-21 13:14:46"),
	(3, 6, "2020-11-13 16:55:13"),
	(3, 3, "2020-12-05 18:38:30"),
	(3, 26, "2020-07-30 10:00:00"),
	(4, 2 , "2021-08-15 17:10:10"),
	(4, 35, "2021-07-10 15:20:30"),
	(4, 27, "2021-01-09 01:44:33"),
	(5, 7, "2020-07-03 19:33:28"),
	(5, 12, "2017-02-24 21:14:22"),
	(5, 14, "2020-08-06 15:23:43"),
	(5, 1, "2020-11-10 13:52:27"),
	(6, 38, "2019-02-07 20:33:48"),
	(6, 29, "2017-01-24 00:31:17"),
	(6, 30, "2017-10-12 12:35:20"),
	(6, 22, "2018-05-29 14:56:41"),
	(7, 5, "2018-05-09 22:30:49"),
	(7, 4, "2020-07-27 12:52:58"),
	(7, 11, "2018-01-16 18:40:43"),
	(8, 39, "2018-03-21 16:56:40"),
	(8, 40, "2020-10-18 13:38:05"),
	(8, 32, "2019-05-25 08:14:03"),
	(8, 33, "2021-08-15 21:37:09"),
	(9, 16, "2021-05-24 17:23:45"),
	(9, 17, "2018-12-07 22:48:52"),
	(9, 8, "2021-03-14 06:14:26"),
	(9, 9, "2020-04-01 03:36:00"),
	(10, 20, "2017-02-06 08:21:34"),
	(10, 21, "2017-12-04 05:33:43"),
	(10, 12, "2017-07-27 05:24:49"),
	(10, 13, "2017-12-25 01:03:57");

INSERT INTO SpotifyClone.Following
	(user_id, artist_id)
VALUES
	(1, 1),
	(1, 4),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(3, 1),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 3),
	(6, 1),
	(7, 2),
	(7, 5),
	(8, 1),
	(8, 5),
	(9, 6),
	(9, 4),
	(9, 3),
	(10, 2),
	(10, 6);