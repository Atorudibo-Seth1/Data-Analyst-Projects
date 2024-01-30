-- Retrieve the names of all customers in the state of California (CA).
SELECT first_name, last_name
FROM customers
WHERE state = "CA";

-- Calculate the total sales (quantity * list price) for each order.
SELECT o.order_id, ROUND(SUM(oi.list_price * oi.quantity), 2) AS sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY sales DESC;

-- Find the average quantity ordered for each product category.
SELECT c.category_name, AVG(oi.quantity) AS avg_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Identify the top 3 stores with the highest total sales.
SELECT s.store_name, ROUND(SUM(oi.list_price * oi.quantity), 2) as total_sales
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_sales DESC
LIMIT 3;

-- Retrieve the names of products and their respective brands for products with a list price lower than $500.
SELECT b.brand_name, p.product_name, p.list_price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
WHERE p.list_price < 500
GROUP BY b.brand_name, p.product_name, p.list_price
ORDER BY b.brand_name, p.product_name;


-- Calculate the total quantity of each product ordered.
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- Retrieve the names of all customers who placed an order in the year 2017.
SELECT c.first_name, c.last_name, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2017;

-- List the product names and their respective brands for products with a model year of 2018.
SELECT b.brand_name, p.product_name
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
WHERE p.model_year = 2018 
GROUP BY b.brand_name, p.product_name
ORDER BY b.brand_name, p.product_name;

-- Calculate the average discount for each product category.
SELECT c.category_name, ROUND(AVG(oi.discount), 3) AS avg_discount
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;


-- Identify the store with the highest total sales.
SELECT s.store_name, ROUND(SUM(oi.list_price * oi.quantity), 2) as total_sales
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_sales DESC
LIMIT 1;

-- Retrieve the names of all products with a list price higher than the average list price across all products.
SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products);

-- List the customers who have placed the most orders.
SELECT c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY order_count DESC;

-- Find the total quantity of each product in stock in the store with the name "Santa Cruz Bikes".
SELECT p.product_name, SUM(s.quantity) AS quantity_in_stock
FROM products p
JOIN stocks s ON p.product_id = s.product_id
JOIN stores st ON s.store_id = st.store_id
WHERE st.store_name = "Santa Cruz Bikes"
GROUP BY p.product_name
ORDER BY quantity_in_stock DESC;

-- Retrieve the names of all products in the "Road Bikes" category.
SELECT p.product_name
FROM categories c
JOIN products p ON c.category_id = p.category_id
WHERE c.category_name = "Road Bikes";

-- Calculate the average list price for each brand.
SELECT b.brand_name, ROUND(AVG(p.list_price), 2) AS avg_list_price
FROM brands b 
JOIN products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name
ORDER BY avg_list_price DESC;

-- Identify the staff members (first name, last name) who are not currently active.
SELECT first_name, last_name
FROM staffs
WHERE active != 1;

-- List the product names and their respective brands for products with a model year of 2019.
SELECT b.brand_name, p.product_name
FROM products p 
JOIN brands b ON p.brand_id = b.brand_id
WHERE p.model_year = 2019
GROUP BY b.brand_name, p.product_name;

-- Retrieve the names of all customers who have never placed an order.
SELECT *
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- List the unique product names available for products in the "Mountain Bikes" category.
SELECT c.category_name, p.product_name
FROM categories c 
JOIN products p ON c.category_id = p.category_id
WHERE c.category_name = "Mountain Bikes";

-- Retrieve the total number of orders placed by each customer.
SELECT c.first_name, c.last_name, COUNT(o.order_id) as order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY order_count DESC;

-- List the top 5 customers who spent the most on their orders. Include their names and total order amount.
SELECT c.first_name, c.last_name, ROUND(SUM(oi.list_price * oi.quantity), 2) AS total_spent
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- Find the average quantity ordered for each brand.
SELECT b.brand_name, AVG(oi.quantity) AS avg_quantity
FROM brands b 
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY b.brand_name
ORDER BY avg_quantity DESC;

-- Identify the staff members (first name, last name) who have handled the most orders. Include the number of orders they've handled.
SELECT s.first_name, s.last_name, COUNT(o.order_id) AS orders_handled
FROM staffs s 
JOIN orders o ON s.staff_id = o.staff_id
GROUP BY s.first_name, s.last_name
ORDER BY orders_handled DESC
LIMIT 1;

-- Calculate the total revenue generated by each product category. Display the category name and total revenue.
SELECT c.category_name, ROUND(SUM(oi.list_price * oi.quantity), 2) AS total_revenue
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- List the products with a list price higher than the average list price of their respective categories. Include product name, category, and list price.
SELECT p.product_name, c.category_name, p.list_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.list_price > (SELECT AVG(p.list_price) FROM products WHERE category_id = p.category_id);


