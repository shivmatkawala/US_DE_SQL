create database ecomDB;

use ecomDB;

create table customers(
	id varchar(20) primary key,
	name varchar(20),
	dob date,
	city varchar(20),
	gender bit
);

create table suppliers(
	id varchar(20) primary key,
	name varchar(20),
	city varchar(20),
);


insert into customers
values
('C101', 'Ajay Gupta', '5/23/1990', 'Amdawad',1),
('C102', 'Rohini Shah', '12/4/1998', 'Lucknow',0),
('C103', 'David Patil', '6/6/2000', 'Ambala',1);

insert into suppliers
values
('S511', 'Andhra Coconut Co.', 'Vaizag'),
('S512', 'Manglore Coffee', 'Manglore'),
('S513', 'Hyderabad Biryani', 'Hyderabad');

select * from customers;
select * from suppliers;

select id, name, city from customers
union
select id, name, city from suppliers;


------------- Group By
insert into customers
values
('C104', 'Vinay Banga', '5/23/1990', 'Amdawad',1),
('C105', 'Kirthi Reddy', '12/4/1998', 'Lucknow',0),
('C106', 'Sachin Dev', '6/6/2000', 'Ambala',1);

select city, count(*) as CustomerCount
from customers
group by city;


use myDB;

select * from ecommerce_orders;

select category, sum(price*quantity) as sales 
from ecommerce_orders
group by category;

select status, sum(price*quantity) as sales 
from ecommerce_orders
where status in ('Delivered', 'Pending', 'Shipped')
group by status;



select category, sum(price*quantity) as sales 
from ecommerce_orders
group by category
having sum(price*quantity) > 10000;

use myDB;

select * from products;
select * from orders;

select p.pID, p.product_name
from products p
where NOT EXISTS (select 1 from orders o where o.pID = p.pID);


-- select into

select 
	p.pID, p.product_name, p.price, o.order_date, o.payment_method
into
	ordered_products
from 
	products p
inner join
	orders o
on 
	p.pID = o.pID;

select * from ordered_products;



insert into 
	ordered_products
select
	p.pID, p.product_name, p.price, o.order_date, o.payment_method
from 
	products p
left join
	orders o
on 
	p.pID = o.pID;

select * from ordered_products;



-- case

select product_name, price,
	case
		when price >= 50 then 'costly'
		when price >= 20 then 'Medium'
		when price >= 0 then 'Cheap'
		else 'invalid'
	end as product_price_status
from products;



select * from ordered_products;

select * from ordered_products where payment_method is null;
select * from ordered_products where payment_method is not null;

select * from products;

insert into products
values
(6, 'rice', null);

select product_name, isnull(price, 0) from products;