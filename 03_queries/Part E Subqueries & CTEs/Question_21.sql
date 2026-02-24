-- Find customers who spent more than the average customer in their state (correlated subquery)

-- A correlated subquery is a subquery that depends on the outer query for its values and is executed 
-- once for each row processed by the outer query.

select * from customer;
select * from orders;
select * from order_items;

WITH customer_totals AS (
    SELECT 
        c.customer_id,
        c.customer_state,
        SUM(oi.price + oi.freight_value) AS total_spend
    FROM customer c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY c.customer_id, c.customer_state
)

SELECT *
FROM customer_totals ct
WHERE total_spend >
(
    SELECT AVG(total_spend)
    FROM customer_totals
    WHERE customer_state = ct.customer_state
);

;
