use personal;
show tables;

#====================================== Creating table ==================================================

create  table products(product_id int,name varchar(25),price float(8));

select * from products;

describe products;

insert into products values
(101,'tv',500),
(102,'phone',600),
(103,'ac',700),
(104,'LED',900),
(105,'LED',900),
(106,'microwave',900); 

select * from products;

#============================================ Dropping Table =============================================

drop table products;

#========================================= Addition of extra column ======================================
#Alter is mainly used to add/Truncate the table

alter table products
add column quantity int;

#Adding extra column at first index

alter table products
add column name varchar(10) first;

#Adding extra column at our own choice

alter table products
add column ranking int after name;


#======================================== Rename(to) ======================================================
# Rename the existing column

alter table products
rename column quantity to quant;
 
 #====================================== Dropping Column ==================================================
 #Dropping perticular column (Danger command)
 
 alter table products
 drop column quant;
 
 #============= Creatinng multiple columns ================
 
 alter table products
 add column quantity int, add column quants int;
 
 #=========== Renaming multiple columns =================
 
 alter table products
rename column quantity to quant1, rename column quants to quant2;
 
 #=========== Removing multiple columns =================
 
 alter table products
 drop column quantity , drop column quants; 
 
 #============== Deleting Records ==========================

set sql_safe_updates = 0;
delete from employees where salary is null;
 
 #============================================ Modifying data type (char --> varchar)=========================
 
 alter table products
 modify column name varchar(20);
 
 #========================================== Renaming Table name ==============================================
 
 rename table products to proditems;
 rename table proditems to products;
 #=========================================== Truncate ===============================================
 
 # What truncate actually does is.., it will delete the all records but keeps the table structure as it is....alter
  # ---> Truncate is faster than delete command
 