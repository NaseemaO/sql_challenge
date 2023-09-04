-- drop table if it exits already to avoid an error if it does exist
DROP TABLE if Exists departments; 
DROP TABLE if Exists dept_managers; 
DROP TABLE if Exists dept_employees; 
DROP TABLE if Exists employees; 
DROP TABLE if Exists salaries; 
DROP TABLE if Exists titles;

--Create tables, import csv data files
CREATE TABLE departments (
    dept_number VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
    );
SELECT * from departments;

CREATE TABLE dept_managers( 
	dept_number VARCHAR(30),
	emp_number INT
	--FOREIGN KEY (dept_number) REFERENCES employees(dept_number),
	--FOREIGN KEY (emp-number) REFERENCES departments(emp_number)
	);
SELECT * from dept_managers

CREATE TABLE dept_employees( 
	emp_number INT, 
	dept_number VARCHAR(10) 
	--FOREIGN KEY (emp_number) REFERENCES employees(emp_number),
	--FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
	);	
SELECT * from dept_employees
	
CREATE TABLE employees (
    emp_number INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(255),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date DATE NOT NULL
    --FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
    );
SELECT * from employees

CREATE TABLE salaries (
    emp_number INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL
    --FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
    );
SELECT * from salaries;

CREATE TABLE titles (
    title_id VARCHAR(30) NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
    --FOREIGN KEY (emp_number) REFERENCES employees(emp_number),
	--FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
    );
SELECT * from titles;

--Data Analysis. 8 queries:
--1. List the employee number, last name, first name, sex, and salary of each employee.
--returned 300024 rows.
SELECT employees.emp_number, employees.last_name, employees.first_name, employees.sex
FROM employees
INNER JOIN salaries ON
employees.emp_number = salaries.emp_number;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- returned 36150 rows.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- first join on dept_managers for the emp_number in all dept_manager rows; total 24 rows, next join on departments from dept_managers on dept_number
--to get the dept_name. Query returned 24 rows.
SELECT dept_managers.dept_number, departments.dept_name, employees.emp_number, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_managers ON
employees.emp_number = dept_managers.emp_number
INNER JOIN departments ON
dept_managers.dept_number = departments.dept_number;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--Aliases assigned employees AS e, dept_employees AS de, departments AS d
-- ? total rows in 300024 in employees, and total rows in dept_employees 331603. 
--Query returned 331603 rows.
SELECT de.dept_number, e.emp_number, e.last_name, e.first_name, d.dept_name 
FROM employees e
INNER JOIN dept_employees de ON
e.emp_number = de.emp_number
INNER JOIN departments d ON
de.dept_number = d.dept_number;

SELECT * from dept_employees 
SELECT * from employees 

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--returned 20 rows.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
-- dept_name Sales with dept_number d007 Query returned total 52245 rows.
SELECT d.dept_number, d.dept_name, e.emp_number, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_employees de ON
e.emp_number = de.emp_number
INNER JOIN departments d ON
de.dept_number = d.dept_number
WHERE dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- dept_number for Development is d005. Query returned total 137952 rows.
SELECT d.dept_number, d.dept_name, e.emp_number, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_employees de ON
e.emp_number = de.emp_number
INNER JOIN departments d ON
de.dept_number = d.dept_number
WHERE dept_name = 'Sales' OR dept_name = 'Development';
 
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--returned total 1638 rows.
SELECT last_name, COUNT (last_name) 
FROM employees e
GROUP BY last_name
ORDER BY count(last_name) desc;

