#### ---------------------- Views and Functions ---------------------------------------------------------------------

# views are just like stored procedures but there is some difference

# ---------> Importances of views
# 1. Security purpose (I want to keep data very secure) -->It just a query--> virtual thing, it wont effect our DBs, when we call views then only it works with database
# 2. For every day work., views most useful just like stored procedures

use 27thaug;
#------------------------------ create view --------------------------------------
create view rentals as
       select a.id,a.title,a.category,ifnull(b.first_name,"-") as `member` from movies as a left join members as b on a.id=b.movieid;
       
# seeing views

select * from rentals;
select * from myemp;

#----------------create a view sep_id=60---------------------------------------------
 create view dept60 as
       select * from myemp where dep_id=60;
       
# seeing views
select * from dept60;  

#--------------------Dropping views-------------------------------------------    
# Drop dept60;

#=======================================================================================================================================
#                                                       FUNCTIONS 
#=======================================================================================================================================

use 27thaug;

create function `square` (num int)
returns int
begin 
   return num * num;
end