-- Data Analysis
-- See query_results folder for results
-- 1. List the employee number, last name, first name, sex, and salary of each employee 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, first name, and last name
SELECT dm.dept_no, d.dept_name, e.first_name, e.last_name
FROM dept_manager AS dm
JOIN employee AS e ON
dm.emp_no = e.emp_no
JOIN departments AS d ON
dm.dept_no = d.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name 
SELECT de.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM dept_emp AS de
JOIN employee AS e ON
de.emp_no = e.emp_no
JOIN departments AS d ON
de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose 
-- last name begins with the letter B 
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name 
SELECT emp_no, last_name, first_name
FROM employee
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name 
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
JOIN employee AS e ON
de.emp_no = e.emp_no
JOIN departments AS d ON
de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Departments');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
-- share each last name) 
SELECT COUNT(last_name) AS emp_count, last_name
FROM employee
GROUP BY last_name
ORDER BY emp_count DESC;