use Student;

create table emp(
id int primary key auto_increment,
name varchar(50),
department varchar(50),
salary int
);



-- 1. Show all employees
delimiter //
create procedure ShowAllEmployees()
begin
    select * from emp;
end //
delimiter ;

-- 2. Get employees by department
delimiter //
create procedure GetEmpByDept(in dept_name varchar(50))
begin
    select * from emp where department = dept_name;
end //
delimiter ;

-- 3. Add a new employee
delimiter //
create procedure AddEmployee(
in emp_name varchar(50),
in emp_dept varchar(50),
in emp_salary int)
begin
    insert into emp(name,department,salary)
    values(emp_name,emp_dept,emp_salary);
end //
delimiter ;

-- 4. Total salary of all employees
delimiter //
create procedure TotalSalary()
begin
    select sum(salary) as total_salary from emp;
end //
delimiter ;

-- 5. Increase salary by department
delimiter //
create procedure IncreaseSalaryByDept(
in dept_name varchar(50),
in percent_inc decimal(5,2))
begin
    update emp
    set salary = salary + (salary * percent_inc / 100)
    where department = dept_name;
end //
delimiter ;

-- 6. Delete employee by id
delimiter //
create procedure DeleteEmpById(in emp_id int)
begin
    delete from emp where id = emp_id;
end //
delimiter ;

-- 7. Get employee by id
delimiter //
create procedure GetEmpById(in emp_id int)
begin
    select * from emp where id = emp_id;
end //
delimiter ;

-- 8. Count total employees
delimiter //
create procedure CountEmployees()
begin
    select count(*) as total_employees from emp;
end //
delimiter ;

-- 9. Find highest salary
delimiter //
create procedure HighestSalary()
begin
    select max(salary) as highest_salary from emp;
end //
delimiter ;

-- 10. Find lowest salary
delimiter //
create procedure LowestSalary()
begin
    select min(salary) as lowest_salary from emp;
end //
delimiter ;

-- 11. Average salary
delimiter //
create procedure AverageSalary()
begin
    select avg(salary) as average_salary from emp;
end //
delimiter ;

-- 12. Update department by employee id
delimiter //
create procedure UpdateDepartment(
in emp_id int,
in new_dept varchar(50))
begin
    update emp
    set department = new_dept
    where id = emp_id;
end //
delimiter ;

-- 13. Update salary by employee id
delimiter //
create procedure UpdateSalary(
in emp_id int,
in new_salary int)
begin
    update emp
    set salary = new_salary
    where id = emp_id;
end //
delimiter ;

-- 14. Employees with salary greater than given amount
delimiter //
create procedure SalaryGreaterThan(in amount int)
begin
    select * from emp
    where salary > amount;
end //
delimiter ;

-- 15. Count employees in a department
delimiter //
create procedure CountEmpInDept(in dept_name varchar(50))
begin
    select count(*) as total_emp
    from emp
    where department = dept_name;
end //
delimiter ;
