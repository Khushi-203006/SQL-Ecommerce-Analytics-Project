#PRIMARY KEY
-- Customer table 
alter table customer
add primary key(customer_id);

-- Orders tabe 
alter table orders
add primary key(order_id);

-- products table
alter table products
add primary key(product_id);

-- seller table
alter table seller
add primary key(seller_id);

-- order_reviews
ALTER TABLE order_reviews
ADD PRIMARY KEY (review_pk);

-- order_payments
ALTER TABLE order_payments
ADD CONSTRAINT pk_payments
PRIMARY KEY (order_id, payment_sequential);

-- order_items
ALTER TABLE order_items
ADD PRIMARY KEY (order_id, order_item_id);


#FOREIGN KEY
-- order -> customer
ALTER TABLE orders
ADD FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

-- Order Items → Orders
ALTER TABLE order_items
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items → Seller
ALTER TABLE order_items
ADD FOREIGN KEY (seller_id)
REFERENCES seller(seller_id);

-- Order Payments → Orders
ALTER TABLE order_payments
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Reviews → Orders
ALTER TABLE order_reviews
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);