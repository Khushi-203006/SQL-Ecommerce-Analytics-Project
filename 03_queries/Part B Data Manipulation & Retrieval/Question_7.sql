-- 7. Find customers who have the same email but different names/addresses (data quality red flag)

select * from customer;

/*
As no table have email column we will use something which is similar to it. customer_unique_id play the same role as email.
It should have same customer_city and customer_state for each unique id.
Data quality red flag - it means data is inccorect, inconsistent , unreliable and suspicious.
*/

select customer_unique_id,
count(distinct customer_city) as variant_city,
count(distinct customer_state) as variant_state
from customer
group by customer_unique_id
having count(distinct customer_city)>1 or count(distinct customer_state)>1;

