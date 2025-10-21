#Limit
select *
from employee_salary
order by salary desc
limit 5; #top 5

select *
from employee_salary
order by salary desc
limit 3 , 2; #after top 3 2 rows

#aliasing
select occupation , avg(salary) AS avg_salary
from employee_salary
group by occupation
having avg_salary > 70000;