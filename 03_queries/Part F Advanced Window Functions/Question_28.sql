-- Calculate running total of revenue by date with percentage of grand total

WITH daily AS (
    SELECT 
        CAST(order_purchase_timestamp AS DATE) AS order_date,
        SUM(oi.price + oi.freight_value) AS daily_revenue
    FROM orders o join order_items oi on o.order_id = oi.order_id
    GROUP BY CAST(order_purchase_timestamp AS DATE)
)

SELECT
    order_date,
    daily_revenue,
    
    -- Running total
    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS running_total,

    -- % of grand total
    ROUND(
        100.0 *
        SUM(daily_revenue) OVER (ORDER BY order_date)
        /
        SUM(daily_revenue) OVER (),
        2
    ) AS pct_of_total

FROM daily
ORDER BY order_date;
