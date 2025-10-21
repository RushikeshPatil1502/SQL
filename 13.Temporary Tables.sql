#temporary tables

create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_series varchar(100)
);

select *
from temp_table;

insert into temp_table
values("Rushikesh" , "Patil" , "One Piece");

select *
from temp_table;

create temporary table age_over_30
select *
from employee_demographics
where age > 30;

select *
from age_over_30; #can be used in other files as long as you dont close mysql basically a session