-- 11. Calculate monthly revenue with Month-over-Month (MoM) growth percentage - handle first month edge case 

select * from orders;
select * from order_payments;

select
	month_year,
    monthly_revenue,
    round(
	((monthly_revenue - LAG(monthly_revenue) over (order by month_year)) 
    / LAG(monthly_revenue) over (order by month_year) * 100) , 2
    ) as MOM
    from (
		select 
			date_format(o.order_purchase_timestamp , '%Y-%m') as month_year,
			sum(op.payment_value) as monthly_revenue
		from 
			orders o join order_payments op
		on 
			o.order_id = op.order_id
		group by date_format(o.order_purchase_timestamp , '%Y-%m')
        ) as monthly_year
		order by month_year
        ;
    
    
	