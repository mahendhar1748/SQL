# buffer - cache 
# ---> while playing with queries.., once i am 100% confident, i can say commit. it will become permanent. we can rollback if we want
# --> until that unsaved data called cache

# Buffer Transactions
# -- this buffer transactions interacts with database and gives output(temp). whenever we say commit., then only they permanently saved
# -- we can roll back if we want

#Trasaction ----> when i start transaction then auto commit = 0 (off mode)
-- whenever the transaction fails it will roll back to previous state

set autocommit = 0;   #intially we need to set autocommit = 0

start transaction;
use personal;

create table sample(name varchar(2));
select * from sample;
savepoint s1;

insert into sample values("a");
insert into sample values("b");
savepoint s2;

insert into sample values("c");
savepoint s3;
select * from sample;

rollback to s1;
rollback to s2;

# we have s1,s2,s3 save points., if we rollback to s1 directly.., we cant rollback to s2 or s3



