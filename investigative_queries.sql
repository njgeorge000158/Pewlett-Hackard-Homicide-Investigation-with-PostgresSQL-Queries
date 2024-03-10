--******************************************************************************************
--
--  File Name:  investigative_queries.sql
--
--  File Description:
--      The file contains the SQL query scripts for the Pewlett Hackard 
--      Homicide Investigation.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      Nicholas J. George
--
--******************************************************************************************/

-- ******************************************
-- 1: Managers
-- ******************************************

-- 1.1 This statement lists all the department managers.
SELECT
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,
	departments.department_name, 
	employees.sex,
	employees.birth_date,
	employees.hire_date
FROM employees
	JOIN department_managers
		ON employees.employee_id_number = department_managers.employee_id_number
	JOIN Departments
		ON department_managers.department_id = departments.department_id
	ORDER BY employees.last_name, 
			 employees.first_name;


-- ******************************************
-- 2: Employees
-- ******************************************

-- 2.1 This statement lists records for all employees hired in 1986 
-- in ascending order.
SELECT
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986
		ORDER BY employees.last_name, employees.first_name;


-- 2.2 This statement lists all employees with the first name, Hercules, 
-- and a last name starting with 'B'.
SELECT 
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE first_name = 'Hercules' 
		AND last_name like 'B%';


-- 2.3 This statement lists all employees in the Sales Department.
SELECT 
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE departments.department_name = 'Sales'
	ORDER BY employees.last_name, 
	 		 employees.first_name;


-- 2.4 This statement lists all employees in the Sales and Development Departments.
SELECT 
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE departments.department_name IN ('Sales', 'Development')
	ORDER BY employees.last_name, 
	 		 employees.first_name;


-- ******************************************
-- 3: Suspects
-- ******************************************

-- 3.1 This statement lists employees whose first name is Hercules, whose last name
-- begins with the letter B, and who were hired in 1986.
SELECT 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title,
	departments.department_name
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986 
		AND first_name = 'Hercules' AND last_name like 'B%'
	ORDER BY employees.last_name, 
	 		 employees.first_name;


-- 3.2 This statement lists each employees who were manages in either the Sales 
-- or Development departments.
SELECT 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	departments.department_name
FROM employees
	JOIN department_managers
		ON employees.employee_id_number = department_managers.employee_id_number
	JOIN departments
		ON department_managers.department_id = departments.department_id
	WHERE departments.department_name IN ('Sales', 'Development');


-- 3.3 This statement lists each employees who were hired in 1986 and were a manager 
-- in either the Sales or Development departments.
SELECT 
	employees.employee_id_number, 
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	departments.department_name
FROM employees
	JOIN department_managers
		ON employees.employee_id_number = department_managers.employee_id_number
	JOIN departments
		ON department_managers.department_id = departments.department_id
	WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986
		AND employees.sex = 'M'
		AND departments.department_name IN ('Sales', 'Development');
		