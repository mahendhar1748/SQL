# =========================================================================================================================
# Every day if are used to do the same work 
-- eg: if we have a sales project., every day data is updated and we need to run the perticular queries for everyday
# in that scenarios we use "PROCEDURES"

#=========================================================================================================================

# Redundancy --> un necessary repeating things are redundancies (dublicates,Nulls...etc)

# Normalization --> To reduce the redundancy we use normalization

#==========================================================================================================================

-- WE CAN CHANGE THE DELIMETERS AS OUR WISH (; $$ // \\ ++ -- )
-- delimiter //
delimiter ;

use 27thaug;

select * from myemp ;

#----------------------------------------------------------------------------------------------------------------------------
# ==================== Creating Procedures =============================================================================================
-- use db
-- delimiter $$
-- create procedure name()
-- begin
-- write the query
-- end $$
-- delimiter ;

-- ---------------------
show procedure status;    # To see the stored_procedures

-- ---------------------
-- systm gets confused..., so , delimiter should be differnt for stored_procedures but internal queries delimiter should be same as default(;)
#----------------------------------------------------------------------------------------------------------------------------------------

delimiter $$
create procedure get_emps()  # Creating procudure
begin
    select * from myemp;
end $$

delimiter ;

#calling procedure
call get_emps();


show procedure status;

#Dropping procedure
drop procedure get_emps;

#---------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure get_books()  # Creating procudure
begin
    select *, ifnull(bookid,"Yes there is a null value") as findings from books;
end $$

delimiter ;

call get_books();

show procedure status;
#--------------------------------------------------------------------------------------------------------------------------------------------
select * from myemp where emp_id = 102;
# ------------------------- passing arguments-----------
delimiter $$
create procedure get_emp(in id int)  # Creating procudure
begin
    select * from myemp where emp_id = id;
end $$

delimiter ;

call get_emp(102);  #giving emp id while calling proc
call get_emp(100);

#-----------------------------------------------------------------------------------------------------------------------------------

select * from myemp where salary =  25000;
# ------------------------- passing arguments-----------
delimiter $$
create procedure get_sal(in id int)  # Creating procudure
begin
    select concat(FIRST_NAME," ",last_name) as `full name`,salary from myemp where emp_id = id;
end $$

delimiter ;

call get_sal(102);  #giving emp id while calling proc
call get_sal(100);

#-------------------------------------------------------------------------------------------------------------------------------------













