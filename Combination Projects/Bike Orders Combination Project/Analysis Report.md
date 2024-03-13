# Bike Orders End to End Analysis
## Table of Contents
- [Project Overview](#project-overview)
- [Exploratory Questions](#exploratory-questions)
- [Skills Demonstrated](#skills-demonstrated)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Modelling](#data-modelling)
- [Data Cleaning](#data-cleaning)
- [Data Analysis](#data-analysis)
- [Findings](#findings)
- [Recommendations](#recommendations)

### Project Overview
---
This project was an attempt to complete an end to end data analyst opertaion using multiple tools as a means of improving my skills. It also aims to provide insights into the sales performance of stores that sell a variety of bikes. By identifying purchase trends in customers and products, data-driven decisions and recommendations can be made as well as acquiring an understanding of store performances. 
### Exploratory Questions
---
After browsing through the data, some interesting question groupings that can provide clarity initially came to my mind:
1. Sales and Revenue Analysis 
2. Product and Inventory Analysis
3. Customer Behaviour and Order Analysis
4. Staff and Store Analysis
5. Product Category and Brand Analysis

### Skills Demonstrated
---
- Writing functional SQL queries
- Data visualization with Tableau
- Data preparation and Dashboard Creation with Excel
- Critical Thinking and Problem Solving

### Data Sources
---
The data used can found along with the Excel Dashboard in the [orders_compiled.xlsx](orders_compiled.xlsx) file.
### Tools Used
---
- MySQL
- Microsoft Excel
- Tableau
### Data Modelling
---
<p align="center">
  <img src="bike_inventory_schema.png">
</p>

### Data Cleaning
---
- Data gathering with SQL(Table Creation)
  ```sql
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
  ```
- Checking for duplicates and nulls in the data
## Data Analysis
### Findings
---
- The most successful **year** was **2017** with a revenue of **$3,845,515.02**.
- The **customer** who spent the most money on orders was **Pamelia Newman** with a total spend of **$38,702**.
- The **store** bringing in the most revenue is **Baldwin Bikes** with a revenue of **$5,826,242.21** follwed by **Santa Cruz Bikes** with **$1,790,145.91** and **Rowlett Bikes** with **$962,600.76**
- The **sales rep** accounting for the most revenue through sales is **Marcelene Boyer** with a generated revenue of **$2,938,889**.
- The most popular **brand** is **Trek** with a revenue of **$5,129,382** and the least poular is **Strider** with a revenue of **$4,850** and the **category** generating the most revenue is **Mountain Bikes** with a revenue of **$3,030,776** and the leat generating categoty is **Children Bikes** with a revenue of **$327,888**.
- The **state** generating the most revenue is **NY** with a revenue of **$5,826,242.21** then **CA** with **$1,790,145.91** and finally **TX** with **$962,600.76**

### Recommendations
---
Based on the data insights I gathered, I have offered these recommendations:

1. **Focus on Successful Years:** Given that 2017 was the most successful year with the highest revenue, consider analyzing the factors that contributed to this success. Explore whether specific products, marketing strategies, or external factors played a role.

2. **Customer Engagement:** Recognize and appreciate high-spending customers like Pamelia Newman. Consider implementing loyalty programs, special promotions, or personalized marketing to maintain and increase engagement with such valuable customers.

3. **Store Performance:** Baldwin Bikes was the top-performing store in terms of revenue. Investigate the reasons behind its success, such as location, product assortment, or customer service. Implement successful strategies from Baldwin Bikes in other stores to potentially increase revenue.

4. **Sales Representative Performance:** Acknowledge and reward high-performing sales representatives like Marcelene Boyer. She could share best practices and successful sales strategies across the sales team to improve overall performance.

5. **Brand and Category Strategy:** Recognize the popularity of the Trek brand and the profitability of the Mountain Bikes category. Consider strengthening marketing efforts, expanding product lines, or negotiating better deals with Trek to maximize revenue. Evaluate the potential for improving the performance of less popular brands and categories.

6. **Regional Expansion:** Given that NY is the top revenue-generating state, explore opportunities for expanding operations or marketing efforts in this region. Identify factors contributing to success in NY and apply them to other states, especially those with lower revenue.
