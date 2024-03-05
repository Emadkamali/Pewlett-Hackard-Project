-- Retrieve all departments information
SELECT * FROM departments;

-- Retrieve all department employees information
SELECT * FROM dept_emp;

-- Retrieve all department managers information
SELECT * FROM dept_manager;

-- Retrieve all employees information
SELECT * FROM employees;

-- Retrieve all salaries information
SELECT * FROM salaries;

-- Retrieve all titles information
SELECT * FROM titles;

-- Display the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON salaries.emp_no = employees.emp_no;

-- Display the first name, last name, and hire date for the employees who were hired in 1990

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1990-01-01' AND hire_date <= '1990-12-31';

-- Display the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- Display the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

-- Display first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Display every employee in the Sales department, including their employee number, last name, and first name

SELECT emp_no, last_name, first_name 
FROM employees
WHERE emp_no IN 
(
SELECT emp_no
FROM dept_emp
WHERE dept_no IN
(
SELECT dept_no
FROM departments 
WHERE dept_name = 'Sales'
)
);


-- Disply every employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- Display the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS total_count
FROM employees
GROUP BY last_name
ORDER BY total_count DESC;  -- Order by the total count of employees with each last name