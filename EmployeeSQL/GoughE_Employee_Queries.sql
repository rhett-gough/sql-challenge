-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
	JOIN salaries as s
		ON e.emp_no = s.emp_no;
		
-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' 
	AND hire_date < '1987-01-01';
	
-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM department_managers AS dm
JOIN employees AS e
	ON e.emp_no = dm.emp_no
JOIN departments AS d
	ON d.dept_no = dm.dept_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees AS de
JOIN employees AS e
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no;
	
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no, e.last_name, e.first_name
FROM department_employees AS de
JOIN employees AS e
	ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees AS de
JOIN employees AS e
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007'
	OR de.dept_no = 'd005';
	
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;