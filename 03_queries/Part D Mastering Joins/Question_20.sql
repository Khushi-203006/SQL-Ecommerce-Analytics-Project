-- Find orders with shipping delays: expected_delivery_date < actual_delivery_date, show customer 
-- and seller info

select * from orders;
select * from seller;
select * from order_items;
select * from customer;

select 
	c.customer_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    o.order_estimated_delivery_date as expected_delivery_date,
    o.order_delivered_customer_date as actual_delivery_date
from 
	customer c join orders o on c.customer_id = o.customer_id
	join order_items oi on o.order_id = oi.order_id
    join seller s on oi.seller_id = s.seller_id
where
	o.order_delivered_customer_date is not null
and
	o.order_delivered_customer_date > o.order_estimated_delivery_date;
	