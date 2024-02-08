-- Retrieve the total number of orders in the dataset.
SELECT COUNT(*) FROM superstore;

-- Find the average sales amount per order.
SELECT ROUND(AVG(Sales), 2) AS AvgSales
FROM superstore;

-- Identify the top 5 customers with the highest total sales.
SELECT `Customer Name`, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY `Customer Name`
ORDER BY TotalSales DESC
LIMIT 5;

-- List the unique product categories available in the dataset.
SELECT DISTINCT(Category) 
FROM superstore;

-- Calculate the total profit for each product category.
SELECT Category, ROUND(SUM(Profit), 2) AS CategoryProfit
FROM superstore
GROUP by Category;

-- Retrieve the total quantity of products sold in each region.
SELECT `Country/Region`, SUM(Quantity) AS TotalUnits
FROM superstore
GROUP BY `Country/Region`;

-- Find the top 3 cities with the highest average sales per order.
SELECT City, ROUND(AVG(Sales), 2) AS CityAvgSales
FROM superstore
GROUP BY City
ORDER BY CityAvgSales DESC
LIMIT 3;

-- List the product sub-categories with more than 1,000 units sold.
SELECT *
FROM 
(SELECT `Sub-Category`, SUM(Quantity) AS UnitsSold
FROM superstore
GROUP BY `Sub-Category`) sub
WHERE UnitsSold > 1000
ORDER BY UnitsSold DESC;

-- Calculate the average discount for each product category.
SELECT Category, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY Category;

-- Identify the top 5 states with the highest total profit.
SELECT State, ROUND(SUM(Profit), 2) AS StateProfits
FROM superstore
GROUP BY State
ORDER BY StateProfits DESC
LIMIT 5;

-- Retrieve the total sales, quantity, and profit for each product category and sub-category.
SELECT Category, `Sub-Category`, ROUND(SUM(Sales), 2) AS TotalSales, SUM(Quantity) AS TotalUnits, ROUND(SUM(Profit), 2) AS TotalProfits 
FROM superstore
GROUP BY Category, `Sub-Category`
ORDER BY Category;

-- Find the customer who made the highest single order (based on sales amount).
SELECT `Customer Name`, `Order ID`, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY `Customer Name`, `Order ID`
ORDER BY TotalSales DESC
LIMIT 1;

-- Calculate the total sales and profit for each year.
SELECT YEAR(`Order Date`) AS OrderYear, ROUND(SUM(Sales), 2) AS YearlySales, ROUND(SUM(Profit), 2) AS YearlyProfit
FROM superstore
GROUP BY OrderYear
ORDER BY OrderYear;

-- Identify the top 3 product names with the highest total sales.
SELECT `Product Name`, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalSales DESC
LIMIT 3;

-- List the states where the average discount is greater than 15%.
SELECT *
FROM 
(SELECT State, AVG(Discount) AS AvgDiscount
FROM superstore
GROUP BY State) t
WHERE AvgDiscount > 0.15
ORDER BY AvgDiscount DESC;

-- Retrieve the total sales, quantity, and profit for each segment and region.
SELECT Region, Segment, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Sales), 2) AS TotalProfit, SUM(Quantity) AS TotalUnits
FROM superstore
GROUP BY Region, Segment
ORDER BY Region;

-- Retrieve the top 5 customers with the highest average discount.
SELECT `Customer Name`, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY `Customer Name`
ORDER BY AvgDiscount DESC
LIMIT 5;

-- Calculate the total sales, quantity, and profit for each product category and sub-category in the Central region.
SELECT Category, `Sub-Category`, ROUND(SUM(Sales), 2) AS CentralSales, ROUND(SUM(Profit), 2) AS CentralProfits, SUM(Quantity) AS CentralUnits
FROM
(SELECT *
FROM superstore
WHERE Region = "Central") c
GROUP BY Category, `Sub-Category`
ORDER BY Category, `Sub-Category`;

-- Identify the top 3 cities with the highest total sales.
SELECT City, ROUND(SUM(Sales), 2) AS TotalCitySales
FROM superstore
GROUP BY City
ORDER BY TotalCitySales DESC
LIMIT 3;

-- List the product sub-categories with the highest average profit.
SELECT MAX(AvgProfit)
FROM
(SELECT `Sub-Category`, ROUND(AVG(Profit), 2) AS AvgProfit
FROM superstore
GROUP BY `Sub-Category`) ap;

-- Find the years with the highest and lowest average discount across all orders.
SELECT YEAR(`Order Date`) AS OrderYear, AVG(Discount)
FROM superstore
GROUP BY OrderYear
ORDER BY AVG(Discount) DESC
LIMIT 1;

