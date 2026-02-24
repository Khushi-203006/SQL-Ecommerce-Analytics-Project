-- 10. Detect potential fraud: orders where payment_value != order total (sum of order_items)

select * from orders;
select * from products;
select * from order_payments;
select * from order_items;

select
	oi.order_id,
    sum(oi.price+oi.freight_value) as total_price,
    sum(op.payment_value) as total_payment
from order_items oi join order_payments op
on oi.order_id = op.order_id
group by oi.order_id
having total_payment <> total_price;