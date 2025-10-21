#Unions
select first_name , last_name , "Young man" as Label
from employee_demographics
where age < 35 and gender = "male"

union

select first_name , last_name , "Young man" as Label
from employee_demographics
where age < 35 and gender = "female"

union

select first_name , last_name , "Low Pay" as label
from employee_salary
where salary < 55000

order by first_name
;