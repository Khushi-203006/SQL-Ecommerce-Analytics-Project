-- 6. Insert cleaned data using transactions - demonstrate COMMIT and ROLLBACK with error scenarios 
-- select * from customer;
-- select * from orders;

-- start transaction for commit
start transaction;
insert into customer (customer_id , customer_unique_id , customer_zip_code_prefix ,
						customer_city,customer_state)
			values ('TXN_CUST_01', 'TXN_UNQ_01', 123456, 'Noida', 'UP');

insert into orders (order_id , customer_id , order_status,order_purchase_timestamp,
					order_approved_at , order_delivered_carrier_date , order_delivered_customer_date , 
                    order_estimated_delivery_date)
			values ('TXN_ORD_01', 'TXN_CUST_01', 'delivered', NOW() , NOW() , NOW() , NOW() , NOW()); 
            
COMMIT;
	
-- start transaction for rollback
start transaction;
insert into customer (customer_id , customer_unique_id , customer_zip_code_prefix ,
						customer_city,customer_state)
			values ('TXN_CUST_99', 'TXN_UNQ_99', 263748, 'Pune', 'MH');

insert into orders (order_id , customer_id , order_status,order_purchase_timestamp,
					order_approved_at , order_delivered_carrier_date , order_delivered_customer_date , 
                    order_estimated_delivery_date)
			values ('TXN_ORD_99', 'Invalid_id', 'delivered', NOW() , NOW() , NOW() , NOW() , NOW()); 
            
ROLLBACK;