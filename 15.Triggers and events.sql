#Triggers and Events

DELIMITER $$
create trigger insert_into_dem
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics (employee_id , first_name , last_name)
    values(new.employee_id,new.first_name,new.last_name);
end $$
DELIMITER ;

insert into employee_salary (employee_id , first_name , last_name , occupation , salary , dept_id)
values(13,"Kvicha","Kvaratskhelia","Entertainment",1000000,NULL);

delimiter $$
create event delete_rets
on schedule every 30 second
do
begin 
	delete
    from employee_demographics
    where age >= 40;
end $$
delimiter ;

select *
from employee_demographics;

show variables like "event%";