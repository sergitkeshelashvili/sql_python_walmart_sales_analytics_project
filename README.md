# Walmart Sales Analytics Project 📊💸

This project delivers an end-to-end analysis of Walmart's sales data, transforming raw transactions into actionable insights using Python, Pandas, and PostgreSQL. It showcases a robust pipeline for retail data analysis to drive smarter business decisions. 🚀

============================================================

📋 Project Overview // The project is divided into two phases:

🪙 Data Cleaning (Python & Pandas): Clean and structure raw data for analysis.
🪙 Analytics (PostgreSQL): Extract insights using advanced SQL queries.

============================================================

🛠️ Phase 1: Data Cleaning (Python & Pandas)
Using python_pandas_raw_data_cleaning_script.ipynb:

🗑️ Remove duplicates and handle missing values.
🔄 Convert data types (e.g., unit prices to floats).
📅 Merge date and time into a datetime column.
🧹 Standardize column names and optimize structure.
Output: Walmart_Sales_Cleaned_Data.csv

------------------------------------------------------------

📈 Phase 2: Analytics (PostgreSQL) - Using walmart_sales_analytics.sql:

📊 Aggregate sales by payment method.
⭐ Identify top-rated product categories by branch.
🕒 Analyze busiest days for operational efficiency.
💵 Explore profitability and revenue trends by city and category.
🏆 Rank product categories by profit using window functions.
Setup: init_database.sql creates the database schema.

============================================================


📂 Repository Structure

🧹 python_pandas_raw_data_cleaning:

📑 walmart_sales_raw_data.csv: Raw dataset.
📑 python_pandas_raw_data_cleaning_script.ipynb: Cleaning script.


📊 sql_data_analytics:

📑 init_database.sql: Database schema setup.
📑 walmart_sales_analytics.sql: Analytics queries.

============================================================

✨ Key Features
End-to-End Workflow: Covers data cleaning to analytics.
Reproducible & Scalable: Modular code for easy replication.
Actionable Insights: Optimize sales, staffing, and product strategies.

============================================================

🛡️ License
This project is licensed under the MIT License.


