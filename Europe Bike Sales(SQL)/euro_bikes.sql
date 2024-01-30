-- Retrieve the total revenue generated for each product category.
SELECT product_category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- List the top 5 product categories with the highest total profits.
SELECT product_category, SUM(profits) AS total_profit
FROM sales
GROUP BY product_category
ORDER BY total_profit DESC
LIMIT 5;

-- Calculate the average unit price for each sub-category.
SELECT sub_category, ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM sales
GROUP BY sub_category;

-- Identify the states where the highest order quantity was recorded.
SELECT state, COUNT(*) AS order_count
FROM sales
GROUP BY state
ORDER BY order_count DESC
LIMIT 1;

-- List the product names and their corresponding profits for products with a profit higher than $100.
SELECT product, profits
FROM sales
WHERE profits > 100
GROUP BY product, profits;

-- Calculate the total revenue for each country.
SELECT country, SUM(revenue) AS total_revenue
FROM sales
GROUP BY country
ORDER BY total_revenue DESC;

-- Find the average customer age for each product category.
SELECT product_category, AVG(customer_age) AS avg_age
FROM sales
GROUP BY product_category;

-- Retrieve the total profits for each year.
SELECT YEAR(date) AS order_year, SUM(profits) AS total_profits
FROM sales
GROUP BY order_year
ORDER BY order_year;

-- Identify the top 3 sub-categories with the highest average unit cost.
SELECT sub_category, AVG(unit_cost) AS avg_unit_cost
FROM sales
GROUP BY sub_category
ORDER BY avg_unit_cost DESC
LIMIT 3;

-- List the product names and their order quantities for products with an order quantity higher than 50.
SELECT product, SUM(order_quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING total_quantity > 50;

-- Calculate the overall profit margin (profits/revenue) for each product category.
SELECT product_category, ROUND(AVG(profits / revenue), 2) AS profit_margin
FROM sales
GROUP BY product_category;

-- Identify the top 5 states with the highest total revenue.
SELECT state, SUM(revenue) AS total_revenue
FROM sales
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 5;

-- Retrieve the total revenue and order quantity for each year.
SELECT YEAR(date) AS order_year, SUM(revenue) AS total_revenue, SUM(order_quantity) AS total_quantity
FROM sales
GROUP BY order_year
ORDER BY order_year;

-- List the product categories with more than 500 units sold in total.
SELECT product_category, SUM(order_quantity) AS total_quantity
FROM sales
GROUP BY product_category
HAVING total_quantity > 500;

-- Calculate the average unit price for each product category in the "USA."
SELECT product_category, AVG(unit_price) AS avg_unit_price
FROM sales
WHERE country = "United States"
GROUP BY product_category;

-- Identify the top 3 countries with the highest total profits.
SELECT country, SUM(profits) AS total_profit
FROM sales
GROUP BY country
ORDER BY total_profit DESC
LIMIT 3;

-- Retrieve the product names and their profits for products ordered by customers in the "Young Adults" age group.
SELECT product, SUM(profits) AS total_profit
FROM sales
WHERE age_group = "Young Adults (25-34)"
GROUP BY product
ORDER BY total_profit DESC;

-- Calculate the overall profit margin for each year.
SELECT YEAR(date) AS year, AVG(profits / revenue) AS profit_margin
FROM sales
GROUP BY year
ORDER BY year;

-- List the states where the highest revenue was recorded in the "Bikes" category.
SELECT state, product_category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY state, product_category
ORDER BY state, total_revenue DESC;

-- Retrieve the total revenue and profits for each country.
SELECT country, SUM(revenue) AS total_revenue, SUM(profits) AS total_profit
FROM sales
GROUP BY country;

WITH RankedStates AS (
  SELECT
    state,
    product_category,
    SUM(revenue) AS total_revenue,
    RANK() OVER (PARTITION BY state ORDER BY SUM(revenue) DESC) AS category_rank
  FROM
    sales
  GROUP BY
    state,
    product_category
)
SELECT state, product_category, total_revenue
FROM RankedStates
WHERE product_category = 'Bikes' AND category_rank = 1
ORDER BY state;

-- Retrieve the total revenue for each year.
SELECT YEAR(date) AS year, SUM(revenue) AS total_revenue
FROM sales
GROUP BY year
ORDER BY year;

-- Calculate the average unit price for each product in the "Accessories" category.
SELECT product, ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM sales
WHERE product_category = "Accessories"
GROUP BY product;

-- Identify the top 3 states with the highest average order quantity.
SELECT state, AVG(order_quantity) as avg_quantity
FROM sales 
GROUP BY state
ORDER BY avg_quantity DESC
LIMIT 3;

-- List the product sub-categories with the lowest total revenue.
SELECT sub_category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY sub_category
ORDER BY total_revenue
LIMIT 1;

-- Calculate the total cost, total revenue, and total profit for each product.
SELECT product, SUM(cost) AS total_cost, SUM(revenue) AS total_revenue, SUM(profits) AS total_profits
FROM sales
GROUP BY product
ORDER BY product;

-- Find the product with the highest profit margin (profit divided by revenue).
SELECT product, (profits/revenue) AS profit_margin
FROM sales
GROUP BY product, profit_margin;

-- List the countries where the total revenue is greater than the average total revenue across all countries.
SELECT country, SUM(revenue) AS total_revenue
FROM sales
GROUP BY country
HAVING total_revenue > (SELECT AVG(revenue) FROM sales);

-- Identify the top 5 products with the highest total order quantity.
SELECT product, SUM(order_quantity) AS order_quantity
FROM sales
GROUP BY product
ORDER BY order_quantity DESC
LIMIT 5;

-- Calculate the percentage contribution of each product category to the overall revenue.
SELECT product_category, (SUM(revenue) / (SELECT SUM(revenue) FROM sales) * 100) AS contribution
FROM sales
GROUP BY product_category
ORDER BY contribution DESC;

-- Retrieve the names of all products with a unit price higher than the average unit price in their respective categories.


-- List the customer genders with the highest total revenue.
SELECT customer_gender, SUM(revenue) AS total_revenue
FROM sales
GROUP BY customer_gender
ORDER BY total_revenue DESC
LIMIT 1;

-- Calculate the year-over-year growth rate of total revenue.


-- Identify the states where the "Road Bikes" category has the highest average revenue per order.
SELECT state, AVG(revenue/order_quantity) AS revenue_per_order
FROM sales
WHERE sub_category = "Road Bikes"
GROUP BY state
ORDER BY revenue_per_order DESC
LIMIT 1;

-- Calculate the average profit margin for each product category.
SELECT product_category, AVG(profits / revenue) AS avg_profit_margin
FROM sales
GROUP BY product_category;

-- Calculate the average customer age for each country.
SELECT country, AVG(customer_age) AS avg_age
FROM sales
GROUP BY country;

-- List the top 3 products with the highest profit per unit.
SELECT product, ROUND(AVG(profits / order_quantity), 2) AS profit_per_unit
FROM sales
GROUP BY product
ORDER BY profit_per_unit DESC
LIMIT 3;