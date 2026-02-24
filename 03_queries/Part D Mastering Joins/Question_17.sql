--  Find customers who bought products from category 'electronics' but never from 'books

select * from products;
select * from customer;
select * from orders;
select * from order_items;

select 
	c.customer_id
from 
	customer c join orders o on c.customer_id = o.customer_id
join
	order_items oi on oi.order_id = o.order_id
join
	products p on oi.products_id = p.product_id
where 
	p.product_category_name = 'electronics'
and
	c.customer_id not in
    (
    select 
	c2.customer_id
from 
	customer c2 join orders o2 on c2.customer_id = o2.customer_id
join
	order_items oi2 on oi.order_id = o2.order_id
join
	products p2 on oi2.products_id = p2.product_id
where 
	p.product_category_name = 'books'
    );
    
    
-- another query

select 
	c.customer_id
from 
	customer c join orders o on c.customer_id = o.customer_id
join
	order_items oi on oi.order_id = o.order_id
join
	products p on oi.products_id = p.product_id
group by c.customer_id
having
	sum(case when p.product_category_name = 'electronics' then 1 else 0 end) > 0
and 
	sum(case when p.product_category_name = 'books' then 1 else 0 end) = 0;
    

-- no item from electronics and book exist
select * from products where product_category_name = 'electronics';
select * from products where product_category_name = 'books';