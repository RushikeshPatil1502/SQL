#1.Select everything
SELECT *
FROM employee_demographics;

#2.Select specific coloumn and correct format and PEMDAS
SELECT first_name,
last_name,
age,
age + 10
FROM parks_and_recreation.employee_demographics;

#3.Distinct
SELECT distinct gender
FROM parks_and_recreation.employee_demographics;