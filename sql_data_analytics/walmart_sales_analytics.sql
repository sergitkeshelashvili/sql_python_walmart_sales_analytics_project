### Walmart Sales Analysis SQL Queries
This repository contains a collection of SQL queries designed to analyze the walmart_sales database table. The queries explore various aspects of the dataset, including schema exploration, basic metrics, aggregations, rankings, and time-based analysis. The queries are organized thematically, progressing from simple exploratory queries to more advanced analytical ones.

Table of Contents:
Schema Exploration
Distinct Values Analysis
Basic Metrics
Aggregations and Rankings
Time-Based Analysis

===========================================================
===========================================================
===========================================================
    
### Schema Exploration

-- Retrieves all tables in the database from the INFORMATION_SCHEMA
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Retrieves all columns in the database, providing details like table name, column name, and data type
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

===========================================================
===========================================================
===========================================================

### Distinct Values Analysis

-- Retrieves unique branches in the walmart_sales table
SELECT DISTINCT branch
FROM walmart_sales;

-- Retrieves unique cities in the walmart_sales table
SELECT DISTINCT city
FROM walmart_sales;

-- Retrieves unique product categories in the walmart_sales table
SELECT DISTINCT category
FROM walmart_sales;

-- Retrieves unique payment methods used in the walmart_sales table
SELECT DISTINCT payment_method
FROM walmart_sales;

===========================================================
===========================================================
===========================================================

### Baisc Metrics

-- Calculates the date range of sales data and the number of years spanned
SELECT
    MIN(datetime) AS first_sale_date,
    MAX(datetime) AS last_sale_date,
    EXTRACT(YEAR FROM AGE(MAX(datetime), MIN(datetime))) AS sales_range_years
FROM walmart_sales;

-- Computes the total sales revenue by multiplying unit price and quantity
SELECT 
    SUM(unit_price * quantity) AS total_sales
FROM walmart_sales;

-- Calculates the total number of items sold
SELECT 
    SUM(quantity) AS total_items_sold
FROM walmart_sales;

-- Computes the average unit price of items sold
SELECT
    AVG(unit_price) AS avg_price
FROM walmart_sales;

-- Calculates the total profit by factoring in the profit margin
SELECT
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart_sales;

-- Computes the average customer rating for all transactions
SELECT 
    AVG(rating) AS avg_rating
FROM walmart_sales;

-- Generates a consolidated report of key metrics: total sales, total quantity, average price, total profit, and average rating
SELECT 'Total Sales' AS measure_name, SUM((unit_price * quantity)) AS measure_value FROM walmart_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM walmart_sales
UNION ALL
SELECT 'Average Price', AVG(unit_price) FROM walmart_sales
UNION ALL 
SELECT 'Total Profit', SUM(unit_price * quantity * profit_margin) FROM walmart_sales
UNION ALL
SELECT 'Average Rating', AVG(rating) FROM walmart_sales;

===========================================================
===========================================================
===========================================================

### Aggregations and Rankings

-- Ranks branches and cities by total sales, displaying the top 10
WITH place_data AS (
    SELECT
        branch,
        city,
        SUM(unit_price * quantity) AS total_sales
    FROM walmart_sales
    GROUP BY branch, city
    ORDER BY total_sales DESC
)
SELECT
    branch,
    city,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS total_sales_rank_by_branch_city
FROM place_data
LIMIT 10;

-- Ranks product categories by total sales
WITH category_data AS (
    SELECT
        category,
        SUM(unit_price * quantity) AS total_sales
    FROM walmart_sales
    GROUP BY category
    ORDER BY total_sales DESC
)
SELECT
    category,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS total_sales_rank_by_category
FROM category_data;

-- Calculates total sales by payment method
SELECT
    payment_method,
    SUM(unit_price * quantity) AS total_sales
FROM walmart_sales
GROUP BY payment_method
ORDER BY total_sales DESC;

-- Ranks payment methods by total sales and number of transactions
WITH payment_data AS (
    SELECT
        payment_method,
        COUNT(*) AS total_transactions,
        SUM(unit_price * quantity) AS total_sales
    FROM walmart_sales
    GROUP BY payment_method
    ORDER BY total_sales
)
SELECT
    payment_method,
    total_transactions,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS total_sales_rank_by_payment_method,
    RANK() OVER(ORDER BY total_transactions DESC) AS total_tr_rank_by_payment_method
