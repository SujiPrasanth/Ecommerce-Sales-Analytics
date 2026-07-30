CREATE DATABASE ecommerce_db;

use ecommerce_db;



create table ecommerce(
Order_ID INT PRIMARY KEY,
Customer_ID VARCHAR(20),
Order_Date varchar(15),
Customer_Age INT,
Customer_Gender VARCHAR(10),
Country VARCHAR(50),
City VARCHAR(50),
Customer_Segment VARCHAR(50),
Product_ID VARCHAR(20),
Product_Category VARCHAR(30),
Product_Subcategory VARCHAR(30),
Brand VARCHAR(20),
Unit_Price DECIMAL(10,2),
Quantity INT,
Discount_Percent INT,
Discount_Amount DECIMAL(10,2),
Coupon_Used VARCHAR(20),
Shipping_Cost DECIMAL(10,2),
Tax_Amount DECIMAL(10,2),
Order_Amount DECIMAL(10,2),
Payment_Method VARCHAR(20),
Device_Type VARCHAR(20),
Traffic_Source VARCHAR(20),
Membership_Status VARCHAR(20),
Shipping_Method VARCHAR(20),
Warehouse_Region VARCHAR(15),
Delivery_Days INT,
Order_Status VARCHAR(20),
Returned VARCHAR(20),
Review_Rating DECIMAL(2,1),
Customer_Lifetime_Value DECIMAL(12,2),
Profit_Margin_Percent DECIMAL(5,2),
Profit_Amount DECIMAL(12,2),
Season VARCHAR(10),
Holiday_Season VARCHAR(10),
High_Value_Order VARCHAR(10)
);

DESC ecommerce;

select * from ecommerce limit 10;

SET SQL_SAFE_UPDATES = 0;
update ecommerce set Order_Date = str_to_date(Order_Date,"%d-%m-%Y");
SET SQL_SAFE_UPDATES = 1;

alter table ecommerce modify Order_Date date;

select count(*) from ecommerce;

select count(order_id) as duplicate_count from ecommerce group by order_id having count(order_id)>1;

select sum(Order_ID is null) as missing_order_id,
sum(Customer_ID is null ) as missing_customer_id,
sum(Order_Date is null) as missing_order_date,
sum(Product_ID is null) as missing_product_id,
sum(Order_Amount is null) as missing_order_amount from ecommerce;

select * from ecommerce where Customer_ID='';

select * from ecommerce where quantity <0;

select * from ecommerce where unit_price<=0;

select * from ecommerce where profit_amount< 0;
desc ecommerce;


select review_rating from ecommerce where review_rating not between 1 and 5;

select * from ecommerce where Discount_Percent < 0 or Discount_Percent > 100;

select delivery_days from ecommerce where delivery_days <0;

select distinct Customer_Gender from ecommerce;
select distinct order_status from ecommerce;
select distinct payment_method from ecommerce;
select distinct returned from ecommerce;

select min(order_date) as first_order,max(order_date) as last_order from ecommerce;
select min(unit_price),max(unit_price),avg(unit_price) from ecommerce;
select min(order_amount),max(order_amount),avg(order_amount) from ecommerce;

select count(*) as Total_orders from ecommerce;
desc ecommerce;

select count(distinct customer_id) as total_customers from ecommerce;

select count(distinct product_id) as total_products from ecommerce;

select distinct customer_segment from ecommerce;

select customer_segment,count(*) as total_orders from ecommerce group by customer_segment;

select distinct product_category from ecommerce;

select distinct product_category, count(*) from ecommerce group by product_category;

select distinct product_subcategory from ecommerce;
desc ecommerce;
select distinct product_subcategory,count(*) from ecommerce group by product_subcategory;

select distinct country,count(*) from ecommerce group by country;
select distinct city,count(*) from ecommerce group by city;

select distinct payment_method,count(*) from ecommerce group by payment_method;
select distinct device_type,count(*) from ecommerce group by device_type;
select distinct Traffic_Source,count(*) from ecommerce group by Traffic_Source;
select distinct membership_status,count(*) from ecommerce group by membership_status;
select distinct shipping_method,count(*) from ecommerce group by shipping_method;
select distinct warehouse_region,count(*) from ecommerce group by warehouse_region;
select distinct order_staTUS,count(*) from ecommerce group by ORDER_STATUS;
select distinct returned,count(*) from ecommerce group by returned;
select distinct Traffic_Source,count(*) from ecommerce group by Traffic_Source;
select distinct season,count(*) from ecommerce group by season;
select distinct holiday_season,count(*) from ecommerce group by holiday_season;

desc ecommerce;

select * from ecommerce limit 10;
select sum(order_amount) as Total_Sales from ecommerce;
select count(*) as Total_Orders from ecommerce;
select avg(order_amount) as avg_ordr_value from ecommerce;

#Business Analysis
#Sales Analysis
select month(order_date) as Month,sum(order_amount) as Month_revenue from ecommerce group by month(order_date) order by month;
select year(order_date) as year,sum(order_amount) as Year_Revenue from ecommerce group by year(order_date) order by year;
select quarter(order_date) as quarter,sum(order_amount) as Quater_Revenue from ecommerce group by quarter(order_date) order by quarter;
select order_date,sum(order_amount) as daily_revenue from ecommerce group by order_date order by order_date;
select month(order_date),sum(order_amount) as Highest_monthly_sales from ecommerce group by order_date order by Highest_monthly_sales desc limit 1;
select month(order_date),sum(order_amount) as Highest_monthly_sales from ecommerce group by order_date order by Highest_monthly_sales  limit 1;

#Customer Analysis
select  count(distinct customer_id) as total_customer from ecommerce;
select customer_id,count(*) as Orders_Per_Customer from ecommerce group by customer_id;
select customer_id,count(*) as Orders_Per_Customer from ecommerce group by customer_id order by Orders_Per_Customer desc limit 10;
select customer_id,sum(order_amount) as revenue from ecommerce group by order_id order by revenue desc limit 10;
select customer_gender,sum(order_amount) as Revenue from ecommerce group by customer_gender;
select customer_gender,count(order_id) as Number_of_Customer_by_gender from ecommerce group by customer_gender;
select Customer_ID,count(customer_id) as Total_Orders_by_Gender from ecommerce group by Customer_ID;

select distinct Membership_Status from ecommerce;
desc ecommerce;