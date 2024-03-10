# **Pewlett Hackard Homicide Investigation with SQL Queries**

----

### **Installation:**

----

The SQL scripts require the installation of PostgreSQL and pdAdmin to run.

If you have not installed them, here are the instructions:

* In your browser, Mac users should go to [Mac Download PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads), and Windows users should go to [Windows Download PostgreSQL](https://www.pgadmin.org/download/pgadmin-4-macos/).

* Select the download option for your operating system and for the latest version 14.x of PostgreSQL.

* After downloading PostgreSQL 14.x, double click on the .dmg file.

* Go through the Setup Wizard and install PostgreSQL.  For MacOS users, keep the default location /Library/PostgreSQL/14; for MS Windows, keep the default location C:\Program Files\PostgreSQL\14.

* Select the components to be installed. Be sure to un-check Stack Builder.

* Add your data directory. For Mac users, keep the default location /Library/PostgreSQL/14/data; for MS Windows, keep the default location C:\Program Files\PostgreSQL\14\data.

* Enter postgres as the password. Be sure to record this password for future use.

* Keep the default port as 5432. In the Advanced Options, set the locale as [Default locale].

* The final screen will be the Pre Installation Summary.

* To confirm the installation, start pgAdmin (it will open in a new browser window). Connect to the default server by clicking on it and entering the password if prompted.

----

### **Usage:**

----

The administrative and development tool, pgAdmin4, uses the CSV files in the folder, resources, for populating the database tables.  Also, with pgAdmin4, the three SQL scripts create the database tables and run the queries.

department_id_per_employee.csv

department_managers.csv

departments.csv

employee_job_titles.csv

employees.csv

employee_salaries.csv

create_table_schemata.sql

data_integrity_queries.sql

investigative_queries.sql

----

### **Resource Summary:**

----

#### Source code

n/a

#### Input files

department_id_per_employee.csv, department_managers.csv, departments.csv, employee_job_titles.csv, employees.csv, employee_salaries.csv

#### Output files

n/a

#### SQL script

create_table_schemata.sql, data_integrity_queries.sql, investigative_queries.sql

#### Software

pgAdmin4, Postgres

![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

----

### **GitHub Repository Branches:**

----

#### main branch 

|&rarr; [./create_table_schemata.sql](./create_table_schemata.sql)

|&rarr; [./data_integrity_queries.sql](./data_integrity_queries.sql)

|&rarr; [./investigative_queries.sql](./investigative_queries.sql)

|&rarr; [./pewlett_hackard_entity_relationship_diagram.png](./pewlett_hackard_entity_relationship_diagram.png)

|&rarr; [./README.md](./README.md)

|&rarr; [./README.TECHNICAL.md](./README.TECHNICAL.md)

|&rarr; [./images/](./images/)

  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query1.png](./images/db_integrity_department_id_per_employee_query1.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query2.png](./images/db_integrity_department_id_per_employee_query2.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query3.png](./images/db_integrity_department_id_per_employee_query3.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query4.png](./images/db_integrity_department_id_per_employee_query4.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query5.png](./images/db_integrity_department_id_per_employee_query5.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_id_per_employee_query6.png](./images/db_integrity_department_id_per_employee_query6.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_managers_query1.png](./images/db_integrity_department_managers_query1.png)
  
  &emsp; |&rarr; [./images/db_integrity_department_managers_query2.png](./images/db_integrity_department_managers_query2.png)

  &emsp; |&rarr; [./images/db_integrity_department_managers_query3.png](./images/db_integrity_department_managers_query3.png)

  &emsp; |&rarr; [./images/db_integrity_department_managers_query4.png](./images/db_integrity_department_managers_query4.png)

  &emsp; |&rarr; [./images/db_integrity_department_managers_query5.png](./images/db_integrity_department_managers_query5.png)

  &emsp; |&rarr; [./images/db_integrity_departments_query1.png](./images/db_integrity_departments_query1.png)

  &emsp; |&rarr; [./images/db_integrity_departments_query2.png](./images/db_integrity_departments_query2.png)

  &emsp; |&rarr; [./images/db_integrity_employee_job_titles_query1.png](./images/db_integrity_employee_job_titles_query1.png)

  &emsp; |&rarr; [./images/db_integrity_employee_job_titles_query2.png](./images/db_integrity_employee_job_titles_query2.png)

  &emsp; |&rarr; [./images/db_integrity_employee_salaries_query1.png](./images/db_integrity_employee_salaries_query1.png)

  &emsp; |&rarr; [./images/db_integrity_employee_salaries_query2.png](./images/db_integrity_employee_salaries_query2.png)

  &emsp; |&rarr; [./images/db_integrity_employee_salaries_query3.png](./images/db_integrity_employee_salaries_query3.png)

  &emsp; |&rarr; [./images/db_integrity_employee_salaries_query4.png](./images/db_integrity_employee_salaries_query4.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query1.png](./images/db_integrity_employees_query1.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query2.png](./images/db_integrity_employees_query2.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query3.png](./images/db_integrity_employees_query3.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query4.png](./images/db_integrity_employees_query4.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query5.png](./images/db_integrity_employees_query5.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query6.png](./images/db_integrity_employees_query6.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query7.png](./images/db_integrity_employees_query7.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query8.png](./images/db_integrity_employees_query8.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query9.png](./images/db_integrity_employees_query9.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query10.png](./images/db_integrity_employees_query10.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query11.png](./images/db_integrity_employees_query11.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query12.png](./images/db_integrity_employees_query12.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query13.png](./images/db_integrity_employees_query13.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query14.png](./images/db_integrity_employees_query14.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query15.png](./images/db_integrity_employees_query15.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query16.png](./images/db_integrity_employees_query16.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query17.png](./images/db_integrity_employees_query17.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query18.png](./images/db_integrity_employees_query18.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query19.png](./images/db_integrity_employees_query19.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query20.png](./images/db_integrity_employees_query20.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query21.png](./images/db_integrity_employees_query21.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query22.png](./images/db_integrity_employees_query22.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query23.png](./images/db_integrity_employees_query23.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query24.png](./images/db_integrity_employees_query24.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query25.png](./images/db_integrity_employees_query25.png)

  &emsp; |&rarr; [./images/db_integrity_employees_query26.png](./images/db_integrity_employees_query26.png)

  &emsp; |&rarr; [./images/homicide_investigation_employees_query1.png](./images/homicide_investigation_employees_query1.png)

  &emsp; |&rarr; [./images/homicide_investigation_employees_query2.png](./images/homicide_investigation_employees_query2.png)

  &emsp; |&rarr; [./images/homicide_investigation_employees_query3.png](./images/homicide_investigation_employees_query3.png)

  &emsp; |&rarr; [./images/homicide_investigation_employees_query4.png](./images/homicide_investigation_employees_query4.png)

  &emsp; |&rarr; [./images/homicide_investigation_employees_query5.png](./images/homicide_investigation_employees_query5.png)

  &emsp; |&rarr; [./images/homicide_investigation_suspects_query1.png](./images/homicide_investigation_suspects_query1.png)

  &emsp; |&rarr; [./images/homicide_investigation_suspects_query2.png](./images/homicide_investigation_suspects_query2.png)

  &emsp; |&rarr; [./images/homicide_investigation_suspects_query3.png](./images/homicide_investigation_suspects_query3.png)
  
  &emsp; |&rarr; [./images/README.md](./images/README.md)

|&rarr; [./resources/](./resources/)

  &emsp; |&rarr; [./resources/department_id_per_employee.csv](./resources/department_id_per_employee.csv)

  &emsp; |&rarr; [./resources/department_managers.csv](./resources/department_managers.csv)

  &emsp; |&rarr; [./resources/departments.csv](./resources/departments.csv)

  &emsp; |&rarr; [./resources/employee_job_titles.csv](./resources/employee_job_titles.csv)

  &emsp; |&rarr; [./resources/employees.csv](./resources/employees.csv)

  &emsp; |&rarr; [./resources/employee_salaries.csv](./resources/employee_salaries.csv)

  &emsp; |&rarr; [./resources/README.md](./resources/README.md)

----

### **References:**

----

[PgAdmin Documentation](https://www.postgresql.org/docs/)

[Postgres Documentation](https://www.pgadmin.org/docs/)

[PostgresSQL Documentation](https://www.postgresql.org/docs/)

----

### **Authors and Acknowledgment:**

----

### Copyright

Nicholas J. George © 2023. All Rights Reserved.
