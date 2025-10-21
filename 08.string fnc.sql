#String fnc
select first_name , length(first_name) as len
from employee_demographics
order by len desc;

select first_name , upper(first_name) as upp, lower(first_name) as low
from employee_demographics;

select first_name , substring(first_name , 3 , 6) as sub
from employee_demographics;

select first_name , locate('A',first_name) as A_let
from employee_demographics;

select concat(first_name,' ',last_name) as full_name
from employee_demographics;