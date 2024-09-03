use personal;

#-- I want to increase the salary based on department wise
# -- I have diff salary ranges., i want to put them into different classes..?
#-- I have mixed numbers in a column, I want sum of +ve and -ve numbers in separate cols..?

create table practice(val int);
insert into practice values(1),(-3),(-45),(34),(67),(-43),(-45);
select * from practice;
select * from emp2;

# Q.1-------------
select *,
(case department
when 'Electrical' then salary*0.2 + salary
when 'Civil' then salary*0.15 + salary
when 'Mathematics' then  salary*0.12 + salary
else salary
end) as revised_salary
from emp2;

#Q.2=========

select *,
(case 
when salary<=30000.00 then "Lower Grade"
when salary between 30000.00 and 50000.00 then "Avg Grade"
when salary>=50000.00 then "HigherGrade"
else "low"
end) as Salary_grade
from emp2;

#Q.3-------------------------

select *,
case when val>=0 then val end as positive_val,
case when val<=0 then val end as Negative_val
from practice;


#====================== Bonus by salary============

select *,
(case 
when salary<=30000 then salary+10000
when salary between 30000.00 and 50000.00 then salary+7000
when salary>=50000 then salary+5000
else salary+2000
end) as Bonus_salary
from emp2;

#===================== Multiple statemetns==============

select *,
(case 
when salary<=30000.00 then "Lower Grade"
when salary between 30000.00 and 50000.00 then "Avg Grade"
when salary>=50000.00 then "HigherGrade"
else "Very_low"
end) as Salary_grade,

(case 
when salary<=30000 then salary+10000
when salary between 30000.00 and 50000.00 then salary+7000
when salary>=50000 then salary+5000
else salary+2000
end) as Bonus_salary
from emp2;


#============================== Adding to perticular column======================================
use practice;
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
select * from student;

alter table student
add column report_manager int;

update student
set report_manager = case
when course="Data Engineer" then 103
when course="Machine learning" then 105
else 101
end;