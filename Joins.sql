# Joins are used to add columns
# Append  and set operators(union,union all,minus,intersect) are used to add rows


use practice;
#For joins atleast one column in multiple tables should be same

create table table1(p_id varchar(2),name varchar(10));
create table table2(p_id varchar(2),price int);

insert into table1 values
('a','tv'),('b','phone'),('c','ac'),('d','refridge'),('e','led'),('f','microwave');

insert into table2 values
('a',5000),('b',12000),('c',20000),('d',10000),('g',500),('i',3000);

select * from table1;
select * from table2;

#------------------ Inner Join ------------------------------------------------------------------------

select table1.p_id,table1.name,table2.price 
from table1 inner join table2
on table1.p_id = table2.p_id;              # --> On is the key word

-- alisaes

select t1.p_id,t1.name,t2.price 
from table1 as t1 inner join table2 as t2
on t1.p_id = t2.p_id;  

#------------------ Left Join ------------------------------------------------------------------------

select t1.p_id,t1.name,t2.price 
from table1 as t1 left join table2 as t2
on t1.p_id = t2.p_id; 

#------------------ Right Join -------------------------------------------------------------------------

select t1.p_id,t1.name,t2.price 
from table1 as t1 right join table2 as t2
on t1.p_id = t2.p_id;

# ------------------ full outer Join ------------------------------------------------------------------

-- MYSQL dosent support full outer join., we need to make it in diff way

SELECT * FROM table1 as t1
LEFT JOIN table2 as t2 ON t1.p_id = t2.p_id
UNION
SELECT * FROM table1 as t1
RIGHT JOIN table2 as t2 ON t1.p_id = t2.p_id;

-- OR ---

select t1.p_id,t1.name,t2.price 
from table1 as t1 left join table2 as t2
on t1.p_id = t2.p_id 
union
select t1.p_id,t1.name,t2.price 
from table1 as t1 right join table2 as t2
on t1.p_id = t2.p_id;

#---------------------------- Self Join ---------------------------------------------------------
select * from student;

#Q. I want the name of the students and their reporting manager name
select a.s_name,b.s_name as report_mngr_name from student as a
left join student as b
on a.report_manager = b.s_id;
-- -------------------------------
select a.course,a.s_name,b.s_name as report_mngr_name from student as a
left join student as b
on a.report_manager = b.s_id;

#--------------------------------- Cross Join ---------------------------------

# we use cross join for one to many situations
# eg ; IPL , (srh v/s all teams) schedule

select * from meals;
select * from drinks;

select *,meals.rate + drinks.rate as `total price` from meals cross join drinks;

#=====================================================================================================================================

use 27thaug;
select * from books;
select * from authors;

# Author name and books
select * from authors left join books on authors.authorid = books.authorid;
select * from authors inner join books on authors.authorid = books.authorid;
select * from authors right join books on authors.authorid = books.authorid;

select a.authorid,a.name,b.bookid,b.title 
from authors a inner join books b
on a.authorid = b.authorid;

# -- If i execute left join i am getting nulls., instead null i want (-)

select a.authorid,a.name,ifnull(b.bookid,"-") as Bookid,ifnull(b.title,"-") as Title
from authors a left join books b
on a.authorid = b.authorid;

select a.authorid,a.name,coalesce(b.bookid,"-") as Bookid,coalesce(b.title,"-") as Title
from authors a left join books b
on a.authorid = b.authorid;



#=====================================================================================================================================
select * from movies;
select * from members;

# --Can you tell me who have used which movie
select * from movies inner join members 
on movies.id = members.movieid;

# =================================== union and union all ========================================================

# UNION ---> any common element it reurns only once(it will avoid the repetations)
# eg: a={1,2,3} b={3,4,5} ---> a union b ---> {1,2,3,4,5}
-- ---------------------
# UNION ALL ---> any element if it occured twice will be displayed(it will recognize repetations)
# eg: a={1,2,3} b={3,4,5} ---> a union all b ---> {1,2,3,3,4,5}

select * from movies left join members 
on movies.id = members.movieid
union
select * from movies right join members 
on movies.id = members.movieid;

select * from movies left join members 
on movies.id = members.movieid
union all
select * from movies right join members 
on movies.id = members.movieid;

#====================================================== TaSK ================================================

#Q. I want the name of the emp id and firstname,mg_id,mngr_name from my emp
select * from myemp;
select a.emp_id,a.first_name,a.mgr_id,b.first_name as mgr_name  from myemp as a
left join myemp as b
on a.mgr_id = b.emp_id; 