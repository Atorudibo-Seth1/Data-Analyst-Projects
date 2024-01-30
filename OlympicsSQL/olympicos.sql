-- How many olympics games have been held?
SELECT COUNT(*) as total_games_count
FROM
(SELECT year, season
FROM athlete_events
GROUP BY year, season
ORDER BY year) s;

-- List down all Olympics games held so far.
SELECT year, season
FROM athlete_events
GROUP BY year, season
ORDER BY year;

-- Mention the total no of nations who participated in each olympics game?
SELECT games, COUNT(region) AS total_countries
FROM
	(SELECT games, region
	FROM athlete_events a 
	JOIN noc_regions n ON n.noc = a.noc
	GROUP BY games, region
	ORDER BY games) c
GROUP BY games
ORDER BY games;

-- Which nation has participated in all of the olympic games?
SELECT region, COUNT(games) AS participants
FROM 
	(SELECT region, games
	FROM athlete_events a
	JOIN noc_regions n ON a.noc = n.noc
	GROUP BY region, games
	ORDER BY region) b
GROUP BY region
ORDER BY participants DESC, region;

-- Identify the sport which was played in all summer olympics.
SELECT sport, COUNT(DISTINCT(games)) AS games_count
FROM athlete_events
WHERE season = 'Summer'
GROUP BY sport
ORDER BY games_count DESC;

-- Which Sports were just played only once in the olympics?
With GamesCount AS (SELECT sport, COUNT(DISTINCT(games)) as games_count
FROM athlete_events
GROUP BY sport)
SELECT *
FROM GamesCount
WHERE games_count = 1;

-- Fetch the total no of sports played in each olympic games.
SELECT games, COUNT(DISTINCT(sport)) AS no_of_sports
FROM athlete_events
GROUP BY games
ORDER BY no_of_sports DESC;

-- Fetch oldest athletes to win a gold medal
SELECT *
FROM athlete_events
WHERE age =
(SELECT MAX(age)
FROM athlete_events
WHERE medal = 'Gold') AND medal = 'Gold';

-- Find the Ratio of male and female athletes participated in all olympic games.
SELECT (female_count / male_count) AS ratio
FROM
(With Gender AS (SELECT distinct name, sex
FROM athlete_events)
SELECT 
	SUM(CASE WHEN sex = "M" THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN sex = "F" THEN 1 ELSE 0 END) AS female_count
FROM Gender) c;

-- Fetch the top 5 athletes who have won the most gold medals.
With GoldRankings AS (SELECT 
	name, 
    team, 
    total_gold_medals,
    DENSE_RANK() OVER(ORDER BY total_gold_medals DESC) Standings
FROM 
	(SELECT name, team, COUNT(medal) AS total_gold_medals
	FROM athlete_events
	WHERE medal = 'Gold'
	GROUP BY name, team
	ORDER BY total_gold_medals DESC) c)
SELECT *
FROM GoldRankings
WHERE Standings BETWEEN 1 AND 5;

-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
With MedalRanks AS (SELECT 
	name,
    team,
    medal_count,
    DENSE_RANK() OVER(ORDER BY medal_count DESC) Standings
FROM
(SELECT name, team, COUNT(medal) AS medal_count
FROM athlete_events
WHERE medal IN ('Gold', 'Silver', 'Bronze')
GROUP By name, team
ORDER BY medal_count DESC) temp)
SELECT *
FROM MedalRanks
WHERE Standings BETWEEN 1 AND 5;

-- Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
With MedalCount AS 
	(SELECT region, COUNT(medal) as total_medals
	FROM athlete_events a 
	JOIN noc_regions n ON a.noc = n.noc
	WHERE medal IN ('Gold', 'Silver', 'Bronze')
	GROUP BY region
	ORDER BY total_medals DESC)
SELECT 
	region, 
    total_medals,
    RANK() OVER (ORDER BY total_medals DESC) Standings
FROM MedalCount
LIMIT 5;

-- List down total gold, silver and bronze medals won by each country.
SELECT
	region AS country,
	SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) as bronze
FROM 
(SELECT medal, region
FROM athlete_events a 
JOIN noc_regions n ON a.noc = n.NOC
WHERE medal IN ('Gold', 'Silver', 'Bronze')) temp
GROUP BY region
ORDER BY gold DESC;

-- List down total gold, silver and bronze medals won by each country corresponding to each olympic games.
With TestTable AS (SELECT games, medal, region
FROM athlete_events a 
JOIN noc_regions n ON a.noc = n.NOC
WHERE medal IN ('Gold', 'Silver', 'Bronze') )
SELECT
	games,
    region AS country,
	SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze
FROM TestTable
GROUP BY games, country
ORDER BY games, country;

--  Which countries have never won gold medal but have won silver/bronze medals?
SELECT
	region AS country,
	SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) as bronze
FROM 
	(SELECT medal, region
	FROM athlete_events a 
	JOIN noc_regions n ON a.noc = n.NOC
	WHERE medal IN ('Gold', 'Silver', 'Bronze')) temp
GROUP BY region
HAVING gold = 0 AND (silver != 0 OR bronze != 0);

--  In which Sport/event, India has won highest medals.
WITH IndiaMedals AS (SELECT sport, medal
FROM athlete_events a 
JOIN noc_regions n ON a.noc = n.NOC
WHERE region = 'India' AND medal IN ('Gold', 'Silver', 'Bronze') )
SELECT sport, COUNT(medal) AS medal_count
FROM IndiaMedals
GROUP BY sport 
ORDER BY medal_count DESC
LIMIT 1;

--  Break down all olympic games where India won medal for Hockey and how many medals in each olympic games
WITH IndiaMedals AS (SELECT team, sport, games, medal
FROM athlete_events a 
JOIN noc_regions n ON a.noc = n.NOC
WHERE region = 'India' AND medal IN ('Gold', 'Silver', 'Bronze') )
SELECT team, sport, games, COUNT(medal) AS medal_count
FROM IndiaMedals
GROUP BY team, sport, games 
ORDER BY medal_count DESC;