use sakila;

CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);



INSERT INTO Employees VALUES
(1, 'Rahul', 'IT', 60000, 'Delhi'),
(2, 'Aman', 'HR', 40000, 'Mumbai'),
(3, 'Neha', 'IT', 75000, 'Pune'),
(4, 'Simran', 'Finance', 50000, 'Delhi'),
(5, 'Karan', 'HR', 45000, 'Chennai');



--   1. create view for show only it employees
CREATE VIEW IT_Employees AS
SELECT *
FROM Employees
WHERE department = 'IT';

select * from IT_Employees;


-- 2.create a view for show the salary column 

create  view employees_salary as
select emp_name,salary
from employees;


select * from employees_salary;


-- 3.create a view for show high salary 
create view hight_salary as
select * from employees
order by salary desc;

select * from hight_salary;



-- 4.reate a view for show only delhi employees 

create view delhi_employees as 
select * from employees
where city = "Delhi";

select * from delhi_employees;



-- 5.create a view average department salary 
create  view avg_dept_salary as 
select 
avg(salary) from employees 
group by department ;

select * from avg_dept_salary;



-- 6.create view for highest_salary 
create view  highest_salary as
select emp_name,salary
from employees
where salary >40000;

select *from highest_salary;



-- 7.update highest_salary view 
create or replace view  highest_salary as 
select 
emp_name ,salary
from employees
where salary>50000;

select * from highest_salary;


drop view hight_salary;


-- 8.advance view function  
create view IT_high_salary as 
select * from IT_Employees
where salary>40000;

select * from IT_high_salary;




--  9.create view for show uniq deprtment in table 
create view uniq_department as 
select distinct department
from employees;

select * from uniq_department;


-- 10. create a view for count the employees by dept 
create  view count_employees as 
select department,
count(*) from employees
group by department;

select * from count_employees;



