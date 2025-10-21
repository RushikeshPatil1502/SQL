#Where clause
select first_name,
last_name,
salary
from employee_salary
where salary >= 40000;

#Date
select *
from employee_demographics
where birth_date >= '1980-01-01';

#AND OR NOT
select *
from employee_demographics
where age >= 30 and gender = "Male";


select *
from employee_demographics
where (age >= 30 and gender = "Male") or birth_date > '1983-01-01';

select first_name,
last_name,
age,
birth_date
from employee_demographics
where age > 10 and first_name like 'c__%';
 
