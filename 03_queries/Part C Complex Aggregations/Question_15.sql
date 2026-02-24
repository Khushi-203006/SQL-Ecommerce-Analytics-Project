-- Identify seasonal patterns: which product categories sell best in which months?

select * from orders;
select * from order_items;
select * from products;


select * 
from (
select 
	month(o.order_purchase_timestamp) as Months,
	monthname(o.order_purchase_timestamp) as Month_name,
    p.product_category_name,
    sum(oi.price + oi.freight_value) as revenue,
    dense_rank() over (partition by month (p.product_category_name)
    order by sum(oi.price + oi.freight_value) desc) as Ranking
from 
	orders o join order_items oi
on 
	o.order_id = oi.order_id
join
	products p on oi.products_id = p.product_id
group by
	Month(o.order_purchase_timestamp),
    monthname(o.order_purchase_timestamp),
    p.product_category_name) first_rank
where Ranking = 1
order by Months, Ranking;