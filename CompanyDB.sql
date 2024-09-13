CREATE DATABASE IF NOT EXISTS CompanyDB;

USE COMPANYDB;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department_id INT,
    job_role VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    manager_id INT,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

-- Inserting sample departments
INSERT INTO departments (department_name)
VALUES ('HR'), ('Engineering'), ('Sales'), ('Marketing');



-- Inserting sample employees
INSERT INTO employees (name, department_id, job_role, salary, hire_date, manager_id)
VALUES 
('Alice', 1, 'HR Manager', 75000, '2022-03-12', NULL),
('Bob', 2, 'Software Engineer', 60000, '2021-06-24', 1),
('Charlie', 2, 'Software Engineer', 55000, '2022-11-15', 1),
('David', 3, 'Sales Executive', 50000, '2023-01-10', NULL),
('Eve', 4, 'Marketing Specialist', 45000, '2022-09-01', NULL);

INSERT INTO employees (name, department_id, job_role, salary, hire_date, manager_id)
VALUES 
('sofia',4,'Marketing Intern',45000,'2024-09-09',5);

--1. Write an SQL query to fetch all records from a table called employees
select * from employees;
select * from departments;

--2. Write a query to select only the name and salary columns from the employees table.
select name, salary from employees

--3 How do you sort records by the hire_date in descending order?
select * from employees
order by hire_date DESC;

--4 Write an SQL query to find employees with a salary greater than 50000.
SELECT name as employee
from employees
where salary>50000;

--5 How can you find the distinct job roles in the employees table?
select job_role
from employees
group by job_role

--6 Write a query to fetch employees whose names start with 'A'.

select name as employees
from employees
where name like 'A%'

--7 How would you display records where the department is either 'HR' or 'Engineering'?
SELECT * 
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'HR' OR d.department_name = 'Engineering';

--8 Write a query to calculate the average salary from the employees table.

select SUM(salary)/COUNT(salary)from employees;

select AVG(salary) as avg_salary from employees;


--9 Write an SQL query to find the maximum salary from the employees table.

select salary from employees
order by salary DESC
LIMIT 1;

select MAX(salary) from employees;

--10 How would you fetch the top 3 highest-paid employees?

select name from employees
order by salary desc
limit 3;

--11 Write an SQL query to count the number of employees in each department.

select COUNT(e.employee_id),d.department_name 
from employees e
LEFT JOIN departments d on e.department_id=d.department_id
group by d.department_name;

--12 How would you fetch records where the salary is between 30000 and 60000?

select * from employees
where salary between 30000 and 60000;

--13 Write a query to display employees hired in 2023.

select name from employees
where hire_date like '2023%';

SELECT name
FROM employees
WHERE YEAR(hire_date) = 2023;

--14 How can you retrieve employees who have no manager (i.e., where the manager_id is null)?
select name as employees from employees
where manager_id IS NULL;

--15 Write a query to join two tables: employees and departments, on department_id.

select * from employees e   
LEFT JOIN departments d 
on e.department_id=d.department_id

--16 How would you find employees with the second-highest salary in the company?

select MAX(salary) from employees
where salary NOT IN (select MAX(salary) from employees);

--17 Write an SQL query to fetch the employee_name and department_name using a join.

select e.name, d.department_name from employees e
JOIN departments d on e.department_id=d.department_id;

--18 How would you group employees by their department and show the sum of their salaries?

select d.department_name, SUM(e.salary) as salary_sum from employees e
join departments d on e.department_id=d.department_id
group by d.department_name;

--19 Write a query to display employees with the same salary as their manager.
select e.name, e.salary, m.name,m.salary 
from employees e
JOIN employees m 
on e.manager_id=m.employee_id
where e.salary=m.salary;


--20 How would you delete records from employees where the employee_id is greater than 1000?

DELETE from employees
where employee_id > 1000;


---DAY 2

---21. Write a query to fetch all unique job roles from the employees table.

select job_role from employees
group by job_role;

---22. Write a query to find the total number of employees who earn more than 60,000.
select COUNT(employee_id)
from employees
where salary >60000;

---23. How would you retrieve the first 5 records from the employees table?
select *
from employees
limit 5;

---24. Write a query to find the second-lowest salary in the employees table.

select MIN(salary)
from employees
where salary >(select MIN(salary) from employees);