SELECT YEAR(`Order Date`) AS OrderYear, AVG(Discount)
FROM superstore
GROUP BY OrderYear
ORDER BY AVG(Discount) 
LIMIT 1;

-- Retrieve the product sub-category with the lowest average discount.
-- WITH cte1 AS
-- (SELECT `Sub-Category`, AVG(Discount) AS AvgDiscount
-- FROM superstore
-- GROUP BY `Sub-Category`)
-- SELECT MIN(AvgDiscount) 
-- FROM cte1

-- Retrieve the product sub-category with the lowest average discount.
SELECT `Sub-Category`, AVG(Discount) AS AvgDiscount
FROM superstore
GROUP BY `Sub-Category`
ORDER BY AvgDiscount 
LIMIT 1;

-- Calculate the total sales, quantity, and profit for each product category and sub-category where the average discount is greater than 10%.
SELECT Category, `Sub-Category`, AvgDiscount
FROM
(SELECT Category, `Sub-Category`, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Sales), 2) AS TotalProfits, SUM(Quantity) AS TotalUnits, AVG(Discount) as AvgDiscount
FROM superstore
GROUP BY Category, `Sub-Category`
ORDER BY Category) s
WHERE AvgDiscount > 0.10;

-- Identify the top 3 customers who made the most orders (based on the number of orders placed).
SELECT `Customer Name`, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY `Customer Name`
ORDER BY OrderCount DESC;

-- List the states where the total sales are greater than $100,000.
SELECT *
FROM
(SELECT State, ROUND(SUM(Sales), 2) AS StateSales
FROM superstore
GROUP BY State) sales
WHERE StateSales > 100000
ORDER BY StateSales DESC;

-- Find the years with the highest and lowest total profit.
SELECT YEAR(`Order Date`) AS OrderYear, ROUND(SUM(Profit), 2) AS TotalProfit
FROM superstore
GROUP BY OrderYear
ORDER BY TotalProfit DESC
LIMIT 1;

SELECT YEAR(`Order Date`) AS OrderYear, ROUND(SUM(Profit), 2) AS TotalProfit
FROM superstore
GROUP BY OrderYear
ORDER BY TotalProfit
LIMIT 1;

-- Retrieve the total sales, quantity, and profit for each segment and region.
SELECT Region, Segment, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfits, SUM(Quantity) AS TotalUnits
FROM superstore
GROUP BY Region, Segment
ORDER BY Region;

-- Retrieve the top 5 customers with the highest average discount.
SELECT `Customer Name`, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY `Customer Name`
ORDER BY AvgDiscount DESC
LIMIT 5;

-- Calculate the total sales, quantity, and profit for each product category and sub-category in the Central region.
SELECT Category, `Sub-Category`, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfits, SUM(Quantity) AS TotalUnits
FROM 
(SELECT *
FROM superstore
WHERE Region = "Central") central
GROUP BY Category, `Sub-Category`
ORDER BY Category;

-- Identify the top 3 cities with the highest total sales.
SELECT City, ROUND(SUM(Sales), 2) AS CitySales
FROM superstore
GROUP BY City
ORDER BY CitySales DESC
LIMIT 3;

-- List the product sub-categories with the highest average profit.
SELECT `Sub-Category`, ROUND(AVG(Profit), 2) AS AvgProfit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY AvgProfit DESC
LIMIT 1;

-- Calculate the average discount for each year.
SELECT YEAR(`Order Date`) AS OrderYear, AVG(Discount) AS AvgDiscount
FROM superstore
GROUP BY OrderYear
ORDER BY OrderYear;

-- Retrieve the total sales, quantity, and profit for each product category and sub-category where the average discount is greater than 10%
SELECT Category, `Sub-Category`, TotalSales, TotalProfits, TotalUnits, AvgDiscount
FROM 
(SELECT Category, `Sub-Category`, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfits, SUM(Quantity) AS TotalUnits, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY Category, `Sub-Category`
ORDER BY Category) tb
WHERE AvgDiscount > 0.10;

-- Retrieve the top 5 products (Product Name) with the highest total quantity sold.
SELECT `Product Name`, SUM(Quantity) AS TotalUnitsSold
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalUnitsSold DESC
LIMIT 5;

-- Calculate the average discount for each region, rounded to two decimal places.
SELECT Region, ROUND(AVG(Discount), 2) AS RegionalDiscounts
FROM superstore
GROUP BY Region
ORDER BY Region;

-- List the products (Product Name) where both total sales and total profit are greater than $10,000.
SELECT `Product Name`, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfits
FROM superstore
GROUP BY `Product Name`
HAVING TotalSales > 10000 AND TotalProfits > 10000
ORDER BY `Product Name`;

