with monthly_order_summary AS (
    SELECT 
    order_id,
    customer_id,
    EXTRACT(MONTH FROM order_date) AS month,
    total_amount
FROM 
    DBT.PUBLIC.orders)

select * from monthly_order_summary
    