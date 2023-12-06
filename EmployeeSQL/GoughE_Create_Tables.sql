-- CREATE TABLES

-- Departments
CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

-- Department Employees
CREATE TABLE department_employees (
	emp_no INT,
	dept_no VARCHAR(5),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Department Managers
CREATE TABLE department_managers (
	dept_no VARCHAR(5),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(5),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- Salaries
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary FLOAT NOT NULL
);

-- Titles
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);