-- select * from orders;
-- select * from order_items;
-- select * from products;

-- 8. Identify orphan records: order_items that reference non-existent products or orders

select 
		oi.order_item_id, 
		oi.order_id, 
		oi.products_id 
from 
order_items oi left join orders o on oi.order_id = o.order_id
left join products p on oi.products_id = p.product_id
where
o.order_id is null or p.product_id is null;

