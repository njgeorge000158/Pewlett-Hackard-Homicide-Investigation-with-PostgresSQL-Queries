--******************************************************************************************
--
--  File Name:  data_integrity_queries.sql
--
--  File Description:
--      The file contains SQL query scripts for checking the integrity of
--      database tables containing legacy employee data for the Pewlett
--      Hackard Homicide Investigation.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      Nicholas J. George
--
--******************************************************************************************/

-- ***********************************************
-- 1: Database Table: DepartmentIDPerEmployee
-- ***********************************************

-- 1.1 Display all the data in the table.
SELECT * FROM department_id_per_employee
	ORDER BY department_id_per_employee.employee_id_number


-- 1.2 Count the number of rows in the table.
SELECT COUNT (*) FROM department_id_per_employee


-- 1.3 Count the number of distinct department IDs.
SELECT 
	COUNT (DISTINCT department_id_per_employee.department_id) 
FROM department_id_per_employee;


-- 1.4 Count the number of distinct employee IDs.
SELECT 
	COUNT (DISTINCT department_id_per_employee.employee_id_number) 
FROM department_id_per_employee;


-- 1.5 In descending order, display the department count 
-- for each employee record. 
SELECT
    employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employee_job_titles.job_title,
	COUNT (department_id_per_employee.employee_id_number)
		AS department_id_frequency_count
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	GROUP BY employees.employee_id_number, 
			 employee_job_titles.job_title
		HAVING COUNT (department_id_per_employee.employee_id_number) > 1
	ORDER BY (COUNT (department_id_per_employee.employee_id_number), 
			  employees.last_name, 
			  employees.first_name) DESC;


-- 1.6 This statement lists the each department and the number of employees.
SELECT
	departments.department_name, 
	COUNT (department_id_per_employee.department_id)
		AS department_frequency_count
FROM department_id_per_employee
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	GROUP BY departments.department_name, departments.department_id
	ORDER BY department_frequency_count DESC;


-- ***********************************************
-- 2: Database Table: DepartmentManagers
-- ***********************************************

-- 2.1 Display all the data in the table.
SELECT * FROM department_managers
	ORDER BY department_managers.department_id


-- 2.2 Count the number of rows in the table.
SELECT COUNT (*) FROM department_managers


-- 2.3 Count number of distinct department IDs.
SELECT 
	COUNT (DISTINCT department_managers.department_id) 
FROM department_managers;


-- 2.4 Count number of distinct employee ID numbers among Department Managers.
SELECT 
	COUNT (DISTINCT department_managers.employee_id_number) 
FROM department_managers;


-- 2.5 Display any duplicate employee ID numbers among Department Managers.
SELECT
    department_managers.employee_id_number, 
	COUNT (department_managers.employee_id_number) 
		AS employee_id_frequency_count
FROM department_managers
	GROUP BY department_managers.employee_id_number
		HAVING COUNT (department_managers.employee_id_number) > 1


-- ***********************************************
-- 3: Database Table: Departments
-- ***********************************************

-- 3.1 Display all the data in the table.
SELECT * FROM departments
	ORDER BY departments.department_id


-- 3.2 Count the number of rows in the table.
SELECT COUNT (*) FROM departments


-- ***********************************************
-- 4: Database Table: EmployeeJobTitles
-- ***********************************************

-- 4.1 Display all the data in the table.
SELECT * FROM employee_job_titles
	ORDER BY employee_job_titles.employee_title_id


-- 4.2 Count the number of rows in the table.
SELECT COUNT (*) FROM employee_job_titles


-- ***********************************************
-- 5: Database Table: EmployeeSalaries
-- ***********************************************

-- 5.1 Display all the data in the table.
SELECT * FROM employee_salaries
	ORDER BY employee_salaries.employee_id_number


-- 5.2 Count the number of rows in the table.
SELECT COUNT(*) FROM employee_salaries


-- 5.3 Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT employee_salaries.employee_id_number) 
FROM employee_salaries;


-- 5.4 Display any duplicate employee IDs.
SELECT
    employee_salaries.employee_id_number,
	COUNT (employee_salaries.employee_id_number)
