# Retail Analytics Data Modelling: Star Schema Modeling

## 🎯 Project Objective
This project demonstrates the transition from raw transactional data to a structured **Star Schema** optimized for analytical queries. Using PostgreSQL, I transformed a flat retail dataset into Fact and Dimension tables to improve data integrity and query performance.

## 🏗️ Data Architecture
The model follows a classic Star Schema design:
* **Fact Table (`fact_sales`)**: Stores quantitative transaction data, including sale amounts and dates, linked via surrogate keys.
* **Dimension Table (`dim_customers`)**: Contains descriptive customer attributes and aggregated metrics like `total_orders`.



## 🛠️ Tech Stack
* **Database:** PostgreSQL 16
* **Tools:** pgAdmin 4, PyCharm
* **Language:** SQL
* **Version Control:** Git & GitHub

## 🚀 Key SQL Concepts Used
* **DDL (Data Definition Language)**: Creating and altering table structures.
* **Window Functions**: Using `ROW_NUMBER()` to generate unique surrogate keys.
* **Data Integrity**: Implementing `PRIMARY KEY` constraints to prevent duplicates.
* **Joins**: Performing `INNER JOIN` operations to link facts with dimensions.
