#Subqueries

select *
from employee_demographics
where employee_id in 
					( select employee_id
                        from employee_salary
                        where dept_id = 1 )
;

select first_name , salary ,
( select avg(salary)
  from employee_salary) as average_salary
from employee_salary;

select avg(avg_age) as average_age
from
(select gender , avg(age) as avg_age
from employee_demographics
group by gender) as avg_table
;