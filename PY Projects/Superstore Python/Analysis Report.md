# Superstore Performance Analysis
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
This is a data analysis project done using Python with the aim of improving my data cleaning, exploration and visualisation skills using Python libraries like Pandas, Matplotlib and Seaborn. It also aims to provide insights into the sales and profit performances of a fictional superstore that sells various items. By understanding the patterns that exist within the data through proper analysis, appropriate recommendations were made that could potentially improve profitability.
### Exploratory Questions
---
The aim was to add further insightful questions that stem from these groups that could provide more information for the analysis:
1. Sales & Profits From Customers
2. Product Performances
3. Regional Sales & Profits
4. Discount Impact on Sales & Profits
5. Category/Subcategory Performances
6. Ship Mode & Shipping durations
### Skills Demonstrated
---
- Problem Solving
- Critical Thinking
- Data Cleaning & Visualisation with Python
### Data Sources
---
The data used can be found in the [Sample-Superstore](Sample-Superstore.xlsx) file.
### Tools Used
---
- Jupyter Notebooks
### Data Cleaning
---
- Checking for nulls and duplicates and dropping them where necessary.
- Renaming and adding columns where necessary.
- Fixing datatypes of columns
## Data Analysis
This section covers a glimpse of some of the code I wrote as well as some screenshots and a brief summary of the general findings I was able to extract through my analysis. 

**N.B**: The complete code and visualisations can be found in the [Superstore_EDA.ipynb](Superstore_EDA.ipynb) file
### Findings
---
1. Sales & Profits From Customers
   - Top 10 Customers - Total Money Spent(Sales)
     ```python
     # Querying for the top 10 customers who spent the most money
     customer_sales = store_data.groupby("customer_name")["sales"].sum().sort_values(ascending=False).reset_index()
     top10 = customer_sales.head(10)
     top10
     ```
3. Product Performances
   - Best Selling Products
     ```python
     # Querying the data to get the top 10 best selling products
     product_sales = store_data.groupby("product_name")["sales"].sum().sort_values(ascending=False).reset_index()
     prodsales_top10 = product_sales.head(10)
     prodsales_top10
     ```
5. Regional Sales & Profits
   - Total Profits from each Region
     ```python
     # Horizontal bar chart displaying the profit data
     plt.figure(figsize=(10,6))
     sns.barplot(y="region", x="profit", data=region_profits, palette='pastel')
     plt.title("Total Regional Profits")
     plt.xlabel("Total Profits")
     plt.ylabel("Region")
     ```
7. Discount Impact on Sales & Profits
   - Discount Impact on Sales & Profits
     ```python
     # Plotting a bar chart to display the data
     plt.figure(figsize=(8,6))
     sns.barplot(x="discounted", y="sales", data=discounted_sales)
     plt.title("Total Sales By Discount Status")
     plt.xlabel("Discounted")
     plt.ylabel("Total Sales")
     ```
9. Category/Subcategory Performances
    - Total Sales For Each Category
      ```python
      # Querying for the total sales from each category
      cat_sales = store_data.groupby("category")["sales"].sum().sort_values(ascending=False).reset_index()
      cat_sales
      ```
11. Ship Mode & Shipping durations
    - Order count for each Ship Mode
      ```python
      # Extracting the order count for each ship mode
      shipmode_order_count = store_data.groupby("ship_mode")["order_id"].nunique().reset_index(name="order_count")
      shipmode_order_count
      ```
### Summary
---
### Recommendations
---
