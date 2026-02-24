-- Create a sales report with daily, weekly, monthly subtotals using ROLLUP or CUBE

select * from orders;
select * from order_payments;

select 
		year(o.order_purchase_timestamp) as Years,
        month(o.order_purchase_timestamp) as Months,
        week(o.order_purchase_timestamp) as Weeks,
        day(o.order_purchase_timestamp) as Days,
        sum(op.payment_value) as Total_revenue
from
		orders o join order_payments op
on
		o.order_id = op.order_id
group by
		year(o.order_purchase_timestamp),
        month(o.order_purchase_timestamp),
        week(o.order_purchase_timestamp),
        day(o.order_purchase_timestamp)
with rollup
order by Total_revenue;