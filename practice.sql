use personal;
select * from emp;

#========================> How do you find second highest salary

select * from emp order by salary desc limit 2;  # First 2 rows displayed
select * from emp order by salary desc limit 1,1; #only perticular row displayed(1,1 --> skipping 1 row displaying 1 row)

#=========================> How do you find 4th highest salary

select * from emp order by salary desc limit 3,1; #--> Skipping 3 rows 

#========================> I have mixed numbers in a column, I want +ve and -ve numbers in separate cols
create table practice(val int);
insert into practice values(1),(-3),(-45),(34),(67),(-43),(-45);
select * from practice;
select *, val > 0 as positive_values ,val < 0 as negative_values from practice;
drop table practice;

#========================>  Find the top 3 orders with more profit
select * from store order by profit desc limit 3;
-- perticular region
select * from store 
   where `region name` = "Asia"
   order by profit desc limit 3;
   
#=========================> Find the records for perticular date
select * from store where order_date = "2020-05-21";

#===========================================--------- If else in SQL -------------===============================================

#-- I have mixed numbers in a column, I want sum of +ve and -ve numbers in separate cols..?
# -- I have diff salary ranges., i want to put them into different classes..?







