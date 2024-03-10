--******************************************************************************************
--
--  File Name:  original_create_table_schemata.sql
--
--  File Description:
--      This file contains the SQL script to create and populate database tables 
--      for the Pewlett Hackard legacy employee database.
--
--
--  Date               Description                              Programmer
--  ---------------    ------------------------------------     ------------------
--  09/05/2023         Initial Development                      Nicholas J. George
--
--******************************************************************************************/

-- These statements drop any existing tables in the database.
DROP TABLE IF EXISTS department_id_per_employee;

DROP TABLE IF EXISTS department_managers;

DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS employee_salaries;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS employee_job_titles;


-- These statements create the database table for employees.
CREATE TABLE 
	employee_job_titles
	    (employee_title_id VARCHAR(10),
	     job_title VARCHAR(40) NOT NULL,
            PRIMARY KEY (employee_title_id));

CREATE TABLE 
    employees 
        (employee_id_number INT,
	     employee_title_id VARCHAR(10) NOT NULL,
	     birth_date DATE NOT NULL,
         first_name VARCHAR(40) NOT NULL,
	     last_name VARCHAR(40) NOT NULL,
	     sex VARCHAR(1) NOT NULL,
	     hire_date DATE NOT NULL,
            PRIMARY KEY (employee_id_number),
            FOREIGN KEY (employee_title_id) 
                REFERENCES employee_job_titles (employee_title_id));

CREATE TABLE 
    employee_salaries
        (employee_id_number INT,
	     employee_salary INT NOT NULL,
            PRIMARY KEY (employee_id_number),
	        FOREIGN KEY (employee_id_number)
                REFERENCES employees (employee_id_number));


-- These statements create the database tables for departments.
CREATE TABLE 
    departments 
        (department_id VARCHAR(10),
	     department_name VARCHAR(40) NOT NULL,
	        PRIMARY KEY (department_id));

CREATE TABLE 
    department_managers
	    (department_id VARCHAR(10),
	     employee_id_number INT,
	        PRIMARY KEY (department_id, employee_id_number),
            FOREIGN KEY (department_id) 
                REFERENCES departments (department_id),
	        FOREIGN KEY (employee_id_number) 
                REFERENCES employees (employee_id_number));

CREATE TABLE 
    department_id_per_employee 
        (employee_id_number INT,
	     department_id VARCHAR(10),
	        PRIMARY KEY (employee_id_number, department_id),
	        FOREIGN KEY (employee_id_number) 
                REFERENCES employees (employee_id_number),
	        FOREIGN KEY (department_id) 
                REFERENCES departments (department_id));