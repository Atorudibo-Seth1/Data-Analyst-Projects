-- List all unique countries of origin in the dataset.
SELECT DISTINCT country_of_origin
FROM coffee_data;

-- Retrieve the total number of bags produced for each country of origin.
SELECT country_of_origin, SUM(number_of_bags) AS bags_produced
FROM coffee_data
GROUP BY country_of_origin;

-- Find the farms in Guatemala and list them alphabetically.
SELECT farm_name, country_of_origin
FROM coffee_data
WHERE country_of_origin = "Guatemala"
GROUP BY farm_name, country_of_origin
ORDER BY farm_name ASC;

-- Identify the top 5 countries with the highest number of bags produced.
SELECT country_of_origin, SUM(number_of_bags) AS total_bags_produced
FROM coffee_data
GROUP BY country_of_origin
ORDER BY total_bags_produced DESC
LIMIT 5;

-- Calculate the average altitude for each country of origin.
SELECT country_of_origin, ROUND(AVG(altitude), 2) AS avg_altitude
FROM coffee_data
GROUP BY country_of_origin;

-- Find the total number of bags produced by each farm.
SELECT farm_name, SUM(number_of_bags) AS bags_produced
FROM coffee_data
GROUP BY farm_name;

-- Rank the top 3 farms with the highest total bags produced in Colombia.
With colombian_farms AS (SELECT *
FROM coffee_data
WHERE country_of_origin = "Colombia")
SELECT 
	farm_name, 
    SUM(number_of_bags) AS total_bags,
    DENSE_RANK() OVER (ORDER BY SUM(number_of_bags) DESC) standings
FROM colombian_farms
GROUP BY farm_name
LIMIT 3;

-- Group the dataset by processing method and calculate the average moisture content for each group.
SELECT processing_method, ROUND(avg_moisture * 100, 2) as moisture_percentage
FROM
(SELECT processing_method, ROUND(AVG(moisture), 4) AS avg_moisture
FROM coffee_data
GROUP BY processing_method) sub;

-- Retrieve the entries where the harvest year is 2022.
SELECT *
FROM coffee_data
WHERE harvest_year = 2022;

-- List all unique harvest years in the dataset.
SELECT DISTINCT harvest_year
FROM coffee_data;

-- Find the average total cup points for each processing method.
SELECT processing_method, ROUND(AVG(total_cup_points), 2) AS avg_tcp
FROM coffee_data
GROUP BY processing_method;

-- Identify the coffee with the highest overall rating.
SELECT *
FROM coffee_data
WHERE total_cup_points =
(SELECT MAX(total_cup_points)
FROM coffee_data);

-- Calculate the average aroma rating for each certification body.
SELECT certification_body, ROUND(AVG(aroma), 2) AS avg_aroma
FROM coffee_data
GROUP BY certification_body;

-- Retrieve entries where the number of quakers is greater than 5.
SELECT *
FROM coffee_data
WHERE quakers > 5;

-- List all unique certification bodies.
SELECT DISTINCT certification_body
FROM coffee_data;

-- Calculate the average total cup points for each certification body.
SELECT certification_body, ROUND(AVG(total_cup_points), 2) AS avg_tcp
FROM coffee_data
GROUP BY certification_body;

-- Calculate the average total cup points for each variety.
SELECT variety, ROUND(AVG(total_cup_points), 2) AS tcp
FROM coffee_data
GROUP BY variety
ORDER BY tcp DESC
LIMIT 3;

-- Identify the top 3 varieties with the highest total cup points.
SELECT variety, ROUND(SUM(total_cup_points), 2) AS grand_tcp
FROM coffee_data
GROUP BY variety
ORDER BY grand_tcp DESC
LIMIT 3;

-- Retrieve entries where the region is "Antigua" or "Huehuetenango."
SELECT *
FROM coffee_data
WHERE region IN ("Antigua", "Huehuetenango");

-- List all unique regions in the dataset.
SELECT DISTINCT region
FROM coffee_data;

-- Find the farms where the owner and company are the same.
SELECT DISTINCT(farm_name), owner, company
FROM coffee_data
WHERE owner = company;

-- Calculate the average total cup points for each owner.
SELECT owner, ROUND(AVG(total_cup_points), 2) AS avg_tcp
FROM coffee_data
GROUP BY owner
ORDER BY avg_tcp DESC;

-- Identify entries where the coffee is expired (expiry date is in the past).
SELECT coffee_id, parsed_expiration, NOW() AS `today's date`
FROM coffee_data
WHERE parsed_expiration < NOW();

-- Count the number of entries for each year in the expiry date.
SELECT YEAR(parsed_expiration) AS expiry_year, COUNT(coffee_id) AS coffee_count
FROM coffee_data
GROUP BY expiry_year
ORDER BY expiry_year;

-- Find the average overall rating for entries with no defects.
SELECT ROUND(AVG(overall), 2) AS avg_no_defects
FROM coffee_data
WHERE defects = 0;

-- Retrieve entries where the moisture content is below 0.1.
SELECT coffee_id, moisture
FROM coffee_data
WHERE moisture < 0.1;

-- Calculate the average moisture content for each color category.
SELECT color, ROUND(AVG(moisture * 100), 2) AS avg_moisture
FROM coffee_data
GROUP BY color;

-- Identify entries where the number of category one defects is greater than 10.
SELECT coffee_id, category_one_defects
FROM coffee_data
WHERE category_one_defects > 10;

-- Count the number of entries for each category one defect value.
SELECT category_one_defects, COUNT(coffee_id)
FROM coffee_data
GROUP BY category_one_defects
ORDER BY category_one_defects;

-- Calculate the total number of bags produced by each certification body.
SELECT certification_body, SUM(number_of_bags)
FROM coffee_data
GROUP BY certification_body;

-- Retrieve entries where the grading date is in the year 2021.
SELECT *
FROM coffee_data
WHERE YEAR(parsed_grading_date) = 2021;

-- Calculate the average total cup points for each grading date.
SELECT YEAR(parsed_grading_date) AS grading_year, ROUND(AVG(total_cup_points), 2) AS avg_tcp
FROM coffee_data
GROUP BY grading_year;

-- Find entries where the altitude is above 1000 ft and the overall rating is above 80.
SELECT *
FROM coffee_data
WHERE altitude > 1000 AND total_cup_points > 80;

-- Calculate the average altitude for entries with an overall rating below 70.
SELECT ROUND(AVG(altitude), 2) AS avg_alt
FROM coffee_data
WHERE total_cup_points < 70;