FROM employee_salaries
	GROUP BY employee_salaries.employee_id_number
		HAVING COUNT (employee_salaries.employee_id_number) > 1
    ORDER BY employee_salaries.employee_id_number


-- ***********************************************
-- 6: Database Table: Employees
-- ***********************************************

-- 6.1 Display all the data in the table.
SELECT * FROM employees
	ORDER BY employees.last_name, employees.first_name


-- 6.2 Count the number of rows in the table.
SELECT COUNT(*) FROM employees


-- 6.3 Count the number of distinct employee IDS.
SELECT 
	COUNT (DISTINCT employees.employee_id_number) 
FROM employees;	


-- 6.4 Display any duplicate employee IDs.
SELECT
    employees.employee_id_number, 
	COUNT (employees.employee_id_number)
		AS employee_id_frequency_count
FROM employees
	GROUP BY employees.employee_id_number
		HAVING COUNT (employees.employee_id_number) > 1


-- 6.5 Display number of employees for each job title.
SELECT 
	employees.employee_title_id,
	employee_job_titles.job_title,
	COUNT(employees.employee_title_id)
		AS job_title_frequency_count
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	GROUP BY employees.employee_title_id, 
			 employee_job_titles.job_title
	ORDER BY job_title_frequency_count DESC;


-- 6.6 In descending order, display each birth date's frequency count.
SELECT 
	employees.birth_date,
	COUNT (employees.birth_date)
		AS birth_date_frequency_count
FROM employees
	GROUP BY employees.birth_date
	ORDER BY birth_date_frequency_count DESC;


-- 6.7 In ascending order, display each birth date's frequency count.
SELECT 
	employees.birth_date,
	COUNT (employees.birth_date)
		AS birth_date_frequency_count
FROM employees
	GROUP BY employees.birth_date
	ORDER BY birth_date_frequency_count ASC;


-- 6.8 In descending order, display the number of employees for each gender.
SELECT
	employees.sex,
	COUNT(employees.sex)
		AS gender_frequency_count
FROM employees
	GROUP BY employees.sex
	ORDER BY employees.sex DESC;


-- 6.9 In descending order, display the number of employees hired per hire date.
SELECT 
	employees.hire_date,
	COUNT(employees.hire_date)
		AS hire_date_frequency_count
FROM employees
	GROUP BY employees.hire_date
	ORDER BY hire_date_frequency_count DESC;
	
-- 6.10 In ascending order, display the number of employees hired per hire date.
SELECT 
	employees.hire_date,
	COUNT(employees.hire_date)
		AS hire_date_frequency_count
FROM employees
	GROUP BY employees.hire_date
	ORDER BY hire_date_frequency_count ASC;


-- 6.11 Count the number of distinct last names.
SELECT 
	COUNT (DISTINCT employees.last_name) 
FROM employees;

-- 6.12 In descending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	employees.last_name, 
	COUNT (employees.last_name) 
		AS last_name_frequency_count
FROM employees
	GROUP BY employees.last_name
		HAVING COUNT (employees.last_name) > 1
	ORDER BY last_name_frequency_count DESC;

-- 6.13 In ascending order, list the frequency count of employee last names 
-- (id est, how many employees share each last name).
SELECT 
	employees.last_name, 
	COUNT (employees.last_name) 
		AS last_name_frequency_count
FROM employees
	GROUP BY employees.last_name
		HAVING COUNT (employees.last_name) > 1
	ORDER BY last_name_frequency_count ASC;


-- 6.14 Count the number of distinct first names.
SELECT 
	COUNT (DISTINCT employees.first_name) 
FROM employees;
 
-- 6.15 In descending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	employees.first_name, 
	COUNT (employees.first_name) 
		AS first_name_frequency_count
FROM employees
	GROUP BY employees.first_name
		HAVING COUNT (employees.first_name) > 1
	ORDER BY first_name_frequency_count DESC;

-- 6.16 In ascending order, list the frequency count of employee first names
-- (id est, how many employees share each first name).
SELECT 
	employees.first_name, 
	COUNT (employees.first_name) 
		AS first_name_frequency_count
FROM employees
	GROUP BY employees.first_name
		HAVING COUNT (employees.first_name) > 1
	ORDER BY first_name_frequency_count ASC;


