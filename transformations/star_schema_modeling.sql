-- ============================================================
-- PROJECT: Retail Analytics - Star Schema Transformation
-- PURPOSE: Transforming raw transactional data into a Fact/Dimension model
-- ============================================================

-- STEP 0: Create the Landing Table (Raw Data)
CREATE TABLE IF NOT EXISTS retail_sales (
    transaction_id INT,
    customer_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP
);

-- STEP 1: Create the Dimension Table (dim_customers)
-- Using ROW_NUMBER() to generate a Surrogate Key (customer_key)
CREATE TABLE dim_customers AS
SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    customer_id,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY customer_id;

-- STEP 2: Create the Fact Table (fact_sales)
-- Joining raw data with dim_customers to link business events to dimensions
CREATE TABLE fact_sales AS
SELECT
    s.transaction_id,
    d.customer_key,
    s.product_name,
    s.amount AS sale_amount,
    s.transaction_date
FROM retail_sales s
JOIN dim_customers d ON s.customer_id = d.customer_id;

-- STEP 3: Verification
-- Checking the first 5 records of the Fact table
SELECT * FROM fact_sales LIMIT 5;