SELECT
	o.order_id,
	CONCAT(c.first_name, " ", c.last_name) AS customer_name,
    c.city,
    c.state,
    o.order_date,
	SUM(oi.quantity) AS 'quantity',
    SUM(oi.quantity * oi.list_price) AS 'revenue',
    p.product_name,
    ca.category_name,
    s.store_name,
    b.brand_name,
    CONCAT(st.first_name, " ", st.last_name) AS sales_rep
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories ca ON p.category_id = ca.category_id
JOIN stores s ON o.store_id = s.store_id
JOIN staffs st ON o.staff_id = st.staff_id
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY 
	o.order_id,
	CONCAT(c.first_name, " ", c.last_name),
    c.city,
    c.state,
    o.order_date,
    p.product_name,
    ca.category_name,
    s.store_name,
    b.brand_name,
    CONCAT(st.first_name, " ", st.last_name)
ORDER BY o.order_id