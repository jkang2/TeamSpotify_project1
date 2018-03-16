--Team Spotify--
--Demi Chu, Justin Kang, Nico Paik--
CREATE DATABASE SpotifyDB;
GO

USE SpotifyDB;
GO

--creating the tables--
CREATE TABLE SpotifyUser (
	UserID int NOT NULL PRIMARY KEY,
	Username varchar(255) NOT NULL,
	Email varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL
	);

CREATE TABLE Song (
	SongID int NOT NULL PRIMARY KEY,
	SongName varchar(255) NOT NULL,
	ArtistID int NOT NULL,
	SongLength time NOT NULL
	);

CREATE TABLE Artist (
	ArtistID int NOT NULL PRIMARY KEY,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL,
	AlbumID int NOT NULL
	);

CREATE TABLE Album (
	AlbumID int NOT NULL PRIMARY KEY,
	AlbumName varchar(255) NOT NULL,
	ReleaseDate date NOT NULL,
	ArtistID int NOT NULL
	);

CREATE TABLE Rating (
	RatingID int NOT NULL PRIMARY KEY,
	ChartRating int NOT NULL,
	SongID int NOT NULL,
	UserID int NOT NULL,
	SearchID int NOT NUll
	);

CREATE TABLE Search (
	SearchID int NOT NULL PRIMARY KEY,
	SongID int NOT NULL,
	ArtistID int NOT NULL,
	AlbumID int NOT NULL
	);

--inserting data without any foreign keys--
INSERT INTO SpotifyUser(UserID, Username, Email, FirstName, LastName) VALUES
(1, 'nikobaek', 'nikobaek@hotmail.com', 'Niko', 'Baek'),
(2, 'damych0', 'damych0@hotmail.com', 'Damy', 'Cho'),
(3, 'Jostinkang133', 'jostinkang133@hotmail.com', 'Jostin', 'Kang'),
(4, 'nadiablue', 'nadiablue@hotmail.com', 'Nadia', 'Blue'),
(5, 'jennystar12', 'jennystar12@hotmail.com', 'Jenny', 'Star'),
(6, 'aliciasmith94', 'aliciasmith94@hotmail.com', 'Alicia', 'Smith'),
(7, 'benstephen.a', 'benstephen.a@hotmail.com', 'Ben', 'Stepen'),
(8, 'rogerwilliams9', 'rogerwilliams9@hotmail.com', 'Roger', 'Williams'),
(9, 'steventao8', 'steventao8@gmail.com', 'Steven', 'Tao'),
(10, 'jasonmyrah', 'jasonmyrah@gmail.com', 'Jason', 'Myrah'); 

--inserting data for data with foreign keys--
INSERT INTO Song(SongID, SongName, ArtistID, SongLength) VALUES 
(1, 'Gods Plan', '1', '03:19'),
(2, 'Psycho', '2', '03:41'),
(3, 'Look Alive', '3', '03:01'),
(4, 'SAD!', '4', '02:47'),
(5, 'All the Stars', '5', '03:52'),
(6, 'Everyday', '6', '03:25'),
(7, 'The Middle', '7', '03:05'),
(8, 'Stir Fry', '8', '3:10'),
(9, '44 More', '9', '3:09'),
(10, 'Mine', '10', '2:14');

INSERT INTO Artist(ArtistID, LastName, FirstName, AlbumID) VALUES
(1, 'N/A', 'Drake', '1'),
(2, 'Malone', 'Post', '2'),
(3, 'N/A', 'Blocboy', '3'),
(4, 'XXX', 'TENTACION', '4'),
(5, 'Lamar', 'Kendrick', '5'),
(6, 'N/A', 'Logic', '6'),
(7, 'N/A', 'ZEDD', '7'),
(8, 'N/A', 'Migos', '8'),
(9, 'N/A', 'Logic', '9'),
(10, 'N/A', 'Bazzi', '10');

INSERT INTO Album(AlbumID, AlbumName, ReleaseDate, ArtistID) VALUES
(1, 'ScaryHours', '03/12/2018', '1'),
(2, 'Dreams' , '12/02/2018', '2'),
(3, 'JB', '03/20/2018', '3'),
(4, 'Yuck', '05/11/2016', '4'),
(5, 'SZA', '10/01/2017', '5'),
(6, 'Bobby Tarantino II', '02/03/2018', '6'),
(7, 'Closer' , '12/01/2017', '7'),
(8, 'II', '11/06/2017', '8'),
(9, 'Bobby Tarantino II', '08/13/2017', '9'),
(10, 'Only', '06/19/2017', '10');

INSERT INTO Rating(RatingID, ChartRating, UserID, SongID, SearchID) VALUES
(1, '1', '1', '1', '1'),
(2, '2', '2', '2', '2'),
(3, '3', '3', '3', '3'),
(4, '4', '4', '4', '4'),
(5, '5', '5', '5', '5'),
(6, '6', '6', '6', '6'),
(7, '7', '7', '7', '7'),
(8, '8', '8', '8', '8'),
(9, '9', '9', '9', '9'),
(10, '10', '10', '10', '10');

INSERT INTO Search(SearchID, SongID, ArtistID, AlbumID) VALUES
(1, '1', '1', '1'),
(2, '2', '2', '2'),
(3, '3', '3', '3'),
(4, '4', '4', '4'),
(5, '5', '5', '5'),
(6, '6', '6', '6'),
(7, '7', '7', '7'),
(8, '8', '8', '8'),
(9, '9', '9', '9'),
(10, '10', '10', '10');
GO

--connecting primary keys to foreign keys--
ALTER TABLE Rating
ADD CONSTRAINT FK_Rating_SpotifyUser
FOREIGN KEY (UserID) REFERENCES SpotifyUser(UserID);

ALTER TABLE Rating
ADD CONSTRAINT FK_Rating_Song
FOREIGN KEY (SongID) REFERENCES Song(SongID);

ALTER TABLE Rating
ADD CONSTRAINT FK_Rating_Search
FOREIGN KEY (SearchID) REFERENCES Search(SearchID);

ALTER TABLE Search
ADD CONSTRAINT FK_Search_Song
FOREIGN KEY (SongID) REFERENCES Song(SongID);

ALTER TABLE Search
ADD CONSTRAINT FK_Search_Artist
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);

ALTER TABLE Search
ADD CONSTRAINT FK_Search_Album
FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);

ALTER TABLE Song
ADD CONSTRAINT FK_Song_Artist
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);

ALTER TABLE Artist
ADD CONSTRAINT FK_Artist_Album
FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
GO