FROM payment_data;

-- Identifies the highest-rated product category for each branch
SELECT
    *
FROM (
    SELECT
        branch, 
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rank
    FROM walmart_sales
    GROUP BY branch, category
    ORDER BY branch, avg_rating DESC
)
WHERE rank = 1;

-- Determines the busiest day for each branch based on the number of transactions
SELECT
    *
FROM (
    SELECT
        branch,
        TO_CHAR(datetime, 'Day') AS day_name,
        COUNT(*) AS number_of_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
    FROM walmart_sales
    GROUP BY branch, day_name
)
WHERE RANK = 1;

-- Analyzes transaction counts by day of the week across all branches
SELECT
    TO_CHAR(datetime, 'Day') AS day_name,
    COUNT(*) AS number_of_transactions
FROM walmart_sales
GROUP BY day_name
ORDER BY number_of_transactions DESC;

-- Ranks cities and categories by average rating, showing min, max, and average ratings for the top 10
WITH rating_data AS (
    SELECT
        city,
        category,
        MIN(rating) AS min_rating,
        MAX(rating) AS max_rating,
        AVG(rating) AS avg_rating
    FROM walmart_sales
    GROUP BY city, category
)
SELECT
    city, 
    category,
    min_rating,
    max_rating,
    avg_rating,
    RANK() OVER(ORDER BY avg_rating DESC) AS avg_rating_rank
FROM rating_data
LIMIT 10;

-- Ranks product categories by total profit
WITH category_profit AS (
    SELECT
        category,
        SUM(unit_price * quantity * profit_margin) AS total_profit
    FROM walmart_sales
    GROUP BY category
    ORDER BY total_profit DESC
)
SELECT
    category,
    total_profit,
    RANK() OVER(ORDER BY total_profit DESC) AS total_profit_rank
FROM category_profit;

-- Ranks payment methods by transaction count within each branch
SELECT
    branch,
    payment_method,
    COUNT(*) AS total_transactions,
    RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS payment_method_rank
FROM walmart_sales
GROUP BY branch, payment_method;

===========================================================
===========================================================
===========================================================

### Time-Based Analysis

-- Summarizes sales, transactions, and quantity sold by year and month (using month name)
SELECT
    EXTRACT(YEAR FROM datetime) AS transaction_year,
    TO_CHAR(datetime, 'MON') AS transaction_month,
    SUM(unit_price * quantity) AS total_sales,
    COUNT(DISTINCT invoice_id) AS total_transactions,
    SUM(quantity) AS total_quantity_sold
FROM walmart_sales
GROUP BY EXTRACT(YEAR FROM datetime), TO_CHAR(datetime, 'MON')
ORDER BY EXTRACT(YEAR FROM datetime), TO_CHAR(datetime, 'MON');

-- Summarizes sales, transactions, and quantity sold by year and month (using month number)
SELECT
    EXTRACT(YEAR FROM datetime) AS transaction_year,
    EXTRACT(MONTH FROM datetime) AS transaction_month,
    SUM(unit_price * quantity) AS total_sales,
    COUNT(DISTINCT invoice_id) AS total_transactions,
    SUM(quantity) AS total_quantity
FROM walmart_sales
GROUP BY EXTRACT(YEAR FROM datetime), EXTRACT(MONTH FROM datetime)
ORDER BY EXTRACT(YEAR FROM datetime), EXTRACT(MONTH FROM datetime);

-- Calculates total sales per month and computes a running total and moving average price over time
SELECT
    transaction_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY transaction_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY transaction_date) AS moving_average_price
FROM (
    SELECT 
        TO_CHAR(datetime, 'YYYY-MM') AS transaction_date,
        SUM(unit_price * quantity) AS total_sales,
        AVG(unit_price) AS avg_price
    FROM walmart_sales
    WHERE datetime IS NOT NULL
    GROUP BY TO_CHAR(datetime, 'YYYY-MM')
) t
ORDER BY transaction_date;

































