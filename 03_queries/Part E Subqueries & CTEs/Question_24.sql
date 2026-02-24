-- Find customers who made purchases in 3+ consecutive months using CTE with window functions

select * from orders;
select * from products;
select * from order_items;

-- unique customer per month
with customer_month as (
	select distinct 
		customer_id,
        (YEAR(order_purchase_timestamp) * 12
        + MONTH(order_purchase_timestamp)) as month_number
	from orders
),

-- assign row number
numbered as (
	select
		customer_id,
        month_number,
        row_number() over (
			partition by customer_id
            order by month_number)
            as rn
		from customer_month
),

-- consecutive sequence
grouped as (
	select 
		customer_id,
        month_number,
        (month_number-rn) as grp
	from numbered
)

-- final query
select 
	customer_id,
    count(*) as consecutive_months
from grouped
group by customer_id , grp
having count(*) >= 3
order by customer_id
;


