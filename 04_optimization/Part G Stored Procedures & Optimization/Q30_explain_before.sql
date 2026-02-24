-- Query 1: Monthly Revenue (BEFORE)

EXPLAIN ANALYZE
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(p.payment_value) AS revenue
FROM orders o
JOIN order_payments p 
    ON o.order_id = p.order_id
GROUP BY month;






