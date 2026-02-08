CREATE TABLE dim_customers AS
SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    customer_id,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY customer_id;