--Customer Segmentation:
SELECT o.customer_id, 
       c.location, 
       SUM(o.total_amount) AS total_spent, 
       COUNT(o.order_id) AS total_orders, 
       CASE 
           WHEN SUM(o.total_amount) > 1000 THEN 'High Value'
           WHEN SUM(o.total_amount) BETWEEN 500 AND 1000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM `spry-sequence-439320-r6.ecommerce_analytics.Orders` o
JOIN `spry-sequence-439320-r6.ecommerce_analytics.Customers` c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.location;



--Product Performance Analysis:
SELECT p.category, 
       p.name, 
       SUM(oi.quantity) AS total_sold, 
       SUM(oi.price * oi.quantity) AS total_revenue
FROM `spry-sequence-439320-r6.ecommerce_analytics.Products` p
JOIN `spry-sequence-439320-r6.ecommerce_analytics.Order_Items` oi 
  ON p.product_id = oi.product_id
GROUP BY p.category, p.name
ORDER BY total_revenue DESC;


--Sales Trends Over Time:
SELECT DATE_TRUNC(order_date, MONTH) AS month, 
       SUM(total_amount) AS total_sales
FROM `spry-sequence-439320-r6.ecommerce_analytics.Orders`
GROUP BY month
ORDER BY month;


--Payment Method Analysis:
SELECT payment_method, 
       COUNT(payment_id) AS total_transactions, 
       SUM(CASE WHEN payment_status = 'Successful' THEN 1 ELSE 0 END) AS successful_transactions
FROM `spry-sequence-439320-r6.ecommerce_analytics.Payments`
GROUP BY payment_method;
