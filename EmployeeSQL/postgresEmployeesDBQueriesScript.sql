-- drop table if it exits already to avoid an error if it does exist
DROP TABLE if Exists departments; 
DROP TABLE if Exists dept_managers; 
DROP TABLE if Exists dept_employees; 
DROP TABLE if Exists employees; 
DROP TABLE if Exists salaries; 
DROP TABLE if Exists titles;

CREATE TABLE departments (
    dept_number VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255)   NOT NULL
    );
SELECT * from departments;

CREATE TABLE Dept_Managers( 
	dept_number VARCHAR(30), 
	emp_number INT 
	);
CREATE TABLE Dept_Employees( 
	emp_number INT, 
	dept_number VARCHAR(30) 
	);	
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

CREATE TABLE dept_emp (
    emp_number INT NOT NULL PRIMARY KEY
    dept_number 
	);

SELECT * from dept_emp;

CREATE TABLE dept_managers (
	dept_number,
	emp_number
	);

SELECT * from dept_managers;

CREATE TABLE Salaries (
    emp_number INT   NOT NULL PRIMARY KEY,
    salary INT   NOT NULL
    --FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
    );
SELECT * from salaries;

CREATE TABLE Titles (
    title_id VARCHAR(30)   NOT NULL PRIMARY KEY,
    title VARCHAR(255)   NOT NULL
    --FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
    --FOREIGN KEY (emp_number) REFERENCES employees(emp_number)
    );
SELECT * from titles;

Data Analysis
List the employee number, last name, first name, sex, and salary of each employee.

List the first name, last name, and hire date for the employees who were hired in 1986.

List the manager of each department along with their department number, department name, employee number, last name, and first name.

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

List each employee in the Sales department, including their employee number, last name, and first name.

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT emp_number, last_name, first_name, sex 
FROM employees; 

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date == 1986;

