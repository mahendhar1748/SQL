create database practice;
use practice;

#========================= Constraints ====================================================

-- Domain constraints -----> Unique, Not Null, Check , Default
-- key constraints ------> Primary key, foreign key 

create table employeesdata (
     employee_id int primary key,                #--> Id is primary key(Not null & unique)
     first_name varchar(50) not null,            #--> First name should not be null
     last_name varchar(50) not null,
     email varchar(100) unique,                  #--> No dublicates, it should be unique
     hire_date date,
     department_id int,
     check (hire_date >= '2000-01-01'),          #--> checking wether hiredate after 2000, if not it will throw an error 
     salary decimal(10,2) default 0              #--> If we are not entered salary., defaulty it takes 0 salary
     );
     
describe employeesdata;

insert into employeesdata values
(101,'Mahendhar','Baira','mahendhar1748@gmail.com','2021-07-12',11,52000),
(102,'Lasya','lakkam','lasyalakkam@gamil.com','2016-03-14',11,67000),
(103,'mamatha','beesa','mamathabeesa@gmail.com','2016-12-14',12,78000),
(104,'Ramya','Aettem','Ramyaaettem@gmail.com','2014-12-11',11,45000),
(105,'Mallesh','baira','malleshbaira@gamil.com','2015-12-25',13,34000);

select * from employeesdata;


#===============================PRIMARY KEY================ Exercise ========================================================

create table student (
     s_id int primary key,                #--> Id is primary key(Not null & unique)
     s_name varchar(20) not null,            #--> name should not be null
     s_age int,
     check (s_age >= 18),
     course varchar(20) default ("DA"),               
     fees decimal(6,2)
     );
     
insert into student values
(101,'Mahendhar',25,'Data Science',5200),
(102,'Lasya',26,"Data Engineer",6700),
(103,'mamatha',27,"Machine learning",7800),
(104,'Ramya',30,"Data Engineer",4500),
(105,'Mallesh',32,"Data Engineer",3400);

insert into student(s_id,s_name,s_age,fees) values (106,"Rajesh","27",5600);   # Here deafualty DA takes in course 
-- drop table student;
select * from student;
#======================================================================================================================================
-- -----------------------------------Key Constraints-------------------------
-- Primary Key doesnt have dublicates
-- foreign key may have dublicates
#*************************
alter table student
add column course_id int;

set sql_safe_updates = 0;   /* for temeperory session */

update student
set course_id = case
when course="Data Science" then 301
when course="Data Engineer" then 302
when course="Machine learning" then 303
else 304
end;
#*****************************








 
