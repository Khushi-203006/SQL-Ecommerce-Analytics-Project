-- List sellers and their best-selling product in each category they sell

select * from seller;
select * from orders;
select * from products;
select * from order_items;

select * from (
select 
	s.seller_id,
    p.product_category_name,
    Sum(oi.price + oi.freight_value) as revenue,
    dense_rank() over (partition by s.seller_id,p.product_category_name
    order by Sum(oi.price + oi.freight_value)) as ranking
from 
	seller s join order_items oi on s.seller_id = oi.seller_id
join
	products p on p.product_id = oi.products_id
group by seller_id,
		 product_category_name,
         oi.products_id) rank_seller
where ranking = 1
order by seller_id,product_category_name;