
select *
from employee_demographics;

select *
from employee_salary;

#Inner Join
select dem.employee_id,dem.first_name,salary
from employee_demographics as dem
inner join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
   
select *
from employee_demographics as dem
left join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
select *
from employee_demographics as dem
right join employee_salary as sal
   on dem.employee_id = sal.employee_id;
   
select emp1.employee_id as emp,
emp1.first_name as emp_name,
emp1.last_name as emp_ln,
emp2.employee_id as sec_santa,
emp2.first_name as s_name
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id + 1 = emp2.employee_id;
    

select *
from employee_demographics as dem
inner join employee_salary as sal
   on dem.employee_id = sal.employee_id
inner join parks_departments as pd
	on sal.dept_id = pd.department_id;
   
