-- Fetch all the entries in the movies table
SELECT *
FROM movies;

-- Fetch all movies that have runtimes equal to the max runtime of all moviews
SELECT *
FROM movies
WHERE Runtime = (SELECT MAX(Runtime) FROM movies);

-- Find the average IMDB rating for each age group
SELECT Age, ROUND(AVG(IMDb), 2) AS AvgIMDbRating
FROM movies
GROUP BY Age;

-- Fetch all the unique country values where the movies are released 
SELECT COUNT(DISTINCT(Country))
FROM movies;

-- Retrieve the movie title(s) and Rotten Tomatoes ratings for movies with the highest Rotten Tomatoes rating
SELECT Title, RottenTomatoes
FROM movies
WHERE RottenTomatoes = (SELECT MAX(RottenTomatoes) FROM movies)
ORDER BY Title;

-- List the average IMDB rating for each movie genre
SELECT Genres, ROUND(AVG(IMDb), 2) AS AvgIMDb, ROUND(AVG(RottenTomatoes), 2) AS AvgRottenTomatoes
FROM movies
GROUP BY Genres;

-- Write a query to select all the columns for the first 10 rows in the dataset.
SELECT *
FROM movies
LIMIT 10;

-- Retrieve all movies released in the year 2010.
SELECT Title, Year
FROM movies
WHERE Year = 2010;

-- Find the movies with an IMDB rating greater than or equal to 8.0.
SELECT Title, IMDb
FROM movies
WHERE IMDb >= 8;

-- List movies available on Netflix (Netflix column value is 1).
SELECT Title
FROM movies
WHERE Netflix = 1;

-- Identify the movie with the longest runtime.
SELECT MAX(Runtime) AS LongestMovie
FROM movies;

-- Select the titles of movies released in 2015.
SELECT Title
FROM movies
WHERE Year = 2015;

-- Retrieve movies with an IMDb rating greater than 9.0 and a Rotten Tomatoes rating of at least 90.
SELECT *
FROM movies
WHERE IMDb > 9 AND RottenTomatoes >= 90;

-- List the titles of movies available on Hulu.
SELECT Title
FROM movies
WHERE Hulu = 1;

-- Select the titles and runtimes of movies longer than 3 hours (180 minutes).
SELECT Title, Runtime
FROM movies
WHERE Runtime > 180;

-- Find the titles of movies released between 2000 and 2010.
SELECT Title, Year
FROM movies
WHERE Year BETWEEN 2000 AND 2010;

-- Retrieve the titles and IMDb ratings of movies available on Netflix.
SELECT Title, IMDb
FROM movies
WHERE Netflix = 1;

-- Find the titles and directors of movies available on Prime Video and Hulu.
SELECT *
FROM movies
WHERE PrimeVideo = 1 OR Hulu = 1;

-- Get the titles and years of the top 10 movies with the highest IMDb ratings.
SELECT Title, Year
FROM movies
ORDER BY IMDb DESC
LIMIT 10;

-- Find the titles and countries where movies were released in the United States.
SELECT Title, Country
FROM movies
WHERE Country REGEXP "United States";

-- Find the top 10 movies with the highest IMDb ratings.
SELECT *
FROM movies
ORDER BY IMDb DESC
LIMIT 10;

-- List the titles and directors of movies available on Netflix or Hulu.
SELECT Title, Directors
FROM movies
WHERE Netflix = 1 OR Hulu = 1;

-- Find movies released in the United States between 2010 and 2020 with an IMDb rating of at least 7.
SELECT *
FROM movies
WHERE Country LIKE "%United States%" AND Year BETWEEN 2010 AND 2020 AND IMDb >= 7;

-- Count how many movies are available on Prime Video.
SELECT COUNT(*) As AvailableOnPrime
FROM movies
WHERE PrimeVideo = 1;

-- Find the average IMDb rating of movies available on Netflix.
SELECT ROUND(AVG(IMDb), 2) AS NetflixIMDbAvg
FROM movies
WHERE Netflix = 1;

-- Retrieve the titles and IMDb ratings of movies released in 2015.
SELECT Title, IMDb
FROM movies
WHERE Year = 2015;

-- Find the titles of movies with IMDb ratings greater than 8 and Rotten Tomatoes ratings greater than or equal to 90.
SELECT Title
FROM movies
WHERE IMDb > 8 AND RottenTomatoes >= 90;

-- Find the titles of movies available on Hulu (Hulu = 1).
SELECT Title
FROM movies
WHERE Hulu = 1;

-- Retrieve the titles and runtimes of movies with runtimes longer than 180 minutes.
SELECT Title, Runtime
FROM movies
WHERE Runtime > 180;

-- Get the titles and countries for movies released in the United States.
SELECT Title, Country
FROM movies
WHERE Country LIKE "%United States%";

-- Retrieve the titles of movies released in the same year as the movie "Inception."
SELECT Title
FROM movies
WHERE Year = (SELECT Year FROM movies WHERE Title = "Inception");

-- Find the directors of movies with an IMDb rating greater than the average IMDb rating of all movies.
SELECT Directors, IMDb
FROM movies
WHERE IMDb > (SELECT AVG(IMDb) FROM movies);

