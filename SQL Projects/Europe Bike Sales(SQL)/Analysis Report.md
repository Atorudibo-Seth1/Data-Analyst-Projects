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
- [Recommendations](#recommendations)

### Project Overview
---
This data analysis project was carried out to help me improve my skills in data analytics. It also aims to provide insights into the sales performance of a fictional European bike company that sells bikes, clothing and other accessories to multiple countries across the world. By understanding the patterns that exist within the data through proper analysis, appropriate recommendations were made that could potentially improve profitability. 
### Exploratory Questions
---
These question groups were formulated after getting a brief understanding of the data. The aim was to add further insightful questions that stem from these groups that could provide more information for the analysis:
1. Revenue Analysis
2. Pricing & Cost Analysis
3. Customer and Order Analysis
4. Yearly Analysis
5. Product and Country Analysis

### Skills Demonstrated
---
- Critical thinking
- Problem solving
- Wrting functional SQL queries

### Data Sources
---
The data can be found in the [Sales.csv](Sales.csv) file

### Tools Used
---
- MySQL
- Microsoft Excel

### Data Cleaning
---
The data was clean but there were errors with the original revenue and profits column. I solved this by recalculating them using:
- order_quantity * unit_price = revenue
- revenue - (order_quantity * unit_cost) = profits

## Data Analysis
This section covers a glimpse of some of the queries I wrote as well as a brief summary of the general findings I was able to extract through my analysis:

**N.B**: All the queries I wrote can be found in the [euro_bikes.sql](euro_bikes.sql) file

### Findings
---
1. **Revenue Analysis:**
   - What are the total revenues generated for each product category?
     ```sql
     SELECT product_category, SUM(revenue) AS total_revenue
     FROM sales
     GROUP BY product_category
     ORDER BY total_revenue DESC;
     ```
     <p align="center">
      <img src="categoryrevenue.png">
     </p>
     
2. **Pricing & Cost Analysis:**
   - What are the average profit margins for each product category?
     ```sql
     SELECT product_category, AVG(profits / revenue) AS avg_profit_margin
     FROM sales
     GROUP BY product_category;
     ```
     <p align="center">
      <img src="profitmargins.png">
     </p>
     
3. **Customer and Order Analysis:**
   - What were the total order quantities for each state?
     ```sql
     SELECT state, COUNT(*) AS order_count
     FROM sales
     GROUP BY state
     ORDER BY order_count DESC
     ```
     <p align="center">
      <img src="statequantity.png">
     </p>
     
4. **Yearly Analysis:**
   - What were the total profits for each year.
     ```sql
     SELECT YEAR(date) AS order_year, SUM(profits) AS total_profits
     FROM sales
     GROUP BY order_year
     ORDER BY order_year;
     ```
     <p align="center">
      <img src="yearlyprofits.png">
     </p>
     
5. **Product and Country Analysis:**
    - What were the top 5 products with the highest total order quantity?
      ```sql
      SELECT product, SUM(order_quantity) AS order_quantity
      FROM sales
      GROUP BY product
      ORDER BY order_quantity DESC
      LIMIT 5;
      ```
      <p align="center">
      <img src="productquantity.png">
     </p>
     
### Summary
---
- The **country** generating the highest **revenue** and **profits** is the **United States** with figures of **$26,221,446** and **$11,670,846** respectively while the country generating the least is **Canada** with figures of **$6,633,899** and **$3,058,117** respectively.
- **Male** customers generate slightly more **revenue** and **profits** with figures of **$40,906,471** and **$17,871,063** respectively than **Female** customers with figures of **$40,010,719** and **$17,371,343**.
- The **product category** generating the most revenue is **Bikes($61,138,978)**, then **Accessories($11,582,320)** and finally **Clothing($8,195,892)**. This most likely because the company only sold bikes till around 2013-2014 when the other categories were introduced.
- The best **year** for the company in terms of **revenue** and **profits** was **2015** with figures of **$18,872,236** and **$8,251,362** respectively and the lowest figures came in **2011**: **$10,065,457** and **$3,981,870** respectively
- The **most ordered product** is the **Water Bottle - 30 oz.** with **164,086** units sold and the **least popular product** is the **Mountain-500 Black, 52** with **40** units sold
- The **age group** generating the most **revenue** in the **Adults(35-64)** with a figure of **$39,686,441** and the group generating the least revenue is the **Seniors(64+)** with a figure of **$259,099**

### Recommendations
---
Based on my findings, here are some recommendations I would offer:

1. **Focus on Market Expansion:** Given that the United States is the top revenue and profit generator, consider strategies to further expand market share in the U.S. Explore new regions or cities within the country where the company can increase its presence.

2. **Gender-Specific Marketing:** Although the revenue and profits are close between male and female customers, consider tailoring marketing strategies to each gender. Identify product preferences or marketing messages that resonate more with each group to potentially increase engagement.

3. **Diversify Product Offerings:** While Bikes are the top revenue-generating category, consider diversifying product offerings within Accessories and Clothing. Introduce new and appealing products to these categories to potentially capture a broader market.

4. **Yearly Performance Assessment:** Analyze the factors contributing to the success in 2015 and explore ways to replicate or enhance those strategies. Similarly, investigate the challenges faced in 2011 and implement corrective measures to avoid similar pitfalls in the future.

5. **Product Portfolio Optimization:** Evaluate the performance of individual products and identify opportunities to optimize the product portfolio. Consider promoting or enhancing the marketing strategies for popular products and assessing the viability of less popular ones.

6. **Targeted Marketing to Age Groups:** Given the revenue discrepancy among age groups, consider targeted marketing campaigns for the Adults (35-64) age group, which is the highest revenue generator. Tailor product recommendations or promotions to this demographic.

