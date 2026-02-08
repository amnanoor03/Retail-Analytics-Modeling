CREATE TABLE fact_sales AS
SELECT
    s.transaction_id,
    d.customer_key,
    s.product_name,
    s.amount AS sale_amount,
    s.transaction_date
FROM retail_sales s
JOIN dim_customers d ON s.customer_id = d.customer_id;