---25.How can you find employees whose salary is equal to the minimum salary in the company?
select name as employees , salary from employees
where salary=(select MIN(salary) from employees);

---26. Write a query to list employees who work in the 'Marketing' department.
select e.name as employees from employees e
JOIN departments d on e.department_id=d.department_id
where department_name='Marketing';

---27. Write a query to show the total salary paid by each department.
select d.department_name, SUM(e.salary)
from employees e
JOIN departments d on e.department_id=d.department_id
group by d.department_id;

---28. How would you fetch employees whose names end with 'n'

select name as employees from employees
where name like '%n';

---29. Write a query to calculate the difference between the highest and lowest salaries in the employees table.
select MAX(salary)- MIN(salary)
from employees;

---30. How can you list all employees whose hire date is before the year 2020?
select name as employees from employees
where YEAR(hire_date)<2020;

--31. Write a query to display employees who have been with the company for more than 5 years.
select name as employee from employees
where year(CURDATE())-year(hire_date)> 5;

---32. How would you find the average salary for each job role in the employees table?

select job_role,AVG(salary)
from employees
group by job_role;

---33. Write a query to fetch employees who do not belong to any department (i.e., department_id is NULL).

select name as employees from employees
where department_id IS NULL;

---34. How would you retrieve the employee who was hired most recently?

select name as employee from employees
order by hire_date DESC
limit 1;

select name as employee
from employees
where hire_date=(select max(hire_date)from employees);

---35. Write a query to find all employees who report to a specific manager (e.g., manager_id = 101).
select name as employees from employees
where manager_id=1;

---36. How would you fetch records of employees whose salary is either 50,000, 60,000, or 70,000?

select * from employees
where salary='50000' or salary='60000' or salary='70000';

select * from employees where salary IN (50000, 60000, 70000);


---37. Write a query to fetch the total number of employees in each job role.

select COUNT(name), job_role from employees
group by job_role;

---38. How can you display employees who were hired in the month of May (any year)?
select name as employees from employees
where month(hire_date)=5;

---39. Write a query to fetch the highest salary in each department.
select MAX(e.salary),d.department_name from employees e
join departments d on e.department_id=d.department_id
group by d.department_id;

---40. How would you delete records of employees whose employee_id is not assigned to any department?
delete from employees
where department_id is null;

---DAY 3

---41. Write a query to select the second-highest salary from the employees table without using LIMIT.

select MAX(salary) from employees
where salary<(select MAX(salary) from employees);

---42. How would you retrieve all employees who have a manager and are working in a department that starts with the letter 'S'?

select e.name as employees , m.name, d.department_name from employees e
join employees m on e.manager_id=m.employee_id
join departments d on m.department_id=d.department_id
where d.department_name like 's%' or d.department_name like 'S%';


---43.Write a query to calculate the total salary paid for each job role, but only include roles that have more than 5 employees.?

SELECT job_role, SUM(salary) as total_salary from employees
group by job_role
having count(name)>1;

---44. How can you list all employees who were hired in the last 6 months from today's date?

SELECT name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

---45. Write a query to find the department with the highest average salary.

select d.department_name,avg(e.salary)
from employees e
join
departments d on e.department_id=d.department_id
group by(d.department_name)
order by avg(e.salary) DESC
limit 1;


---46. Write a query to fetch the names of employees who have a salary greater than the average salary across the company.

select name as employee from employees
where salary>(select avg(salary) from employees);

--47. How would you find the difference in the number of employees between the 'HR' and 'Engineering' departments?

select
(select count(e.employee_id) from employees e
join departments d on e.department_id=d.department_id
where d.department_name='HR')
-
(select count(e.employee_id) from employees e
join departments d on e.department_id=d.department_id
where d.department_name='Engineering')
as  employee_count_difference;

W--48. rite a query to display the name and hire_date of the employee who has been with the company the longest.

select name,hire_date from employees
order by hire_date
LIMIT 1;

select name,hire_date from employees
where hire_date=(select MIN(hire_date) from employees);


--49. How can you count the number of employees who have a salary between 50,000 and 100,000, grouped by department?

SELECT COUNT(e.name), d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary BETWEEN 50000 AND 100000
GROUP BY d.department_name;


---50. Write a query to display the highest, lowest, and average salary for each department.*/

select d.department_name,AVG(e.salary) AS avg_salary, MAX(salary) AS MAX_SALARY, MIN(e.salary) AS MIN_SALARY
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name;