create database subqueries;
use subqueries;

create table  employeee(
emp_id int primary key,
emp_name varchar(50),
dept_name varchar(50),
salary int,
age int);

insert into employeee(emp_id,emp_name,dept_name,salary,age) values
(1,"John",101,50000,28),
(2,"Emma",101,65000,32),
(3,"Raj",102,45000,26),
(4,"Meera",103,70000,38),
(5,"Ravi",102,48000,30),
(6,"Naina",103,52000,29),
(7,"Alex",101,58000,31);

create table deprtment(
dept_id int primary key,
dept_name varchar(50));


insert into department(dept_id,dept_name) values
(101,"Sales"),
(102,"Marketing"),
(103,"Finance");

select *from employeee;
select*from department;

/* 1. Show employees whose salary is above department average. */
select emp_name 
from employeee
where salary>(select avg(salary) from employeee);


/* 2.find employee who work in the sales department */
select emp_name
from employeee
where dept_id=(select dept_id from department where dept_name="Sales");

/* 3.Find the highest paid empoyee */
select emp_name,salary
from employeee
order by salary desc
limit 1;

select emp_name
from employeee
where salary =(select max(salary) from employeee);

/* 4. Find employees older than the youngest employee */
select emp_name,age
from employeee
where age>(select min(age) from employeee);

/* 5.list employees who earn more thwn John"  */
select emp_name,salary
from employeee
where salary>(select salary from employeee where emp_name="John");

/* 6.find employees in department where the averages salalry is avobe 50000. */

select emp_name 
from employeee
where dept_id=(select dept_id from employeee group by dept_id having avg(salary)>50000);


/*7. find employees whose salary is second highest */
select emp_name 
from employeee
where salary<(select max(salary) from employeee)
order by salary desc
limit 1;

/*8. Find employees in the same department as "Emma" */
select emp_name
from employeee
where dept_id=(select dept_id from employeee where emp_name="Emma");

/* 9.List departments that have more then 2 employees. */
select dept_name
from department 
where dept_id in (select dept_id from employeee
group by dept_id having count(*)>2);

/*10. Find employees who earn more then every employees in marketing.*/
select emp_name 
from employeee
where salary>
(select max(salary) from employeee where dept_id=
(select dept_id from department where dept_name="Marketing"));


/* Q11. find the employee who earn the min salary in their department.*/
select emp_name,salary ,dept_id
from employeee
where salary in (select min(Salary) from employeee e
group by dept_id);

select emp_name, dept_id, salary
from employeee e
where salary= (select min(salary) from employeee
where dept_id=e.dept_id);

/* Q12. find the employee whose salary is above department average.*/
select emp_name, salary, dept_id
from employeee e
where salary> (select avg(salary) from employeee 
where dept_id=e.dept_id);

/*Q13. list the employeee who are younger than emma.*/
select emp_name, age
from employeee
where age<(select age from employeee where emp_name="Emma");

/*14. Find employees who do NOT work in any department present in the DEPARTMENT table.*/
select emp_name from employeee where dept_id not in  (select dept_id
from employeee );

/* 15. Find the top 2 highest salaries using a subquery.*/
SELECT emp_name, salary
FROM employeee
WHERE salary IN (
SELECT salary
FROM (
SELECT DISTINCT salary
FROM employeee
ORDER BY salary desc
LIMIT 2
) AS t);


/*16. Display employees whose salary is below department average.*/



/*17. Find employees whose age is greater than the average age.*/
select emp_name
from employeee
where age > (select avg(age) from employeee);

/*18. Find employees who belong to departments starting with 'M'.*/
select emp_name,dept_id
from employeee
where dept_id in (select dept_id from department where dept_name like "m%");

/*19. Find employees who do not have the same salary as anyone else.*/
select emp_name 
from employeee
where salary in (select salary from employeee where distnic

 