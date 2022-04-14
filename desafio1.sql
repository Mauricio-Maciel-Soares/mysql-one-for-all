DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
CREATE TABLE SpotifyClone.subscriptions(
	plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan VARCHAR(100) NOT NULL,
    price DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.users(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	user_name VARCHAR(30) NOT NULL,
	age INT(100) NOT NULL,
	plan_id INT(6) NOT NULL,
	FOREIGN KEY(plan_id) REFERENCES subscriptions(plan_id),
	date_assign DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.artists(
	artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	artist_name VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.followed_artists(
	user_id INT,
    artist_id INT,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.albuns(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR (100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id),
    debut_year YEAR NOT NULL
    
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.songs(
	song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    song_length INT,
    album_id INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.historical(
	history_date DATE NOT NULL,
    history_time TIME NOT NULL,
	user_id INT,
    song_id INT,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(song_id) REFERENCES songs(song_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.subscriptions (plan, price)
VALUES
	('familiar', '7.99'),
    ('gratuito', '0.00'),
	('pessoal', '6.99'),
	('universitário', '5.99');


INSERT INTO SpotifyClone.artists (artist_name)
VALUES
	('Fog'),
	('Freedie Shannon'),
	('Lance Day'),
	('Peter Strong'),
	('Tyler Isle'),
	('Walter Phoenix');

INSERT INTO SpotifyClone.albuns (album_name, artist_id, debut_year)
VALUES
	('Apparatus', '1', '2015'),
    ('Chained Down', '5', '2007'),
    ('Cabinet of fools', '5', '2012'),
    ('Envious', '6', '1990'),
    ('Exuberant', '6', '1993'),
    ('Hallowed Steam', '4', '1995'),
    ('Incandescent', '3', '1998'),
    ('Library of liberty', '2', '2003'),
	('No guarantees', '5', '2015'),
	('Temporary Culture', '2', '2001');
  
INSERT INTO SpotifyClone.users (user_name, age, plan_id, date_assign)
VALUES
	('Angelina', '42', '2', '2018-04-29'),
    ('Bill', '20', '4', '2019-06-05'),
    ('Carol', '19', '4', '2018-02-14'),
    ('Cintia', '35', '1', '2017-12-30'),
    ('Norman', '58', '3', '2017-02-17'),
	('Patrick', '33', '1', '2017-01-06'),
    ('Paul', '46', '1', '2017-01-17'),
    ('Roger', '45', '3', '2020-05-13'),
	('Thati', '23', '2', '2019-10-20'),
	('Vivian', '26', '4', '2018-01-05');
  
INSERT INTO SpotifyClone.followed_artists (user_id, artist_id)
VALUES
    ('9', '6'),
    ('9', '2'),
    ('9', '3'),
    ('4', '6'),
    ('4', '3'),
    ('2', '6'),
    ('2', '4'),
    ('8', '2'),
    ('5', '1'),
    ('5', '5'),
    ('6', '1'),
    ('6', '3'),
    ('6', '6'),
    ('10', '5'),
    ('10', '4'),
    ('3', '6'),
    ('3', '5'),
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('7', '1'),
    ('7', '4');

INSERT INTO SpotifyClone.songs (song_name, song_length, album_id)
VALUES
    ('Soul For Us', '200', '4'),
    ('Reflections Of Magic', '163', '4'),
    ('Dance With Her Own', '116', '4'),
    ('Troubles Of My Inner Fire', '203', '5'),
    ('Time Fireworks', '152', '5'),
    ('Magic Circus', '105', '6'),
    ('Honey, So Do I', '207', '6'),
    ("Sweetie, Let's Go Wild", '139', '6'),
    ('She Knows', '244', '6'),
    ('Fantasy for me', '100', '7'),
    ('Celebration of more', '146', '7'),
    ('Rock his everything', '223', '7'),
    ('Home forever', '231', '7'),
    ('Diamond Power', '241', '7'),
    ("Let's be silly", '132', '7'),
    ('Thang of thunder', '240', '10'),
    ('Words of her life', '185', '10'),
    ('Without my streets', '176', '10'),
    ('Need of the evening', '190', '8'),
    ('History of my roses', '222', '8'),
    ('Without my love', '111', '8'),
    ('Walking and game', '123', '8'),
    ('Young and father', '197', '8'),
    ('Finding my traditions', '179', '2'),
    ('Walking and man', '229', '2'),
    ('Hard and time', '135', '2'),
    ("Honey, I'm a lone wolf", '150', '2'),
    ("She thinks I won't stay tonight", '166', '3'),
    ("He heard you're bad for me", '154', '3'),
    ("He hopes we can't stay", '210', '3'),
    ('I know I know', '117', '3'),
    ("He's walking away", '159', '9'),
    ("He's trouble", '138', '9'),
    ('I heard I want to be alone', '120', '9'),
    ('I ride alone', '151', '9'),
    ('Honey', '79', '1'),
    ('You cheated on me', '95', '1'),
    ("Wouldn't it be nice", '213', '1'),
    ('Baby', '136', '1'),
    ('You make me feel so...', '83', '1');
  
INSERT INTO SpotifyClone.historical (history_date, history_time, user_id, song_id)
VALUES
    ('2020-02-28', '10:45:55', '9', '36'),
    ('2020-05-02', '05:30:35', '9', '25'),
    ('2020-03-06', '11:22:33', '9', '23'),
    ('2020-08-05', '08:05:17', '9', '14'),
    ('2020-09-14', '16:32:22', '9', '15'),
    ('2020-01-02', '07:40:33', '4', '34'),
    ('2020-05-16', '06:16:22', '4', '24'),
    ('2020-10-09', '12:27:48', '4', '21'),
    ('2020-09-21', '13:14:46', '4', '39'),
    ('2020-11-13', '16:55:13', '2', '6'),
    ('2020-12-05', '18:38:30', '2', '3'),
    ('2020-07-30', '10:00:00', '2', '26'),
    ('2021-08-15', '17:10:10', '8', '2'),
    ('2021-07-10', '15:20:30', '8', '35'),
    ('2021-01-09', '01:44:33', '8', '27'),
    ('2020-07-03', '19:33:28', '5', '7'),
    ('2017-02-24', '21:14:22', '5', '12'),
    ('2020-08-06', '15:23:43', '5', '14'),
    ('2020-11-10', '13:52:27', '5', '1'),
    ('2019-02-07', '20:33:48', '6', '38'),
    ('2017-01-24', '00:31:17', '6', '29'),
    ('2017-10-12', '12:35:20', '6', '30'),
    ('2018-05-29', '14:56:41', '6', '22'),
    ('2018-05-09', '22:30:49', '10', '5'),
    ('2020-07-27', '12:52:58', '10', '4'),
    ('2018-01-16', '18:40:43', '10', '11'),
    ('2018-03-21', '16:56:40', '3', '39'),
    ('2020-10-18', '13:38:05', '3', '40'),
    ('2019-05-25', '08:14:03', '3', '32'),
    ('2021-08-15', '21:37:09', '3', '33'),
    ('2021-05-24', '17:23:45', '1', '16'),
    ('2018-12-07', '22:48:52', '1', '17'),
    ('2021-03-14', '06:14:26', '1', '8'),
    ('2020-04-01', '03:36:00', '1', '9'),
    ('2017-02-06', '08:21:34', '7', '20'),
    ('2017-12-04', '05:33:43', '7', '21'),
    ('2017-07-27', '05:24:49', '7', '12'),
    ('2017-12-25', '01:03:57', '7', '13');