-- Identify the product categories with total sales less than $5,000.
SELECT Category, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY Category
HAVING TotalSales < 5000;

-- Find the order ID(s) with the maximum total profit.
SELECT `Order ID`, ROUND(SUM(Profit), 2) AS TotalProfits
FROM superstore
GROUP BY `Order ID`
ORDER BY TotalProfits DESC
LIMIT 1;

-- Calculate the average discount for each product category, ordered by the highest average discount first.
SELECT Category, ROUND(AVG(Discount), 2) AS CategoryDiscounts
FROM superstore
GROUP BY Category
ORDER BY CategoryDiscounts DESC;

-- Determine the percentage increase in total sales from the year 2017 to 2018 for each region.
SELECT
    Region,
    ((SUM(CASE WHEN YEAR(`Order Date`) = 2018 THEN Sales ELSE 0 END) -
    SUM(CASE WHEN YEAR(`Order Date`) = 2017 THEN Sales ELSE 0 END)) /
    SUM(CASE WHEN YEAR(`Order Date`) = 2017 THEN Sales ELSE 0 END)) * 100 AS SalesIncreasePercentage
FROM
    superstore
WHERE
    YEAR(`Order Date`) IN (2017, 2018)
GROUP BY
    Region;
    
-- List the top 3 customers (Customer Name) with the highest number of orders placed.
SELECT `Customer Name`, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY `Customer Name`
ORDER BY OrderCount DESC
LIMIT 3;

-- Analyze the impact of discount on profitability by calculating the average profit for orders with and without a discount.
SELECT 
	ROUND(AVG(CASE WHEN Discount = 0 THEN Profit ELSE 0 END), 2) AS WithoutDiscount,
    ROUND(AVG(CASE WHEN Discount != 0 THEN Profit ELSE 0 END), 2) AS WithDiscount
FROM superstore;

-- Identify the cities where the average profit per order is less than $50.
SELECT City, ROUND(AVG(Profit), 2) AS AvgProfit
FROM superstore
GROUP BY City
HAVING AvgProfit < 50
ORDER BY AvgProfit DESC;

-- Retrieve the total sales for each product category.
SELECT Category, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY Category;

-- Calculate the average quantity of products sold per order.
SELECT `Order ID`, ROUND(AVG(Quantity), 2) AS AvgOrderQuantity
FROM superstore
GROUP BY `Order ID`
ORDER BY AvgOrderQuantity DESC;

-- Identify the top 3 states with the highest average discount.
SELECT State, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY State
ORDER BY AvgDiscount DESC;

-- Count the number of orders placed in each year.
SELECT YEAR(`Order Date`) AS OrderYear, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY OrderYear;

-- Identify the most and least profitable cities based on total profit.
SELECT City, ROUND(SUM(Profit), 2) AS TotalProfit
FROM superstore
GROUP BY City
ORDER BY TotalProfit DESC
LIMIT 1;
-- least profitable city
SELECT City, ROUND(SUM(Profit), 2) AS TotalProfit
FROM superstore
GROUP BY City
ORDER BY TotalProfit 
LIMIT 1;

-- Count the number of orders placed in each region.
SELECT Region, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY Region;

-- Retrieve the top 5 products (Product Name) with the highest total quantity sold.
SELECT `Product Name`, SUM(Quantity) as UnitsSold
FROM superstore
GROUP BY `Product Name`
ORDER BY UnitsSold DESC
LIMIT 5;

-- Calculate the average profit for each product category.
SELECT Category, ROUND(AVG(Profit), 2) AS AvgProfit
FROM superstore
GROUP BY Category;

-- Retrieve details of orders where the discount applied is greater than 15%.
SELECT `Order ID`, ROUND(SUM(Discount), 2) AS Discounts
FROM superstore
GROUP BY `Order ID`
HAVING Discounts > 0.15
ORDER BY Discounts DESC;

-- Retrieve the average quantity of products sold per order for each product category.
SELECT Category, AVG(Quantity) AS AvgQuantity
FROM superstore
GROUP BY Category;

-- Calculate the percentage increase in total profit from the year 2019 to 2020 for each region.
SELECT Region,
	ROUND((SUM(CASE WHEN YEAR(`Order Date`) = 2020 THEN Profit END) -
    SUM(CASE WHEN YEAR(`Order Date`) = 2019 THEN Profit END)) /
    SUM(CASE WHEN YEAR(`Order Date`) = 2019 THEN Profit END) * 100, 2) AS ProfitGrowth
FROM superstore
GROUP BY Region;

