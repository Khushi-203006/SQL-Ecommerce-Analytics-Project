-- For each customer, find the gap (in days) between consecutive orders using LAG()

select
	customer_id,
    order_id,
    order_purchase_timestamp,
    
    lag(order_purchase_timestamp) over (
    partition by customer_id
    order by order_purchase_timestamp)
    as previous_order_date,
    
datediff(
	order_purchase_timestamp,
    lag(order_purchase_timestamp) over (
    partition by customer_id
    order by order_purchase_timestamp)
)
as gap_in_days

from orders
order by customer_id , order_purchase_timestamp;

select count(distinct customer_id) from orders;
select count(customer_id) from orders;
