/*
# Walmart Sales Analytics Database Setup

This SQL script sets up the `walmart_sales_analytics` database and creates the `walmart_sales` table for analyzing Walmart sales data. It includes commands to truncate the table and import cleaned data from a CSV file.

## Purpose
- **Database Creation**: Drops and recreates the `walmart_sales_analytics` database.
- **Table Creation**: Defines the `walmart_sales` table with columns for sales transactions.
- **Data Import**: Truncates the table and imports data from `Walmart_Sales_Cleaned_Data.csv`.

## Table Structure
| Column          | Type        | Description                              |
|-----------------|-------------|------------------------------------------|
| invoice_id      | SERIAL      | Unique identifier (Primary Key)          |
| branch          | VARCHAR(50) | Walmart branch identifier                |
| City            | VARCHAR(50) | City where the branch is located         |
| category        | VARCHAR(50) | Product category                         |
| payment_method  | VARCHAR(50) | Payment method (e.g., Cash, Ewallet)     |
| unit_price      | FLOAT       | Price per unit                           |
| quantity        | FLOAT       | Number of units sold                     |
| rating          | FLOAT       | Customer rating for the transaction      |
| profit_margin   | FLOAT       | Profit margin percentage                 |
| datetime        | DATE        | Transaction date                         |

## Usage
1. Run this script in a PostgreSQL client (e.g., psql, pgAdmin) to create the database and table.
2. Update the `\copy` command's file path to point to your `Walmart_Sales_Cleaned_Data.csv`.
3. Execute the script to set up the database and import data.

## Prerequisites
- PostgreSQL 15+.
- Cleaned dataset (`Walmart_Sales_Cleaned_Data.csv`) from the Python data cleaning script (`python_pandas_raw_data_cleaning.ipynb`).

## Notes
- Ensure the CSV file path in the `\copy` command is accessible by the PostgreSQL server.
- The `TRUNCATE` command clears existing data, so use with caution.
- This script is part of the Walmart Sales Analytics project, which includes Python-based data cleaning and SQL analytics.

## Example Import Command
\copy walmart_sales (invoice_id, branch, City, category, payment_method, unit_price, quantity, rating, profit_margin, datetime) FROM '/path/to/Walmart_Sales_Cleaned_Data.csv' DELIMITER ',' CSV HEADER;

*/

==================================================
==================================================
==================================================

-- CREATE the 'walmart_sales_analytics' database
  
DROP DATABASE IF EXISTS walmart_sales_analytics;
CREATE DATABASE walmart_sales_analytics;

-- CREATE the 'walmart_sales' database

==================================================
==================================================
==================================================
  
DROP TABLE IF EXISTS walmart_sales;
CREATE TABLE walmart_sales (
    invoice_id SERIAL PRIMARY KEY,
    branch VARCHAR(50),
    City VARCHAR(50),
    category VARCHAR(50),
    payment_method VARCHAR(50),
    unit_price FLOAT,
    quantity FLOAT,
    rating FLOAT,
    profit_margin FLOAT,
    datetime DATE
);

==================================================
==================================================
==================================================
  
-- Truncate walmart_sales table and import data
TRUNCATE TABLE walmart_sales;
\copy walmart_sales (invoice_id, branch, City, category, payment_method, unit_price, quantity, rating, profit_margin, datetime) FROM '/path/to/Walmart_Sales_Cleaned_Data.csv' DELIMITER ',' CSV HEADER;

