SELECT *
FROM race_stats;

-- How many States were represented in the race?
SELECT COUNT(DISTINCT State) AS StateCount
FROM race_stats;

-- What was the average of Men vs Women?
SELECT Gender, AVG(Total_Minutes) AS avg_times
FROM race_stats
GROUP BY Gender;

-- What were the youngest and oldest ages in the race?
SELECT Gender, MIN(Age) AS youngest, MAX(Age) AS oldest
FROM race_stats
GROUP BY Gender;

-- What was the avergae time for each age group?
WITH age_buckets AS (SELECT Total_Minutes,
	CASE WHEN Age < 30 THEN 'age_20-29'
		 WHEN Age < 40 THEN 'age_30-39'
         WHEN Age < 50 THEN 'age_40-49'
         WHEN Age < 60 THEN 'age_50-59'
	ELSE 'age_60+' END AS age_group
FROM race_stats)
SELECT age_group, ROUND(AVG(Total_Minutes), 2) AS avg_times
FROM age_buckets
GROUP BY age_group
ORDER BY avg_times ASC;

-- Top 3 males and females
WITH top3 AS (SELECT 
	fullname,
    Total_Minutes,
    Gender,
    RANK() OVER (PARTITION BY Gender ORDER BY Total_Minutes ASC) AS Standings
FROM race_stats
GROUP BY fullname, Total_Minutes, Gender)
SELECT *
FROM top3
WHERE Standings <= 3
ORDER BY Total_Minutes;
