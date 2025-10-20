#Group by
select *
from employee_demographics;

select *
from employee_salary;

select gender, avg(age),min(age),max(age),count(age)
from employee_demographics
group by gender;

select occupation, avg(salary)
from employee_salary
group by occupation;

#Order By
select *
from employee_demographics
order by birth_date desc;

