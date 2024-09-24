## sub-query is query inside the main query

#Q.1 -------------------------> i want people whose salary > avg salary

use 27thaug;

select avg(salary) from myemp;  #-->6456.0  
select * from myemp where salary > 6456.60;

select * from myemp where salary > (select avg(salary) from myemp);

#Q.2---------------------------------------------------> find 2nd most highest salary

select * from myemp order by salary desc limit 1,1;

#Q.3 ------------------------------------------------->  i want 3rd max salary
select * from myemp where salary < (select max(salary) from myemp) limit 2,1;

#Q.4 -----------------------------------------------> Find the authors who have written more than 3 books

select * from books;
select * from authors; 

select a.name, count(b.title) as cnt from books b left join authors a 
on b.authorid=a.authorid group by name having cnt >= 3;

#Q.5----------------------------------------------------> find the all books with their authors

select * from (select a.name,b.title from authors as a inner join books as b
on a.authorid = b.authorid) as test;

#Q.6----------------------------------------------> find books written by chetan baghath

select * from (select a.name,b.title from authors as a inner join books as b
               on a.authorid = b.authorid)
 as test where name = "Chetan Bhagat";

-- or 
select * from books where authorid in (select authorid from authors where name = "Chetan Bhagat");


#.Q#Q.==================== I want 5th getting salary

select * from  
    (select emp_id,concat(first_name," ",last_name) as full_name, salary,
    row_number() over (order by salary desc) as rownum,
    rank() over (order by salary) as ranks,
    dense_rank() over (order by salary) as dnsrnk from myemp)
as rnktable  where dnsrnk =3 ;
