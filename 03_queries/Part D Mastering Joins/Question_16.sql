-- Create a complete customer 360-degree view joining 5+ tables (customers, orders,order_items, products, reviews)

select * from customer;
select * from orders;
select * from order_items;
select * from  products;
select * from order_reviews;

select 
	c.customer_id,
    c.customer_city,
    c.customer_state,
    count(distinct o.order_id) as number_of_orders,
    sum(oi.price + oi.freight_value) as total_cost,
    count(distinct oi.products_id) as total_orders,
    round(avg(orw.review_score),2) as average_review,
    min(o.order_purchase_timestamp) as First_time_order,
    max(o.order_purchase_timestamp) as Last_time_order
from
	customer c LEFT JOIN orders o 
    ON c.customer_id = o.customer_id 
	LEFT JOIN order_items oi 
    ON oi.order_id = o.order_id
	LEFT JOIN order_reviews orw
    ON orw.order_id = o.order_id
group by
	c.customer_id,
    c.customer_city,
    c.customer_state
order by total_cost desc;
