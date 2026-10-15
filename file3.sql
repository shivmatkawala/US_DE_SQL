use myDB;

-- 1) CREATE TABLE
CREATE TABLE ecommerce_orders (
    order_id       INT PRIMARY KEY,
    customer_name  VARCHAR(50),
    product_name   VARCHAR(50),
    category       VARCHAR(30),
    price          DECIMAL(10,2),
    quantity       INT,
    order_date     DATE,
    city           VARCHAR(30),
    status         VARCHAR(20),
    payment_method VARCHAR(30)
);

select * from ecommerce_orders;

-- 2) INSERT 20 RECORDS
INSERT INTO ecommerce_orders
(order_id, customer_name, product_name, category, price, quantity, order_date, city, status, payment_method)
VALUES
(1,  'Aarav Sharma',   'Laptop',            'Electronics', 55000.00, 1, '2026-01-05', 'Hyderabad', 'Delivered', 'Credit Card'),
(2,  'Priya Patel',    'Smartphone',        'Electronics', 22000.00, 2, '2026-01-12', 'Mumbai',    'Delivered', 'UPI'),
(3,  'Rahul Verma',    'Running Shoes',     'Footwear',     3500.00, 1, '2026-02-03', 'Delhi',     'Shipped',   'Debit Card'),
(4,  'Sneha Reddy',    'Bluetooth Speaker', 'Electronics',  2500.00, 3, '2026-02-14', 'Hyderabad', 'Delivered', 'UPI'),
(5,  'Karan Singh',    'Cotton T-Shirt',    'Clothing',      799.00, 4, '2026-02-20', 'Chennai',   'Cancelled', 'Cash on Delivery'),
(6,  'Ananya Iyer',    'Office Chair',      'Furniture',    8500.00, 1, '2026-03-02', 'Bangalore', 'Delivered', 'Credit Card'),
(7,  'Vikram Rao',     'Water Bottle',      'Kitchen',       450.00, 5, '2026-03-11', 'Hyderabad', 'Pending',   'UPI'),
(8,  'Meera Nair',     'Mixer Grinder',     'Appliances',   4200.00, 1, '2026-03-18', 'Kochi',     'Delivered', 'Net Banking'),
(9,  'Smith John',     'Backpack',          'Accessories',  1800.00, 2, '2026-04-01', 'Pune',      'Shipped',   'Credit Card'),
(10, 'Smyth Anne',     'Yoga Mat',          'Sports',       1200.00, 2, '2026-04-09', 'Mumbai',    'Delivered', 'UPI'),
(11, 'Rohit Gupta',    'Smart Watch',       'Electronics',  6500.00, 1, '2026-04-15', 'Delhi',     'Returned',  'Debit Card'),
(12, 'Divya Menon',    'Denim Jeans',       'Clothing',     2200.00, 2, '2026-05-06', 'Bangalore', 'Delivered', 'Credit Card'),
(13, 'Arjun Kumar',    'Gaming Mouse',      'Electronics',  1500.00, 1, '2026-05-19', 'Hyderabad', 'Delivered', 'UPI'),
(14, 'Neha Kapoor',    'Study Table',       'Furniture',    6800.00, 1, '2026-06-02', 'Chennai',   'Pending',   'Net Banking'),
(15, 'Aditya Joshi',   'Football',          'Sports',        950.00, 3, '2026-06-14', 'Pune',      'Shipped',   'Cash on Delivery'),
(16, 'Pooja Bhat',     'Air Fryer',         'Appliances',   7200.00, 1, '2026-07-01', 'Bangalore', 'Delivered', 'Credit Card'),
(17, 'Sanjay Mehta',   'Sunglasses',        'Accessories',  1600.00, 2, '2026-07-22', 'Mumbai',    'Cancelled', 'UPI'),
(18, 'Lakshmi Prasad', 'Saree',             'Clothing',     3200.00, 1, '2026-08-08', 'Hyderabad', 'Delivered', 'Debit Card'),
(19, 'Tanvi Shah',     'Headphones',        'Electronics',  3000.00, 2, '2026-09-10', 'Delhi',     'Shipped',   'UPI'),
(20, 'Ravi Teja',      'Cookware Set',      'Kitchen',      5400.00, 1, '2026-10-02', 'Hyderabad', 'Pending',   'Net Banking');


select * from ecommerce_orders;

-- sorting
select * from ecommerce_orders
order by customer_name;

select * from ecommerce_orders
order by product_name;

select * from ecommerce_orders
order by category;

