-- STEP 1: Create the Dimension Table (Customer Lookup)
CREATE TABLE dim_customers AS
SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    customer_id,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY customer_id;

-- STEP 2: Create the Fact Table (Sales Transactions)
CREATE TABLE fact_sales AS
SELECT
    s.transaction_id,
    d.customer_key,
    s.product_name,
    s.amount AS sale_amount,
    s.transaction_date
FROM retail_sales s
JOIN dim_customers d ON s.customer_id = d.customer_id;