-- Rank sellers by revenue within each state, show only top 3 per state

-- customer = customer_id
-- orders = order_id
-- order_item = seller_id
-- seller

with seller_revenue as(
	select
		s.seller_id,
        c.customer_state,
        sum(oi.price + oi.freight_value) as total_revenue
	from orders o join order_items oi on o.order_id = oi.order_id
    join seller s on s.seller_id = oi.seller_id
    join customer c on o.customer_id = c.customer_id
    group by s.seller_id, c.customer_state
),

rank_sellers as(
	select 
		seller_id,
        customer_state,
        total_revenue,
        rank() over(
			partition by customer_state
            order by total_revenue desc
        ) as revenue_rank
        from seller_revenue
)

select * from rank_sellers
where revenue_rank<=3
order by customer_state,revenue_rank;

