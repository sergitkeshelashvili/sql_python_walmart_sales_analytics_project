# Walmart Sales Analytics Project 📊💸

Welcome to the Walmart Sales Analytics Project! 🚀 This portfolio project delivers a comprehensive, end-to-end analysis of Walmart's retail sales data, transforming raw transactional data into actionable business insights. From cleaning and structuring data with Python to uncovering trends with SQL analytics, this project showcases a robust pipeline for retail data analysis. Dive in to explore how data can drive smarter business decisions! 💡

📋 Project Overview
This project is split into two exciting phases: Data Cleaning with Python & Pandas 🐍 and Advanced Analytics with PostgreSQL 🗄️. Using a raw dataset (Walmart_Sales_Raw_Data.csv), we clean, transform, and analyze retail transactions to uncover insights like top-performing products, busiest days, and profitability trends across branches and cities.

🛠️ Phase 1: Data Cleaning (Python & Pandas)
In this phase, we take the raw dataset and whip it into shape for analysis! Using Python and Pandas in the python_pandas_raw_data_cleaning_script.ipynb notebook, we:

🗑️ Remove duplicates and handle missing values to ensure data integrity.
🔄 Convert data types (e.g., unit prices from strings to floats for accurate calculations).
📅 Merge date and time columns into a single datetime column for streamlined analysis.
🧹 Standardize column names and optimize the dataset’s structure for efficiency.
Output: A polished, analysis-ready dataset saved as Walmart_Sales_Cleaned_Data.csv.

📈 Phase 2: Analytics (PostgreSQL)
With the cleaned dataset, we dive into sql_data_analytics to extract powerful insights using advanced SQL queries in walmart_sales_analytics.sql. This phase includes:

📊 Aggregating sales and transactions by payment method to understand customer preferences.
⭐ Identifying top-rated product categories by branch to highlight best performers.
🕒 Analyzing busiest days of the week for each branch to optimize operations.
💵 Exploring profitability and revenue trends by city and product category.
🏆 Ranking product categories by total profit using window functions.
The init_database.sql script sets up the database schema, ensuring a smooth setup for running the analytics queries.

📂 Repository Structure
The project is organized into two main folders for clarity and reproducibility:

🐍 python_pandas_raw_data_cleaning
walmart_sales_raw_data.csv: The raw dataset containing Walmart sales transactions.
python_pandas_raw_data_cleaning_script.ipynb: Jupyter notebook with Python/Pandas code for data cleaning and transformation.
🗄️ sql_data_analytics
init_database.sql: SQL script to initialize the database schema.
walmart_sales_analytics.sql: SQL queries for analytics, featuring aggregations, window functions, and e.t.c
✨ Key Features
End-to-End Workflow: From raw data cleanup to insightful analytics, this project covers the full data pipeline.
Reproducible & Scalable: Clean, modular code ensures easy replication and scalability for larger datasets.
Actionable Insights: Uncover trends to optimize sales, staffing, and product strategies.
🛡️ License
This project is licensed under the MIT License.

