# Walmart_Sales_Analytics_Project

This portfolio project presents a comprehensive analysis of Walmart sales data, focusing on cleaning, transforming, and deriving actionable insights from retail transactions. The project is divided into two key phases:

🔹 Phase 1: Data Cleaning (Python & Pandas)
Using the raw dataset (Walmart_Sales_Raw_Data.csv), this phase involves preparing the data for analysis by:

Removing duplicate entries and handling missing values.

Converting data types (e.g., converting unit prices from strings to floats).

Merging date and time columns into a single datetime column.

Creating a new sales column for revenue calculations.

Standardizing column names and optimizing the dataset’s structure.

The result is a clean, analysis-ready dataset saved as Walmart_Sales_Cleaned_Data.csv.

🔹 Phase 2: Advanced Analytics (PostgreSQL)
Using the cleaned dataset, this phase applies advanced SQL techniques to extract business insights, including:

Aggregating total sales and transactions by payment method.

Identifying the highest-rated product categories by branch.

Analyzing the busiest day of the week for each branch.

Exploring profitability, revenue, and customer ratings by city and product category.

Ranking product categories based on total profit.

SQL queries are stored in the walmart_sales.sql script and demonstrate the use of aggregations, window functions, conditional logic, and rankings.

📂 Repository Structure
walmart_sales_project.ipynb: Python notebook for data cleaning.

walmart_sales.sql: SQL scripts for performing the advanced analytics.

✅ Key Features
End-to-end data preparation and transformation using Python.

Insightful business analysis powered by PostgreSQL.

Clean and structured codebase for reproducibility and scalability.

📄 License
This project is licensed under the MIT License.

