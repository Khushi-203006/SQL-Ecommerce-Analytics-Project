-- Calculate Customer Lifetime Value (CLV) = SUM(payment_value) per customer, categorize as Bronze/Silver/Gold 

select * from customer;
select * from orders;
select * from order_payments;

select 
	customer_id,
    Total_spending,
	case
    when Total_spending >= 5000 then 'Gold'
    when Total_spending >=2000 then 'Silver'
    else 'Bronze'
    end as Category
from
(
select 
	c.customer_id , sum(op.payment_value) as Total_spending
from
	customer c join orders o on c.customer_id = o.customer_id
join 
	order_payments op on o.order_id = op.order_id
group by c.customer_id
	) Spending
    order by total_spending desc;




