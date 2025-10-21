#Window Function

select gender , avg(salary)
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id
group by gender; #this is grp by

#Window fnc
select gender , dem.first_name , dem.last_name , avg(salary) over(partition by gender) as avg_sal #can add info additional
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
#Rolling Total !!!!!
select dem.first_name , dem.last_name , gender,
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_total
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;
     
#Row_num , Rank , Dense Rank
select dem.first_name , dem.last_name , gender, salary ,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_
from employee_demographics dem
join employee_salary sal
     on dem.employee_id = sal.employee_id;