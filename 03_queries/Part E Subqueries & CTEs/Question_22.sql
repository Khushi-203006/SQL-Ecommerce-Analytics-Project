-- . Get the 2nd highest revenue-generating product in each category (ranking with subquery)
select * from products;
select * from order_items;

select * from (
select 
	p.product_id,
    p.product_category_name,
    sum(oi.price + oi.freight_value) as revenue,
    dense_rank() over (partition by p.product_category_name
    order by sum(oi.price + oi.freight_value)) as Revenue_rank
from
	products p join order_items oi 
on  p.product_id = oi.products_id
group by p.product_id,p.product_category_name) rev
where Revenue_rank = 2
order by product_id, product_category_name desc
;
