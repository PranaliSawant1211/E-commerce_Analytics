-- Remove duplicate Orders if any
DELETE FROM `spry-sequence-439320-r6.ecommerce_analytics.Orders`
WHERE order_id IN (
    SELECT order_id
    FROM (
        SELECT order_id, 
               ROW_NUMBER() OVER (PARTITION BY customer_id, order_date ORDER BY order_id) AS row_num
        FROM `spry-sequence-439320-r6.ecommerce_analytics.Orders`
    )
    WHERE row_num > 1
);


-- Update NULL locations in Customers to 'Unknown'
UPDATE `spry-sequence-439320-r6.ecommerce_analytics.Customers`
SET location = 'Unknown'
WHERE location IS NULL;

-- Update NULL total_amounts in Orders to 0
UPDATE `spry-sequence-439320-r6.ecommerce_analytics.Orders`
SET total_amount = 0
WHERE total_amount IS NULL;



-- Standardize customer locations to lowercase
UPDATE `spry-sequence-439320-r6.ecommerce_analytics.Customers`
SET location = LOWER(TRIM(location))
WHERE location IS NOT NULL;

