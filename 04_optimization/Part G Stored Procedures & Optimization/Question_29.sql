/*
 Create a stored procedure to calculate dynamic discount based on rules:
 - New customer (first order): 15% off
 - Order value > $500: 10% off
 - Loyal customer (5+ previous orders): 5% off
 - Apply maximum one discount per order
*/
DELIMITER $$

CREATE PROCEDURE CalculateDynamicDiscount (
    IN p_customer_id INT,
    IN p_order_amount DECIMAL(10,2)
)
BEGIN
    DECLARE previous_orders INT DEFAULT 0;
    DECLARE discount_percent DECIMAL(5,2) DEFAULT 0;
    DECLARE final_amount DECIMAL(10,2);

    -- Count previous orders
    SELECT COUNT(*) 
    INTO previous_orders
    FROM orders
    WHERE customer_id = p_customer_id;

    -- Apply only ONE discount (priority based)
    IF previous_orders = 0 THEN
        SET discount_percent = 15;

    ELSEIF p_order_amount > 500 THEN
        SET discount_percent = 10;

    ELSEIF previous_orders >= 5 THEN
        SET discount_percent = 5;

    ELSE
        SET discount_percent = 0;
    END IF;

    -- Calculate final price
    SET final_amount = p_order_amount - 
                       (p_order_amount * discount_percent / 100);

    -- Return result
    SELECT 
        previous_orders AS total_previous_orders,
        discount_percent AS discount_applied,
        final_amount AS final_price;

END$$

DELIMITER ;
