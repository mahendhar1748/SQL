create database 27thAug;
use  27thAug;
select * from authors;
select * from myemp;

# ================== Full name  and salary
select concat(first_name," ",last_name) as full_name,salary from myemp;

# =================== Full name and salary for those who are from dept_id is 50
select concat(first_name," ",last_name) as full_name,salary,dep_id from myemp where dep_id = 50;

# =================== Full name and salary for those who are from dept_id is 50 and salary > 5000
select concat(first_name," ",last_name) as full_name,salary,dep_id from myemp where dep_id = 50 and salary>5000;

# ================ How many departments are there ina company
select count(distinct(dep_id)) from myemp;
select dep_id,count(dep_id) from myemp group by dep_id;

# ================= Each department salary spending
select dep_id,sum(salary) as total_salary,count(dep_id) as no_dep from myemp group by dep_id;

# ================= Each department salary spending other than 10
select dep_id,sum(salary) as total_salary,count(dep_id) as no_dep from myemp where dep_id !=10 group by dep_id;

#=============================================================================================================================
use 27thaug;

select * from csv2;

#===================================== Identifying Nulls
select *, isnull(salary) as checknulls from csv2;
select *, ifnull(ship_mode,"Yes there is a null value") as findings from csv2;

#=========================== coalesce=================================================

# To find in coloumns weather Nulls are exist are not

select *,coalesce(ship_mode,segment) from csv2;
-- coalesce is a function it will checks for nulls in given coloumns.  





