--Team Spotify--
--Demi Chu, Justin Kang, Nico Paik--

USE SpotifyDB;

--Multiple SELECT * queries to display all the records from each table (Suppose the database has 4 tables, you should create 4 queries for this requirement)--
SELECT *
FROM SpotifyUser;

SELECT *
FROM Song;

SELECT *
FROM Artist;

SELECT *
FROM Album;

SELECT *
FROM Rating;

--A query that uses aggregate function--
SELECT
COUNT (Song.SongID) AS 'The number of songs on the current database'
FROM Song

--A query that selects records from two (or multiple) tables using INNER JOIN--
SELECT Album.AlbumName, Artist.LastName, Artist.FirstName
FROM Album
	INNER JOIN Artist
	ON Album.AlbumID = Artist.AlbumID
ORDER BY Artist.LastName ASC;

--A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN)--
--Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessity--
--If it could not, you need to go back to part 2 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data--
SELECT Song.SongName, Artist.LastName, Artist.FirstName, Rating.ChartRating
FROM Song
	LEFT OUTER JOIN Rating
	ON Song.SongID = Rating.SongID
	INNER JOIN Artist
	ON Artist.AlbumID = Song.ArtistID
ORDER BY Rating.ChartRating ASC;

--Doing a left outer join in this case is needed to find all the songs that are in the top 10 chart rankings--
--Doing an inner join will connect all the songs with Artist names that are part of the top 10 chart rankings--

--A query that uses subquery--
SELECT Song.SongName, Rating.ChartRating
FROM Song
	JOIN Rating
	ON Song.SongID = Rating.SongID
WHERE Rating.ChartRating > (SELECT AVG(Rating.ChartRating) FROM Rating)
ORDER BY Rating.ChartRating DESC;
