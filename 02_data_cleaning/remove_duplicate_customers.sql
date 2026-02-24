#4. Write a SQL script to detect and remove duplicate customers while keeping the most recent record
/*
select * from customer;

select customer_unique_id, count(*) as cnt 
from customer
group by customer_unique_id having count(*) > 1 ;
*/

/*
While removing duplicate records from the customers table, only those customers without 
corresponding entries in the orders table were deleted.
*/

delete from customer 
where customer_id IN(
select customer_id from (
select customer_id, 
		ROW_NUMBER() over(
					partition by customer_unique_id 
                    order by customer_id desc)
                    as d from customer) as t
		where d>1)
	AND customer_id not in
    (select distinct customer_id from orders);
