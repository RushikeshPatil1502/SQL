#CTE

with CTE_EXAMPLE as 
(
select gender, avg(salary) as avg_sal , max(salary) as max_sal , min(salary) as min_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal) as average_salary
from CTE_EXAMPLE;


with age_cte as
(
select employee_id , age
from employee_demographics
where age > 30
), 
female_cte as
(
select employee_id , gender
from employee_demographics
where gender = "Female"
)
select *
from age_cte mc
join female_cte fc
	on mc.employee_id = fc.employee_id
;
