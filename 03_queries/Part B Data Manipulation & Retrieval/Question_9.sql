-- 9. List customers who registered but never placed an order (conversion funnel leak analysis)
/*
conversion funnel leak analysis - 
conversion - means complete any porcess step-by-step 
funnel leak - randomly stopping at any steps
conversion funnel leak analysis - if someone donot proceed in further steps
ex - in e-commerce plateform if customer sign in but never placed any order.
*/

select * from customer;
select * from orders;

select 
c.customer_id from 
customer c left join orders o on c.customer_id = o.customer_id
where o.customer_id is null;