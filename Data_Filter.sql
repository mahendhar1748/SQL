use personal;

-- CREATE TABLE
create table employees(
id int primary key,
name varchar(20),
department varchar(20),
salary decimal(10,2));

insert into employees values
(101,'Mahendhar','Electrical',35000.00),
(102,'Lasya','Civil',45000.00),
(103,'Mamatha','Mathematics',23000.00),
(104,'Ramya','Electrical',67000.00),
(105,'Mallesh','Aeronatics',56000.00);

select * from employees;

#Add records to the particular column

insert into employees(id,name,salary) 
values(106,"Rahul",45000.00);

set sql_safe_updates = 0;
	delete from employees where salary is null;

alter table employees
       add column ranking int first;

select* from employees;

# I want column between name and department
alter table employees
      add column ranking_2 int after name;

#Dropping columns(Un - wanted columns)

alter table employees
       drop ranking, drop ranking_2;
#============================================= DATA FILTERATIONS =(Store dataset)=====================================
#CSV FILE Data Filteration

# What are the orders from corporate segment
select * from store
where segment = 'Corporate';

# Products having sales morethan 150
select products from store
where sales > 150;

#which product discount is higher

select product from store order by desc;

#which state has more profit
select state from store order by asc;

#which day has highest sales
select day,count(sales) from store;

#Central region
select * from store where region like 'C%';

select * from store where 'order_date' > '15-01-2020';
select * from store where region = 'South' and segment='Consumer';
select * from store where region = 'South' or segment = 'Counsumer';
select * from store where `order date`='15-01-2020';   # Only works if there is space in column names
select * from store where segment in ("Consumer","Corporate");
select * from store where segment not in ("consumer","Corporate") and profit>=100;
select * from store where segment not in ("consumer","Corporate") and profit>=100 order by 'Row id'  desc limit 5;

select distinct(`ship mode`) from store;


