#having vs where
select *
from employee_salary;

select occupation,avg(salary)
from employee_salary
where occupation like '%director%'
group by occupation
having avg(salary)>50000
;