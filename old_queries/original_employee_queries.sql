--******************************************************************************************
--
--  File Name:  original_employee_queries.sql
--
--  File Description:
--      The file contains the SQL query scripts for the original Pewlett Hackard 
--      legacy employee tables.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      Nicholas J. George
--
--******************************************************************************************/

-- This statement lists the employee number, last name, first name, sex, and salary 
-- of each employee.
SELECT 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,  
	employees.sex, 
	employee_salaries.employee_salary
FROM employees
	JOIN employee_salaries
		ON employees.employee_id_number = employee_salaries.employee_id_number;

-- This statement lists the first name, last name, and hire date for the employees 
-- who were hired in 1986.
SELECT
	employees.first_name, 
	employees.last_name, 
	employees.hire_date 
FROM employees
	WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986;

-- This statement lists the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT
	department_managers.department_id, 
	departments.department_name, 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name
FROM employees
	JOIN department_managers
		ON employees.employee_id_number = department_managers.employee_id_number
	JOIN departments
		ON department_managers.department_id = departments.department_id;

-- This statement lists the department ID for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT 
	departments.department_id, 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,  
	departments.department_name
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id;

-- This statement lists the first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B.
SELECT 
	employees.first_name, 
	employees.last_name, 
	employees.sex 
FROM employees
	WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%';

-- This statement lists each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT 
	employees.employee_id_number, 
	employees.last_name,
	employees.first_name 
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	WHERE department_name = 'Sales';

-- This statement lists each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT 
	employees.employee_id_number, 
	employees.last_name,
	employees.first_name,
	departments.department_name
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
			WHERE departments.department_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	employees.last_name, 
	COUNT(employees.last_name) 
		AS last_name_frequency_count
FROM employees
	GROUP BY employees.last_name
		ORDER BY last_name_frequency_count DESC;
		