-- Determine the average sales amount for orders with a discount and without a discount. Compare the impact of discounts on sales.
SELECT 
	ROUND(AVG(CASE WHEN Discount = 0 THEN Sales ELSE 0 END), 2) AS SalesWithoutDiscount,
    ROUND(AVG(CASE WHEN Discount != 0 THEN Sales ELSE 0 END), 2) AS SalesWithDiscount
FROM superstore;

-- Calculate the average discount for each product category and list them in descending order.
SELECT Category, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM superstore
GROUP BY Category
ORDER BY AvgDiscount DESC;

-- Find the most preferred shipping mode (mode with the highest order count).
SELECT `Ship Mode`, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY `Ship Mode`
ORDER BY OrderCount DESC
LIMIT 1;

-- Identify the top 5 customers with the highest total sales.
SELECT `Customer Name`, ROUND(SUM(Sales), 2) AS TotalSales
FROM superstore
GROUP BY `Customer Name`
ORDER BY TotalSales DESC
LIMIT 5;

-- Retrieve the product with the lowest average profit.
SELECT `Product Name`, ROUND(AVG(Profit), 2) AS AvgProfit
FROM superstore
GROUP BY `Product Name`
ORDER BY AvgProfit
LIMIT 1;

-- Retrieve the months with the highest and lowest total sales. Provide the total sales for each of these months.
-- lowest total sales.
SELECT MONTH(`Order Date`) AS OrderMonth, ROUND(SUM(Sales), 2) AS MonthlySales
FROM superstore
GROUP BY OrderMonth
ORDER BY MonthlySales
LIMIT 1;

-- highest sales.
SELECT MONTH(`Order Date`) AS OrderMonth, ROUND(SUM(Sales), 2) AS MonthlySales
FROM superstore
GROUP BY OrderMonth
ORDER BY MonthlySales DESC
LIMIT 1;

-- Identify the product categories with the highest and lowest average profit margin. (Profit Margin = (Profit / Sales) * 100)
SELECT Category, ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS ProfitCategory
FROM superstore
GROUP BY Category
ORDER BY ProfitCategory
LIMIT 1;

SELECT Category, ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS ProfitCategory
FROM superstore
GROUP BY Category
ORDER BY ProfitCategory DESC
LIMIT 1;

-- Determine the preferred shipping mode for each region based on the highest order count.
SELECT Region, `Ship Mode`, COUNT(DISTINCT(`Order ID`)) AS OrderCount
FROM superstore
GROUP BY Region, `Ship Mode`;

-- Analyze the impact of discounts on the quantity of products sold. Calculate the average quantity for orders with and without discounts.
SELECT 
	AVG(CASE WHEN Discount = 0 THEN Quantity ELSE 0 END) AS WithoutDiscount,
    AVG(CASE WHEN Discount != 0 THEN Quantity ELSE 0 END) AS WithDiscount
FROM superstore;

-- Identify the top 3 cities with the highest and lowest average order values. (Order Value = Sales - Discount)
SELECT City, ROUND(AVG(Sales - Discount), 2) AS OrderValues
FROM superstore
GROUP BY City
ORDER BY OrderValues DESC
LIMIT 3;

SELECT City, ROUND(AVG(Sales - Discount), 2) AS OrderValues
FROM superstore
GROUP BY City
ORDER BY OrderValues
LIMIT 3;

-- Retrieve orders that consist of more than one product. Provide the order ID and the number of unique products in each order.
SELECT *
FROM
(SELECT `Order ID`, COUNT(DISTINCT(`Product Name`)) AS ProductCount
FROM superstore
GROUP BY `Order ID`) products
WHERE ProductCount > 1;

-- Determine the average number of unique products sold per order for each product category.
SELECT Category, AVG(ProductCount)
FROM
(SELECT Category, `Order ID`, COUNT(DISTINCT(`Product ID`)) AS ProductCount
FROM superstore
GROUP BY Category, `Order ID`) C
GROUP BY Category;

-- Analyze if there are any seasonal sales patterns by calculating the total sales for each quarter of the year.
SELECT YEAR(`Order Date`) AS OrderYear, QUARTER(`Order Date`) AS QuarterYear, ROUND(SUM(Sales), 2) AS QuarterlySales
FROM superstore
GROUP BY OrderYear, QuarterYear
ORDER BY OrderYear, QuarterYear;

-- Identify the top 2 most profitable sub-categories for each region.
WITH RankedSubs AS (SELECT Region, `Sub-Category`, SUM(Profit) AS RegionalProfits,
ROW_NUMBER() OVER (PARTITION BY Region ORDER BY SUM(Profit) DESC) AS Standings
FROM superstore
GROUP BY Region, `Sub-Category`)
SELECT
    Region,
    `Sub-Category`,
    RegionalProfits
FROM
    RankedSubs
WHERE
    Standings <= 2;