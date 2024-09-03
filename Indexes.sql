# Indexes----> indexes are used to speed up the process of retreival

# if we dont use the indexes--, our cursor will check all data. this will slows the process of retrieval

use 27thaug;

show tables;

select * from myemp;

select emp_id,concat(first_name," ",last_name) as full_name, salary,
    row_number() over (order by salary desc) as rownum,
    rank() over (order by salary) as ranks,
    dense_rank() over (order by salary) as dnsrnk
    from myemp;

# Row number is uniquly gives numbers over salary coloumn 
# rank is gives ranking based on salary it will skip the ranking places( ---> If 2 members got 2nd rank, 2nd person occupies 3rd position means there is no 3rd rank)
# dense rank there is no gaps



#Q.==================== I want 5th getting salary -------- (sub query concept)

select * from  
    (select emp_id,concat(first_name," ",last_name) as full_name, salary,
    row_number() over (order by salary desc) as rownum,
    rank() over (order by salary) as ranks,
    dense_rank() over (order by salary) as dnsrnk from myemp) 
as rnktable  where dnsrnk =3 ;


#Q====================================== Partition by ========================================================================================

select *,
	row_number() over (order by salary desc) as rownum,
    rank() over (order by salary) as ranks,
    dense_rank() over ( partition by job_id order by salary) as dnsrnk
from myemp;

#--- Depending upon job_id it partitioned and assign dense rank to it





