-- Calculate 7-day moving average of daily order count

with daily_orders as (
	select 
			date(order_purchase_timestamp) as order_date,
            count(*) as daily_order_count
		from orders
        group by date(order_purchase_timestamp)
)

select
	order_date,
    daily_order_count,
    round(
		avg(daily_order_count) over (
        order by order_date
        rows between 6 preceding and current row),2) 
        as moving_avg
	from daily_orders
    order by order_date;
