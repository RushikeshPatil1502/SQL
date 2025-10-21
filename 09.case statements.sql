#Case Statements
select *
from employee_salary;

select *
from employee_demographics;

select *
from parks_departments;

select first_name , last_name , salary ,
case
	when salary < 50000 then salary + (salary * 0.05) 
    when salary > 50000 then salary + (salary * 0.07) 
end as salary_rase ,
case 
	when dept_id = 6 then salary * 0.10
end as finace_bonus
from employee_salary;