-- 6.17 Count the number of distinct first and last names.
SELECT 
	COUNT (DISTINCT (employees.last_name, employees.first_name))
FROM employees;

-- 6.18 In descending order, list the frequency count of employee first
-- and last names (id est, how many employees share each last name).
SELECT 
	employees.last_name, 
	employees.first_name, 
	COUNT ((employees.last_name, employees.first_name))
		AS name_frequency_count
FROM employees
	GROUP BY employees.last_name, 
			 employees.first_name
		HAVING COUNT ((employees.last_name, employees.first_name)) > 1
	ORDER BY name_frequency_count DESC;

-- 6.19 In ascending order, list the frequency count of employee first
-- and last names (id est, how many employees share each last name).
SELECT 
	employees.last_name, 
	employees.first_name, 
	COUNT ((employees.last_name, employees.first_name))
		AS name_frequency_count
FROM employees
	GROUP BY employees.last_name, 
			 employees.first_name
		HAVING COUNT ((employees.last_name, employees.first_name)) > 1
	ORDER BY name_frequency_count ASC;


-- 6.20 List employee records for the most common first and last name,
-- Rosalyn Baalen.
SELECT
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employee_job_titles.job_title,
	employee_salaries.employee_salary
FROM employees
	JOIN employee_salaries
		ON employees.employee_id_number = employee_salaries.employee_id_number
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	WHERE employees.last_name = 'Baalen' 
		AND employees.first_name = 'Rosalyn';


-- 6.21 This statement retrieves all employee records.
SELECT
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title,
	employee_salaries.employee_salary
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	JOIN employee_salaries
		ON employees.employee_id_number = employee_salaries.employee_id_number
	ORDER BY employees.last_name, 
			 employees.first_name;


-- 6.22 This statement lists all employee records with department information.
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
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	ORDER BY employees.last_name, 
			 employees.first_name ASC;


-- 6.23 This statement lists employees with a count of their departments in descending order.
SELECT 
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	employee_job_titles.job_title,
	COUNT (departments.department_id)
		AS department_frequency_count
FROM employees
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	GROUP BY employees.employee_id_number, employee_job_titles.job_title
		HAVING COUNT (departments.department_id) > 1
	ORDER BY department_frequency_count DESC;


-- 6.24 This statement lists employees with a count of their departments and a count 
-- of unique job titles in descending order.
SELECT 
	employees.employee_id_number,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	COUNT (DISTINCT employee_job_titles.job_title)
		AS distinct_job_title_frequency_count,
	COUNT (departments.department_id)
		AS department_frequency_count
FROM employees
	JOIN department_id_per_employee
		ON employees.employee_id_number = department_id_per_employee.employee_id_number
	JOIN departments
		ON department_id_per_employee.department_id = departments.department_id
	JOIN employee_job_titles
		ON employees.employee_title_id = employee_job_titles.employee_title_id
	GROUP BY employees.employee_id_number
		HAVING COUNT(departments.department_id) > 1
	ORDER BY distinct_job_title_frequency_count DESC;


-- 6.25 This statement lists all the department managers 
-- with their number of departments.
SELECT 
	employees.employee_id_number,
	employees.last_name,
	employees.first_name,
	departments.department_name, 
	employees.sex,
	employees.birth_date,
	employees.hire_date,
	COUNT (departments.department_id)
		AS department_id_frequency_count
FROM employees
	JOIN department_managers
		ON employees.employee_id_number = department_managers.employee_id_number
	JOIN departments
		ON department_managers.department_id = departments.department_id
	GROUP BY employees.employee_id_number, 
			 departments.department_name
	ORDER BY department_id_frequency_count DESC;


-- 6.26 This statement lists each year and the number of hires.
SELECT 
	EXTRACT (YEAR FROM employees.hire_date), 
	COUNT (EXTRACT(YEAR FROM employees.hire_date)) 
		AS hire_year_frequency_count
FROM employees
	GROUP BY EXTRACT (YEAR FROM employees.hire_date) 
	ORDER BY EXTRACT (YEAR FROM employees.hire_date) ASC;