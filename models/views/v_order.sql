CREATE VIEW monthly_order_summary AS
SELECT 
    order_id,
    customer_id,
    EXTRACT(MONTH FROM order_date) AS order_month,
    total_amount
FROM 
    DBT.PUBLIC.orders;
