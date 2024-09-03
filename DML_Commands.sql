use personal;

-- CREATE TABLE
create table emp2(
id int primary key,
first_name varchar(20),
last_name varchar(20),
department varchar(20),
salary decimal(10,2));

insert into emp2 values
(101,'Mahendhar','baira','Electrical',35000.00),
(102,'Lasya','lakkam','Civil',45000.00),
(103,'Mamatha','beesa','Mathematics',23000.00),
(104,'Ramya','aettem','Electrical',67000.00),
(105,'Mallesh','baira','Aeronatics',56000.00);

select * from emp2;

set sql_safe_updates = 0;     #-------------->  safe updates making off

#============================================ UPDATE =================================================

#updating employees salary

update emp2
set salary = 37000
where first_name = 'mahendhar';

#========================================= INSERT =====================================================
#Adding extra record

insert into emp2 values
(106,'Rajesh','aettem','Aeronatics',45000.00);

#=============================== concatinating ========================================================

select concat(first_name," ",last_name) as fullname from emp2;