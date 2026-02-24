-- Index for join
CREATE INDEX idx_payments_order
ON order_payments(order_id);

-- Index for grouping/filtering
CREATE INDEX idx_orders_purchase
ON orders(order_purchase_timestamp);

-- Always ensure PK exists
ALTER TABLE orders
ADD PRIMARY KEY (order_id);

DROP INDEX idx_payments_order ON order_payments;
DROP INDEX idx_orders_purchase ON orders;