-- Calculate the total quantity of each product ordered in the year 2018. Display the product name and total quantity.
SELECT p.product_name, SUM(quantity) AS total_quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.model_year = 2018
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- Find the top 3 most expensive products based on their list prices. Include product name and list price.
SELECT product_name, list_price
FROM products
ORDER BY list_price DESC
LIMIT 3;

-- List the products with a model year of 2017 and a list price greater than $700. Include product name, brand, model year, and list price.
SELECT b.brand_name, p.product_name, p.model_year, p.list_price
FROM products p 
JOIN brands b ON p.brand_id = b.brand_id
WHERE model_year = 2017 AND list_price > 700
ORDER BY b.brand_name, p.product_name;

-- Retrieve the names of all customers in the state of New York (NY).
SELECT first_name, last_name
FROM customers
WHERE state = "NY";

-- Calculate the total sales (quantity * list price) for each order.
SELECT o.order_id, ROUND(SUM(oi.quantity * oi.list_price), 2) as sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- Find the average quantity ordered for each product category.
SELECT c.category_name, AVG(oi.quantity) as avg_quantity
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Identify the top 3 stores with the highest total sales.
SELECT s.store_name, ROUND(SUM(oi.list_price * oi.quantity), 2) as total_sales
FROM order_items oi 
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_sales DESC
LIMIT 3;

-- Retrieve the names of products and their respective brands for products with a list price lower than $500.
SELECT b.brand_name, p.product_name, p.list_price
FROM brands b 
JOIN products p ON b.brand_id = p.brand_id
WHERE p.list_price > 500
ORDER BY b.brand_name, p.product_name;

-- Calculate the total quantity of each product ordered.
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_ordered
FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_ordered DESC;

-- Retrieve the names of all customers who placed an order in the year 2019.
SELECT c.first_name, c.last_name, o.order_date
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2019;

-- List the product names and their respective brands for products with a model year of 2020.
SELECT b.brand_name, p.product_name, p.model_year
FROM products p 
JOIN brands b ON p.brand_id = b.brand_id
WHERE p.model_year = 2020;

-- Calculate the average discount for each product category.
SELECT c.category_name, ROUND(AVG(oi.discount), 3) as avg_discount
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Identify the store with the highest total sales.
SELECT s.store_name, ROUND(SUM(oi.list_price * oi.quantity), 2) as total_sales
FROM order_items oi 
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_sales DESC
LIMIT 1;

-- Retrieve the names of all products with a list price higher than the average list price across all products.
SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products);

-- List the customers who have placed the most orders.
SELECT first_name, last_name, order_count
FROM
(SELECT c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
order by order_count DESC) s
WHERE order_count = 3;

-- Find the total quantity of each product in stock in the store with the name "Baldwin Bikes."
SELECT p.product_name, SUM(s.quantity) AS quantity_in_stock
FROM products p 
JOIN stocks s ON p.product_id = s.product_id
JOIN stores st ON s.store_id = st.store_id
WHERE st.store_name = "Baldwin Bikes"
GROUP BY p.product_name
ORDER BY quantity_in_stock DESC;

-- Retrieve the names of all products in the "Mountain Bikes" category.
SELECT p.product_name
FROM products p 
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = "Mountain Bikes";

-- Calculate the average list price for each brand.
SELECT b.brand_name, ROUND(AVG(p.list_price), 2) as avg_list_price
FROM products p 
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY avg_list_price DESC;

-- Identify the staff members (first name, last name) who are not currently active.
SELECT first_name, last_name
FROM staffs
WHERE active != 1;

-- List the product names and their respective brands for products with a model year of 2021.
SELECT b.brand_name, p.product_name
FROM products p 
JOIN brands b ON p.brand_id = b.brand_id
WHERE p.model_year = 2021;

-- Retrieve the names of all customers who have never placed an order.
SELECT c.first_name, c.last_name
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE order_id IS NULL;

-- List the unique product names available for products in the "Road Bikes" category.
SELECT c.category_name, p.product_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = "Road Bikes"
GROUP BY c.category_name, p.product_name;

-- Find the total quantity of each product in stock in the store with the name "Rowlett Bikes."
SELECT p.product_name, SUM(s.quantity) as quantity_in_stock
FROM products p
JOIN stocks s ON p.product_id = s.product_id
JOIN stores st ON s.store_id = s.store_id
WHERE st.store_name = "Rowlett Bikes"
GROUP BY p.product_name
ORDER BY quantity_in_stock DESC;