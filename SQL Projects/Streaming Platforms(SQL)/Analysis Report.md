# European Bike Store Sales
## Table of Contents
- [Project Overview](#project-overview)
- [Exploratory Questions](#exploratory-questions)
- [Skills Demonstrated](#skills-demonstrated)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning](#data-cleaning)
- [Data Analysis](#data-analysis)
- [Findings](#findings)
- [Summary](#summary)

### Project Overview
---
This was one of my earlier data analysis projects and it was carried out to help me improve my skills in data analytics with regards to SQL. The aim of this project was to query the data about movies on streaming platforms such as Netflix, Hulu, PrimeVideo and Disney+ and find interesting insights contained in it.
### Exploratory Questions
---
1. What is the average IMDB rating for each age group?
2. What is the longest movie available?
3. What are the top 10 movies with the highest IMDb ratings?
4. How many movies have been released across the various countries?
5. What is the total number of movies available on each streaming service (Netflix, Hulu, Prime Video, Disney+)
### Skils Demonstrated
---
- Critical Thinking
- Problem Solving
- Writing functional SQL queries
### Data Sources
---
The data can be found in the [MoviesOnStreamingPlatforms_updated.csv](MoviesOnStreamingPlatforms_updated.csv) file
### Tools Used
---
- MySQL
### Data Cleaning
---
The data was relatively clean and ready to use.
## Data Analysis
This section covers a glimpse of some of the queries I wrote as well as some screenshots and a brief summary of the general findings I was able to extract through my analysis.

**N.B**: All the queries I wrote can be found in the [streaming.sql](streaming.sql) file.
### Findings
---
1. What is the average IMDB rating for each age group?
   ```sql
   SELECT Age, ROUND(AVG(IMDb), 2) AS AvgIMDbRating
   FROM movies
   GROUP BY Age;
   ```
   <p align="center">
      <img src="agegroupIMDB.png">
   </p>
3. What is the longest movie available?
   ```sql
   SELECT *
   FROM movies
   WHERE Runtime = (SELECT MAX(Runtime) FROM movies);
   ```
   <p align="center">
      <img src="longestmovie.png">
   </p>
5. What are the top 10 movies with the highest IMDb ratings?
   ```sql
   SELECT Title, IMDb, Year
   FROM movies
   ORDER BY IMDb DESC
   LIMIT 10;
   ```
   <p align="center">
      <img src="top10IMDB.png">
   </p>
7. How many movies have been released across the various countries?
   ```sql
   SELECT Country, COUNT(ID) AS movie_count
   FROM movies
   GROUP BY Country
   ORDER BY movie_count DESC;
   ```
   <p align="center">
      <img src="countrymoviecount.png">
   </p>
9. What is the total number of movies available on (Netflix, Hulu, Prime Video)?
   ```sql
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
   ```
   <p align="center">
      <img src="platformcount.png">
   </p>
### Summary
---
