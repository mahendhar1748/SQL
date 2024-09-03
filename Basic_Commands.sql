
# I we create a database., automatically Tables,views,stored procedures,functions got created under that 

#---------------------------------- Types of commands in SQL----------------------------------------
/*
1.DDL --> (Data Defination Language) --> This is going to talk about structures of Data ---> CREATE , ALTER , RENAME , DROP , TRUNCATE (DR.CAT)
2.DML --> (DATA MANUPULATION LANGUAGE) --> For manupulating records inside the table  ----> INSERT , DELETE , UPDATE
3.DQL --> (DATA QUERY LANGUAGE)  ----> Printing Something in console --> SELECT
4.DCL --> (DATA CONTROL LANGUAGE) --> This will give permisions to the users for their databases  --> GRANT , REVOKE 
5.TCL --> (TRANSACTION CONTROL LANGUAGE) --> Wrinting and backing up the queries that we wrote ---> COMMIT,SAVEPOINT,ROLLBACK
*/

use personal;
show tables;
-- create database personal;
create  table emp(id int,name varchar(14), dept_id int,city varchar(10),salary int);
show tables;
describe emp;

/* Inserting values into emp table */
# This is comment
-- this is comment

insert into emp values
(101,'Mahendhar',11,'Hyderabad',52000),
(102,'Lasya',11,'Hyderabad',67000),
(103,'mamatha',12,'pune',78000),
(103,'Ramya',11,'Hyderabad',45000),
(104,'Mallesh',13,'pune',34000);

select * from emp;

/* Performing some basic operations */

select name from emp where city = 'Hyderabad';
select name,salary from emp where city = 'pune';
select name,dept_id from emp where salary >= 50000;

/* setting automcommit = 0 */

set autocommit = 0;

delete from emp where city ='Hyderabad';

rollback;

/* Updating Row items  --> Update - set */

set sql_safe_updates = 0;   /* for temeperory session */

select * from emp;

update  emp
set name = "Rakesh" where id = 103;

update emp 
set id = 105 where name = 'Rakesh' and dept_id = 11;

select * from emp order by id;

#--------------------------------------------- Printing todays date and time-------------------------
select now();
select date(now());
#Current time
select current_date();
select current_time();
select date_format(now(), '%Y-%m-%d');
select month('2022-01-12'); #--> Gives 01
select monthname('2024-05-31');  #--> Gives 'may' 

#------------------------ strings------------------------------------
select "Welcome to todays session" message;
select upper('hello');
select lower("HELLO");
select length("Hello");
select concat("Hello","/","World");

#=============================================== Distinct =================================

#---> It wont reflect in original database

select distinct id,salary,salary*1.10 as total_salary from emp;
select distinct dept_id,salary,salary*1.10 as total_salary from emp;
select distinct dept_id from emp;

#=========================================== Wild card Character ========================

#----> Giving records based on wild card symbol (_ %)
select * from emp where name like 'm%';     # I dont know how many letters after 'm'
select * from emp where name like '_a_e%';  #---> i dont know 1st and 3rd letters., but i know 2nd and 4th letters
select * from emp where mail like '%@gmail%'; #---> I want the people using gmail account
select * from emp where name not like 'm%';  # ---> Other than starting with 'm'
 
#===================================== Logical Operators ======================================

select * from emp where city = 'Hyderabad' or city = 'pune';

#======= In & Not In ============================

select * from emp where city in ('Hyderabad','Pune');
select * from emp where city not in ('Hyderabad','Pune');

select * from emp where city = 'Hyderabad' and salary > 50000;

select * from emp where city != "pune";

#============================================== Is Null & Is Not Null =========================================

select * from emp where id is null;
select * from emp where id is  not null;

#================== Identifying Nulls
select *, isnull(salary) as checknulls from csv2;
select *, ifnull(ship_mode,"Yes there is a null value") as findings from csv2;

#============================================== Between ==============================================

select * from emp where salary between 40000 and 60000;
select * from emp where salary not between 40000 and 60000;

#==================================     Derived columns      ==============================================

select *, salary*0.05 as `bonus5%` from emp;
select *, salary*0.05 as `bonus5%`, salary*0.1 as `bonus10%` from emp;
select *, salary*0.05 as `bonus5%`, salary+salary*0.05 as total_salary from emp;
select * from emp; 

#================== Identifying Nulls
select *, isnull(salary) as checknulls from csv2;

#======================================================== coalesce  =================================================

#coalesce works just like ifnull
# To find in coloumns weather Nulls are exist are not(If anything is missing, if something available ---> take that one)

select *,coalesce(ship_mode,segment) from csv2;
-- coalesce is a function it will checks for nulls in given coloumns.here we took 2 cols 
-- if 1st col is null, it will give 2nd col
-- if both cols are null, it will give null
-- if no col is null, it will give priority wise here ship_mode then segment

#Q. -- If i execute left join i am getting nulls., instead null i want (-)

use 27thaug;

select a.authorid,a.name,ifnull(b.bookid,"-") as Bookid,ifnull(b.title,"-") as Title
from authors a left join books b
on a.authorid = b.authorid;

select a.authorid,a.name,coalesce(b.bookid,"-") as Bookid,coalesce(b.title,"-") as Title
from authors a left join books b
on a.authorid = b.authorid;


















 

