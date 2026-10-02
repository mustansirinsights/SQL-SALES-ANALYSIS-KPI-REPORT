create database retailstoredb;
use retailstoredb;

CREATE TABLE store_sales
(
sale_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
customer_name VARCHAR(50),
gender VARCHAR(10),
age INT,
city VARCHAR(40),
state VARCHAR(40),
product_name VARCHAR(60),
category VARCHAR(40),
quantity INT,
unit_price DECIMAL(10,2),
discount DECIMAL(10,2),
total_amount DECIMAL(10,2),
payment_mode VARCHAR(20),
salesperson VARCHAR(50)
);

INSERT INTO store_sales
(order_date,customer_name,gender,age,city,state,product_name,category,quantity,unit_price,discount,total_amount,payment_mode,salesperson)

VALUES

('2026-01-01','Rahul','Male',24,'Delhi','Delhi','Laptop','Electronics',1,55000,5000,50000,'Credit Card','Amit'),

('2026-01-02','Priya','Female',29,'Delhi','Delhi','Mobile','Electronics',2,18000,1000,35000,'UPI','Rohit'),

('2026-01-03','Ankit','Male',32,'Noida','UP','Chair','Furniture',4,2500,500,9500,'Cash','Neha'),

('2026-01-05','Sneha','Female',28,'Mumbai','Maharashtra','Sofa','Furniture',1,30000,2000,28000,'Debit Card','Amit'),

('2026-01-06','Rohan','Male',35,'Pune','Maharashtra','Television','Electronics',1,45000,3000,42000,'Credit Card','Neha'),

('2026-01-08','Meena','Female',41,'Jaipur','Rajasthan','Dining Table','Furniture',1,25000,1500,23500,'UPI','Rahul'),

('2026-01-10','Amit','Male',30,'Delhi','Delhi','Refrigerator','Electronics',1,42000,2000,40000,'Credit Card','Neha'),

('2026-01-12','Pooja','Female',27,'Lucknow','UP','Washing Machine','Electronics',1,28000,1000,27000,'Cash','Rohit'),

('2026-01-14','Karan','Male',26,'Chandigarh','Punjab','Office Chair','Furniture',2,4500,500,8500,'UPI','Rahul'),

('2026-01-15','Komal','Female',31,'Delhi','Delhi','Microwave','Electronics',1,15000,500,14500,'Debit Card','Amit'),

('2026-01-18','Sahil','Male',36,'Jaipur','Rajasthan','Bed','Furniture',1,38000,3000,35000,'Cash','Neha'),

('2026-01-19','Ritika','Female',25,'Noida','UP','Laptop','Electronics',1,60000,4000,56000,'Credit Card','Rahul'),

('2026-01-21','Deepak','Male',38,'Mumbai','Maharashtra','Air Conditioner','Electronics',1,52000,3000,49000,'UPI','Amit'),

('2026-01-22','Anjali','Female',34,'Pune','Maharashtra','Wardrobe','Furniture',1,32000,2000,30000,'Cash','Neha'),

('2026-01-23','Manoj','Male',42,'Delhi','Delhi','Mobile','Electronics',3,16000,2000,46000,'UPI','Rohit'),

('2026-01-25','Neha','Female',29,'Lucknow','UP','Study Table','Furniture',2,7000,1000,13000,'Debit Card','Rahul'),

('2026-01-26','Tarun','Male',40,'Delhi','Delhi','Television','Electronics',1,47000,2000,45000,'Cash','Amit'),

('2026-01-27','Shweta','Female',33,'Mumbai','Maharashtra','Sofa','Furniture',1,35000,3000,32000,'Credit Card','Neha'),

('2026-01-29','Mohit','Male',37,'Jaipur','Rajasthan','Laptop','Electronics',1,62000,5000,57000,'UPI','Rahul'),

('2026-01-30','Nisha','Female',26,'Delhi','Delhi','Mixer Grinder','Home Appliance',2,4500,500,8500,'Cash','Rohit');

-- basic

select * from store_sales;

