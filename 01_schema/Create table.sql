#Create tables
create database sales;
use sales;


create table customer(
	customer_id varchar(255),
    customer_unique_id varchar(255),
    customer_zip_code_prefix integer,
    customer_city varchar(255),
    customer_state varchar(50));
    
create table orders(
			order_id varchar(255),
			customer_id varchar(255),
            order_status varchar(255),
            order_purchase_timestamp datetime default null,
            order_approved_at datetime default null,
            order_delivered_carrier_date datetime default null,
            order_delivered_customer_date datetime default null,
            order_estimated_delivery_date datetime default null
);

create table order_items(
			order_id varchar(255),
            order_item_id int,
            products_id varchar(255),
            seller_id varchar(255),
            shipping_limit_date datetime default null,
            price decimal(10,2),
            freight_value decimal(10,2)
);

create table products(
			product_id varchar(255) default null,
            product_category_name varchar(255) default null,
            product_name_lenght int default null,
            product_description_lenght int default null,
            product_photos_qty int default null,
            product_weight_g int default null,
            product_length_cm int default null,
            product_height_cm int default null,
            product_width_cm int default null
);

create table seller(
			seller_id varchar(255),
            seller_zip_code_prefix int,
            seller_city varchar(100),
            seller_state varchar(20)
);

create table order_payments(
			order_id varchar(255),
            payment_sequential int,
            payment_type varchar(255),
            payment_installments int,
            payment_value decimal(10,2)
);

create table order_reviews(
				review_id varchar(255) null,
                order_id varchar(255) null,
                review_score int null,
                review_comment_title LONGTEXT,
                review_comment_message LONGTEXT,
                review_creation_date datetime null,
                review_answer_timestamp datetime null
);


CREATE TABLE olist_geolocation (
    geolocation_zip_code_prefix INT NOT NULL,
    geolocation_lat DECIMAL(10, 7) NOT NULL,
    geolocation_lng DECIMAL(10, 7) NOT NULL,
    geolocation_city VARCHAR(100) NOT NULL,
    geolocation_state CHAR(2) NOT NULL
);


