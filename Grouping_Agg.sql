use personal;

#======================Groupings & Aggregations (SUM,COUNT,MIN,MAX,AVG) =================================

select max(profit) max_profit,min(profit) min_profit from store;

#--> Find the profits across the ship modes
select `ship_mode`,sum(profit) from store group by 'ship_mode';
select `ship_mode`,sum(profit) from store group by 'ship_mode' order by sum(profit) desc;
select `region`,sum(profit) from store group by 'region' order by sum(profit) desc;

#----> find the profit across region on perticular date
select region,sum(profit)
     where "order_date" = '03-01-2020'
     group by region; 
# ====================================================================================================================================
use 27thaug;

select * from myemp;

# ================ How many departments are there ina company
select count(distinct(dep_id)) from myemp;
select dep_id,count(dep_id) from myemp group by dep_id;

# ================= Each department salary spending
select dep_id,sum(salary) as total_salary,count(dep_id) as no_dep from myemp group by dep_id;

# ================= Each department salary spending other than 10
select dep_id,sum(salary) as total_salary,count(dep_id) as no_dep from myemp where dep_id !=10 group by dep_id order by dep_id;

# =============== find count,sum,max,min,avg of all departments
select dep_id,sum(salary) as total_salary,
min(salary) as min_salary,
max(salary) as max_salary,
-- avg(salary) as avg_salary,
round(avg(salary),2) as avg_salary,
count(*) as count,
count(dep_id) as no_dep from myemp
group by dep_id order by dep_id;

#