-- Get the titles of movies that are available on both Prime Video and Hulu.
SELECT Title
FROM movies
WHERE PrimeVideo = 1 AND Hulu = 1;

-- Find the titles of movies released in the same year as "The Dark Knight."
SELECT Title, Year
FROM movies
WHERE Year = (SELECT Year FROM movies WHERE Title = "The Dark Knight");

-- Get the average IMDb rating of movies directed by Quentin Tarantino.
SELECT ROUND(AVG(IMDb), 2) AS TarantinoAVG
FROM movies
WHERE Directors LIKE "%Quentin Tarantino%";

-- Find the average IMDb rating for movies released each year. Display the year and the average rating.
SELECT Year, ROUND(AVG(IMDb), 2) AS YearlyIMDbAvg
FROM movies
GROUP BY Year;

-- Count the number of movies released in each country. Display the country and the count of movies.
SELECT Country, COUNT(ID) AS movie_count
FROM movies
GROUP BY Country
ORDER BY movie_count DESC;

-- Count the number of movies released in each country. Display the country and the count of movies.
SELECT Country, COUNT(Title)
FROM movies
GROUP BY Country;

-- Determine the maximum runtime for movies in each genre. Display the genre and the maximum runtime.
SELECT Genres, MAX(Runtime) AS Runtimes
FROM movies
GROUP BY Genres;

-- Count the total number of movies available on each streaming service (Netflix, Hulu, Prime Video, Disney+). Display the streaming service and the count.
SELECT 'Netflix' AS StreamingService, COUNT(*) AS MovieCount
FROM movies
WHERE Netflix = 1
UNION
SELECT 'Hulu' AS StreamingService, COUNT(*) AS MovieCount
FROM movies
WHERE Hulu = 1
UNION
SELECT 'Prime Video' AS StreamingService, COUNT(*) AS MovieCount
FROM movies
WHERE PrimeVideo = 1;

-- Calculate the average IMDb rating for movies in different age ranges. Display the age range and the average rating.
SELECT Age, ROUND(AVG(IMDb), 2) AS AvgIMDb
FROM movies
GROUP BY Age;

-- Find the top 5 directors with the highest average IMDb rating. Display the director's name and their average rating.
SELECT Directors, ROUND(AVG(IMDb),2) AS AvgIMDb
FROM movies
GROUP BY Directors
ORDER BY AvgIMDb DESC
LIMIT 5;

-- Find the top 5 genres with the longest average runtime. Display the genre and the average runtime.
SELECT Genres, ROUND(AVG(Runtime), 2) AS AvgRuntimes
FROM movies
GROUP BY Genres
ORDER BY AvgRuntimes DESC 
LIMIT 5;

-- Display the count of movies for each age group available on Netflix. Include the age group and the count.
SELECT Age, COUNT(*) as NetflixAgeSplit
FROM movies
WHERE Netflix = 1
GROUP BY Age;

-- Find all the movies released in the year with the highest average IMDb rating. Display the movie title and IMDb rating.
SELECT *
FROM movies
WHERE Year = 
	(SELECT Year
	FROM movies
	GROUP BY Year
	ORDER BY AVG(IMDb) DESC
	LIMIT 1);

-- Find movies that are available on all streaming platforms (Netflix, Hulu, Prime Video, and Disney+). Display the movie title.
SELECT Title
FROM movies
WHERE Netflix = 1 AND Hulu = 1 AND PrimeVideo = 1 AND `Disney+` = 1;

-- Calculate the average IMDb rating for movies available on each streaming service (Netflix, Hulu, Prime Video, and Disney+). Display the streaming service and the average IMDb rating.
SELECT 'Netflix' AS StreamingService, AVG(IMDb)
FROM movies
WHERE Netflix = 1
UNION
SELECT 'Hulu' AS StreamingService, AVG(IMDb)
FROM movies
WHERE Hulu = 1
UNION
SELECT 'Prime Video' AS StreamingService, AVG(IMDb)
FROM movies
WHERE PrimeVideo = 1
UNION
SELECT 'Disney+' AS StreamingService, AVG(IMDb)
FROM movies
WHERE `Disney+` = 1;

-- Count the number of movies directed by each director. Display the director's name and the count of movies they directed.
SELECT Directors, COUNT(Title) AS MovieCount
FROM movies
GROUP BY Directors;

-- Find the top 5 countries with the highest number of movies. Display the country and the count of movies.
SELECT Country, COUNT(Title) AS MovieCount
FROM movies
GROUP BY Country
ORDER BY MovieCount DESC
LIMIT 5;

-- Count the number of movies released each year. Display the release year and the count of movies released in that year.
SELECT Year, COUNT(Title) AS MovieCount
FROM movies
GROUP BY Year;

-- Find the titles and runtimes of the top 3 movies with the longest runtimes for each age rating category.
WITH RankedMovies AS (
  SELECT
    Title,
    Runtime,
    Age,
    ROW_NUMBER() OVER (PARTITION BY Age ORDER BY Runtime DESC) AS Standings
  FROM movies
)
SELECT Title, Runtime, Age
FROM RankedMovies
WHERE Standings <= 3;