select * from ecommerce_orders
order by price;

select * from ecommerce_orders
order by quantity;

-- SORTING DESC
select * from ecommerce_orders
order by customer_name DESC;

select * from ecommerce_orders
order by price DESC;

-----------------------------------------

-- where clause with logical operators:
select * from ecommerce_orders
where price > 5000 and quantity < 2;

select * from ecommerce_orders
where price > 5000 or quantity < 2;

select * from ecommerce_orders
where MONTH(order_date) > 5 and not(city='Hyderabad');

-- top 5
select top 5 * from ecommerce_orders

-- bottom 5
select top 5 * from ecommerce_orders
order by order_id DESC;

-----------------------------------------------

-- Aggregation Functions:

-- Find Costliest Product Price
select max(price) as costliest_product_pice from ecommerce_orders;

-- Find Cheapest Product Price
select min(price) as cheapest_product_price from ecommerce_orders;

-- Find total price
select sum(price) as total_price from ecommerce_orders;

-- Average product price
select avg(price) as avg_product_price from ecommerce_orders;

-- Find count of records
select count(*) as total_records from ecommerce_orders;

-- Find how many categories are there:
select count(distinct category) as category_count from ecommerce_orders;

-------------------------------------------------------------------------------

-- Wildcards with "Like" Operator

select * from ecommerce_orders 
where customer_name like 'A%';

select * from ecommerce_orders 
where customer_name like '%a';

select * from ecommerce_orders 
where customer_name like '%u%';

select * from ecommerce_orders 
where product_name like '_a%';

select * from ecommerce_orders
where category like '[AE]%';

select * from ecommerce_orders
where category like '[^AE]%';

select * from ecommerce_orders
where category like '[A-F]%';

-------------------------------------------------
-- in operator
select * from ecommerce_orders
where category in ('Appliances', 'Furniture');
-- not in operator
select * from ecommerce_orders
where category not in ('Appliances', 'Furniture');



-- between operator
select * from ecommerce_orders
where price between 5000 and 10000;

select * from ecommerce_orders
where price not between 5000 and 10000;

--------------------------------------------------

--JOINS:
    -- E-Commerce  => Accounts, Products, Supplier, Order, 

-- INNER JOIN:

create table products(
    pID int,
    product_name varchar(20),
    price money,
);


create table orders(
    oID int,
    pID int,
    order_date date,
    payment_method varchar(20)
);


insert into products
values
(1, 'Soap', 40),
(2, 'Shampoo', 5),
(3, 'Banana', 70),
(4, 'oil', 100),
(5, 'sugar', 60);


insert into orders
values
(101, 2, '3/7/2026', 'UPI'),
(102, 3, '4/5/2026', 'COD'),
(103, 5, '11/12/2023', 'CREDIT CARD'),
(104, 2, '6/7/2026', 'COD'),
(105, 3, '8/9/2025', 'UPI');

insert into orders
values
(106, null, '3/3/2025', 'DEBIT CARD'),
(107, null, '6/7/2022', 'UPI');

select * from products;

select * from orders;


-- Inner Join: From both the tables only those records which are having match.
select 
    p.pID, o.oID, p.product_name, p.price, o.order_date, o.payment_method
from
    products as p
inner join
    orders as o
on 
    p.pID = o.pID;


-- Left Join: All records from left side table and only matching records from right side table
select 
    p.pID, p.product_name, p.price, o.oID, o.order_date, o.payment_method
from
    products as p
left join
    orders as o
on 
    p.pID = o.pID;


-- Right Join: All Records from Right side table and only those records who are having match from Left side table

select 
    p.pID, p.product_name, p.price, o.oID, o.order_date, o.payment_method
from
    products as p
right join
    orders as o
on 
    p.pID = o.pID;


-- Full Join: All the records from Left and Right Side Table

select 
    p.pID, p.product_name, p.price, o.oID, o.order_date, o.payment_method
from
    products as p
full join
    orders as o
on 
    p.pID = o.pID;

-- Cross Join: Gives Cartesian Table

select 
    *
from
    products
cross join
    orders;


-- self join: Joins with itself

create table employees(
    eID int,
    name varchar(20),
    mID int
);


insert into employees
values
(1, 'John Carter', 3),
(2, 'Sara Adam', 1),
(3, 'David Clark', null),
(4, 'frank lloyd', 2),
(5, 'christine paper', 2);


select * from employees;

select 
    e.name as employee, d.name as manager
from 
    employees e
left join
    employees d
on
    e.mID = d.eID;