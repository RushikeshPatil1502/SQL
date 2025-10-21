#Stored Procedure

create procedure age_above_40()
select *
from employee_demographics
where age > 40;

call age_above_40();

DELIMITER $$
create procedure age_buck()
begin
		select *
		from employee_demographics
		where age > 30;
		select *
		from employee_demographics
		where age > 40;
end $$
DELIMITER ;

call age_buck();


DELIMITER $$
create procedure birth_d(emp_id INT)
begin
		select birth_date
		from employee_demographics
		where employee_id = emp_id;
end $$
DELIMITER ;

call birth_d(3);

