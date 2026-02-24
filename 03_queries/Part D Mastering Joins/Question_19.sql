-- 19. Identify products frequently bought together (market basket analysis using self-join)

select * from products;
select * from orders;
select * from order_items;

select 
	oi1.products_id as product_1,
    oi2.products_id as product_2,
    count(*) as frequency
from
	order_items oi1 join order_items oi2
on
	oi1.order_id = oi2.order_id and
    oi1.products_id < oi2.products_id
group by
	oi1.products_id,
    oi2.products_id
order by frequency desc;