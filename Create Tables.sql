-- Create Customers Table
CREATE OR REPLACE TABLE `spry-sequence-439320-r6.ecommerce_analytics.Customers` (
    customer_id INT64,
    name STRING,
    gender STRING,
    location STRING,
    registration_date DATE
);

-- Create Products Table
CREATE OR REPLACE TABLE `spry-sequence-439320-r6.ecommerce_analytics.Products` (
    product_id INT64,
    name STRING,
    category STRING,
    price NUMERIC(10, 2)
);

-- Create Orders Table
CREATE OR REPLACE TABLE `spry-sequence-439320-r6.ecommerce_analytics.Orders` (
    order_id INT64,
    customer_id INT64,
    order_date DATE,
    total_amount NUMERIC(10, 2)
);

-- Create Order_Items Table
CREATE OR REPLACE TABLE `spry-sequence-439320-r6.ecommerce_analytics.Order_Items` (
    order_item_id INT64,
    order_id INT64,
    product_id INT64,
    quantity INT64,
    price NUMERIC(10, 2)
);

-- Create Payments Table
CREATE OR REPLACE TABLE `spry-sequence-439320-r6.ecommerce_analytics.Payments` (
    payment_id INT64,
    order_id INT64,
    payment_method STRING,
    payment_date DATE,
    payment_status STRING
);
