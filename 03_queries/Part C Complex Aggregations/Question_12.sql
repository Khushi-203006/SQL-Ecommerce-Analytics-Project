-- Find top 10 products by revenue in each category using RANK() or DENSE_RANK() 

select * from products;
select * from order_items;

select *
from (
select 
		p.product_category_name ,
		p.product_id,
        sum(oi.price+oi.freight_value) as revenue,
        dense_rank() over (partition by p.product_category_name 
        order by sum(oi.price+oi.freight_value) desc) 
        as ranking
from products p join order_items oi
on p.product_id = oi.products_id
group by product_category_name , product_id) as ranking
where ranking<=10
order by ranking desc
;


        