-- 2. Show customer name, city and product purchased

select customer_name, city, product_name from store_sales;

-- 3. Find all customers from Delhi

select customer_name from store_sales where city="delhi";

-- 4.	Display all Electronics products

select product_name from store_sales where category= "Electronics"; 

-- 5.	Find sales greater than ₹30,000

select * from store_sales where total_amount>30000;

-- 7.	Sort records by highest sale amount

select * from store_sales order by total_amount desc;

-- 8.	Display the first 5 records

select * from store_sales limit 5;

-- 9.	Find customers whose names start with 'R'.

select customer_name from store_sales where customer_name like "r%";

-- Display all unique cities

select distinct city from store_sales;

-- intermediate

-- 11.	Calculate total sales revenue.

select unit_price*quantity as "sales revenue" from store_sales;

-- 12.	Calculate average sales amount

select avg(total_amount) from store_sales;

-- 13.	Find the maximum sale amount.

select max(total_amount) from store_sales;

-- 14.	Find the minimum sale amount

select min(total_amount) from store_sales;

-- 15.	Count total orders.

select count(sale_id) as "total order" from store_sales;

-- 16.	Display city-wise total sales.

select city, sum(total_amount) as "total sales" from store_sales group by city;

-- 17.	Display category-wise revenue.

select category, sum(total_amount) as "revenue" from store_sales group by category;

-- 18.	Display salesperson-wise revenue.

select salesperson, sum(total_amount) as "revenue" from store_sales group by salesperson;

-- 19.	Count orders by payment mode.

select payment_mode, count(*) as "total orders" from store_sales group by payment_mode; 

-- 20.	Find customers who have placed more than one order.

select customer_name, count(*) as "total order" from store_sales group by customer_name having count(*)>1;

-- advance 

-- 21.	Find the city with the highest sales.

select city, sum(total_amount) as "total_sales" from store_sales group by city order by total_sales desc limit 1;

-- 22.	Find the category generating the highest revenue

select category, sum(total_amount) as "revenue" from store_sales group by category order by revenue desc limit 1;

-- 23.	Display monthly sales revenue.

select monthname(order_date) as "month", sum(total_amount) as "monthly revenue" from store_sales group by month(order_date), monthname(order_date) order by month(order_date);

-- 24.	Find the top 5 highest sales transactions.

select total_amount as "sales" from store_sales order by sales desc limit 5; 

-- 25.	Display product-wise quantity sold.

select product_name, sum(quantity) as "total_quantity" from store_sales group by product_name;

-- 26.	Calculate average sales by city.

select city, avg(total_amount) as "avg_sales" from store_sales group by city;

-- 27.	Show gross amount before discount for every order.

select sale_id, quantity * unit_price as "gross_amount" from store_sales;

-- 28.	List customers who paid using UPI.

select customer_name, payment_mode from store_sales where payment_mode="upi";

-- 29.	Find the most popular payment mode.

select payment_mode, count(*) as "total_transaction" from store_sales group by payment_mode order by total_transaction desc limit 1;

-- 30.	Display all Furniture products costing more than ₹20,000.

select * from store_sales where category="furniture" and unit_price>20000;

-- 31.	Find customers between ages 25 and 35.

select  * from store_sales where age between 25 and 35;

-- 32.	Count male and female customers.

select gender, count(*) as "totalcustomer" from store_sales group by gender;

-- 33.	Display state-wise revenue.

select state, sum(total_amount) as "state total" from store_sales group by state;

-- 34.	Find the salesperson with the maximum revenue.

select salesperson, max(total_amount) as "max_revenue" from store_sales group by salesperson order by max_revenue desc limit 1;

--  35.	Create a business KPI report showing:
--	Total Orders
-- 	Total Revenue
--	Average Order Value
-- 	Highest Sale
--  Lowest Sale

select count(*) as "total_orders",
sum(total_amount) as "total_revnue",
avg(total_amount) as "order_value",
max(total_amount) as "highest_sales",
min(total_amount) as "lowest_sales" from store_sales;