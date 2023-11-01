-- Create tables
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255),
    manager_id INT
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_position VARCHAR(255),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Salary (
    emp_id INT,
    salary_amount DECIMAL(10, 2),
    date_paid DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Insert data for Department
INSERT INTO Department (dept_id, dept_name, manager_id)
VALUES (1, 'HR', 1),
       (2, 'IT', 2),
       (3, 'Finance', 3);

-- Insert data for Employee
INSERT INTO Employee (emp_id, emp_name, emp_position, dept_id)
VALUES (1, 'Alice Smith', 'Manager', 1),
       (2, 'Bob Johnson', 'Manager', 2),
       (3, 'Charlie Williams', 'Manager', 3),
       (4, 'David Jones', 'Developer', 2),
       (5, 'Eva Brown', 'HR Specialist', 1),
       (6, 'Frank Miller', 'Developer', 2),
       (7, 'Grace Lee', 'Accountant', 3),
       (8, 'Henry Garcia', 'Developer', 2),
       (9, 'Ivy Wilson', 'HR Specialist', 1),
       (10, 'Jack Martinez', 'Accountant', 3);

-- Insert data for Salary
INSERT INTO Salary (emp_id, salary_amount, date_paid)
VALUES (1, 55000.00, '2023-09-01'),
       (2, 65000.00, '2023-09-02'),
       (3, 60000.00, '2023-09-03'),
       (4, 50000.00, '2023-09-04'),
       (5, 48000.00, '2023-09-05'),
       (6, 51000.00, '2023-09-06'),
       (7, 52000.00, '2023-09-07'),
       (8, 50000.00, '2023-09-08'),
       (9, 48000.00, '2023-09-09'),
       (10, 53000.00, '2023-09-10');

--1. List all the employee names and their positions from the Employee table.

Select emp_name, emp_position
from Employee


--2. List all the departments and their respective managers from the Department table.

select dept_name, emp_name as Dept_Manager
from Department 
inner join Employee on department.dept_id = Employee.dept_id
where emp_position = 'Manager';


--3. Display the employee name, department name, salary amount, and date paid for all employees who 
-- were paid after '2023-09-05'. ( Join)

Select emp_name, dept_name, salary_amount, date_paid
from Employee 
inner join Department on department.dept_id = Employee.dept_id
inner join Salary on Employee.emp_id = Salary.emp_id
where date_paid > '2023-09-05';


--4. Find the names of employees and their department 
--names where the employee earns more than the department manager. (Join)

select 
	e.emp_name, 
	d.dept_name,
	s.salary_amount as employee_salary, 
	d.manager_id, 
	m.emp_name as manager_name,
	ms.salary_amount as manager_salary
from employee e
	join salary s on s.emp_id = e.emp_id
	join department d on d.dept_id = e.dept_id
	join employee m on m.emp_id = d.manager_id
	join salary ms on ms.emp_id = m.emp_id
where s.salary_amount > ms.salary_amount;



--5. List the names of managers who manage more than 2 employees. (join)

Select emp_name, emp_position from Employee
where emp_position = 'Manager';


-- 6. Find the total salary paid for employees in the "IT" department. (Sub query)

Select SUM(salary_amount) as TotalSalary_ITdept
from Salary 
inner join Employee on Salary.emp_id = Employee.emp_id
inner join Department on Department.dept_id = Employee.dept_id
where Department.dept_id = 2;


--7.  List the names of employees who earn the same salary as 'Alice Smith'. 
--SELECT e.emp_name(Any Method, it' Challenging)

Select emp_name from Employee
inner join Salary on Employee.emp_id = Salary.emp_id
where salary_amount =
(Select salary_amount from Salary 
inner join Employee on Employee.emp_id = Salary.emp_id
where emp_name = 'Alice Smith');


--8. Using a CTE, find the average salary for employees in each department. (CTE)



with Employee_Salaries as
	(
		select 
			e.*, s.salary_amount 
		from 
			Salary s join Employee e on s.emp_id = e.emp_id
	)
select d.*,
(
	select AVG(s.salary_amount) 
	from Employee_Salaries s 
	where s.dept_id = d.dept_id
) as Avg_Salary
from Department d 


--9. Using a CTE, find the employee with the highest salary.(CTE)

 /.
 bh
