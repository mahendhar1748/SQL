# Redundancy --> un necessary repeating things are redundancies (dublicates,Nulls...etc)

# Normalization --> To reduce the redundancy we use normalization

# Cardinality ---> It is nothing but order of a column
--    eg: a={A,D,C} ---> cardinality of a ---- n(a) = 3
--    eg: b={A,D,C,d} ---> cardinality of b ---- n(b) = 4
--    eg: a U b  ---> n(a U b) = 4 

use 27thaug;

# Import 2 csv files data1(1-14 records) and data2(14-30 records)

# Joins are used to add columns
# Append  and set operators(union,union all,minus,intersect,Except) are used to add rows(Minus operator doesnt work in mysql)

#==================================================== SET OPERATORS ======================================================================

# UNION ---> any common element it reurns only once(it will avoid the repetations)
# eg: a={1,2,3} b={3,4,5} ---> a union b ---> {1,2,3,4,5}
-- ---------------------
# UNION ALL ---> any element if it occured twice will be displayed(it will recognize repetations)
# eg: a={1,2,3} b={3,4,5} ---> a union all b ---> {1,2,3,3,4,5}


select * from data1 
union
select * from data2;

select * from data1 
union all
select * from data2;

# ========== Excep/ Minus======(Subtracting perticular stuff/ Records)

select * from data1 except select * from data2;
select * from data1 except select * from data2;

#=========== Intersect ------ ( Anything that are present in both the tables)======

select * from data1 intersect select * from data2;

