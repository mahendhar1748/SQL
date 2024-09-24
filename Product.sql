create database practice3;
use practice3;

create  table products(product_id int,name varchar(25),price float(8));

select * from products;

insert into products values
(101,'tv',500),
(102,'phone',600),
(103,'ac',700),
(104,'LED',900),
(105,'LED',900),
(106,'microwave',900); 

select * from products;