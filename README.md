![homicide](https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-PostgresSQL-Queries/assets/137228821/64a64c35-126f-4886-a0f3-ecb80294004b)

# Pewlett Hackard Homicide Investigation
----
On December 28, 2023, at 10:35 PM, a janitor, Mr. Ulf Flexer, while looking for extra cleaning supplies, came across an overlooked utility closet in the basement of an office building at 457 E. Gladwell Ave belonging to his employer, Pewlett Hackard. Because the utility closet was locked, Mr. Flexer called his supervisor, Mr. Herb Swiler, to report the situation. During the phone call, Mr. Swiler told Mr. Flexer that he was unaware of the existence of this closet, an unusual occurrence, and gave Mr. Flexer permission to break the lock and gain access to the room. After doing so, Mr. Flexer discovered a completely decomposed corpse and immediately contacted police. Within the next few hours, police investigators cordoned off the scene, carefully photographed, collected, and catalogued the evidence, and sent the body to the Office of the Medical Examiner.

From the findings and the initial Missing and Unidentified Persons Report, these investigators established the narrative surrounding the homicide. The body belonged to a woman, Ms. Magdalena Krider, last seen with an unidentified man at about 10:00 PM on December 18, 1996, leaving an awards dinner four blocks from the scene of the crime at Pewlett Hackard’s headquarters. Ms. Krider was 32 years old and had worked at Pewlett Hackard for 10 years; at the time, she recently had been promoted to Technique Leader in the Development Department. This event was the company’s way of thanking those 10-year employees who had distinguished themselves in some way. As such, Ms. Krider was one of thousands of employees to receive an engraved gold and crystal obelisk award. Ironically, Ms. Krider was bludgeoned to death with just such an object although her award, found among her possessions, was not the murder weapon. What’s more, investigators discovered a letter in her purse from another award recipient that night, Hercules B., expressing amorous feelings for Ms. Krider. Investigators believed that she was murdered somewhere nearby and then moved to the utility closet but were not sure how she gained access to the building: the company’s department managers had after-hours access and alarm system codes but only to buildings housing their departments; on the night of the murder, the building, home to the Sales and Development Departments, had no signs of break-in and no alarm events.

To produce some leads for the case, my client asked me to create a suspect list from the only company information available from that period: a legacy employee database in the form of six CSV files. Upon receiving the files, I studied their structure and designed a series of database tables. To implement my design in a Postgres Database, I executed my SQL script, create_table_schemata.sql, with the Postgres Administrative Tool, pgAdmin4.  To upload the CSV files into the database, I again used pgAdmin4.

![pewlett_hackard_entity_relationship_diagram](https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/42bf8727-9139-4d90-b15a-a9766e2abea5)

To ensure data integrity and conceptualize the data set, I ran the queries in my SQL script, data_integrity_queries.sql.  From the results, I concluded that the data in the various tables are consistent with each other and revealed the following facts about Pewlett Hackard from 1985 to 2000:

•	The company has 300,024 employees.

•	The company’s gender distribution is 60% men and 40% women.

•	The company has nine departments run by 24 managers: Marketing, Finance, Human Resources, Production, Development, Quality Management, Sales, Research, and Customer Service.

•	Although the company maintains nine separate departments, 10.5% of the employees belong to two departments and 89.5% belong to one department; managers only belong to and manage one department.

•	Each employee has only one of seven possible job titles: Staff, Senior Staff, Assistant Engineer, Engineer, Senior Engineer, Technique Leader, and Manager.

•	The most common job title is Staff and the least common is Manager.

•	While many employees share common first or last names, the percent of employees with a distinct first and last name is 93.1%.

To derive a short list of suspects, I started with broad queries and worked my way down to narrow ones.  This is the list of my initial five questions to the Postgres Database and the results.

1.1	Who are the Department Managers who have access to buildings after hours as well as alarm codes?
<img width="1155" alt="homicide_investigation_employees_query1" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/53ae4115-99d8-42be-b5c0-030fffab4b76">

1.2 Who are the employees hired in 1986?
<img width="1207" alt="homicide_investigation_employees_query2" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/f041724d-b464-42c4-b1b2-73af2381ee94">

1.3 Who are the employees with the first name, Hercules, and a last name starting with the letter, B?
<img width="1040" alt="homicide_investigation_employees_query3" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/dff1593f-5a7e-4db1-b527-9fe1acf63f43">

1.4 Who are the employees in the Sales Department?
<img width="1139" alt="homicide_investigation_employees_query4" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/5ed7e267-8498-4c34-a618-6fb2f610f3ae">

1.5 Who are the employees in the Sales and Development Departments?
<img width="1086" alt="homicide_investigation_employees_query5" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/ffe2cfd5-df73-4b34-bd12-ff2a2f28d427">

Although accurately incorporating case details, the initial queries produced too many hits, so I combined criteria to reduce the number of possible suspects.

2.1 Who are the employees with a first name, Hercules, and a last name starting with the letter, B, whom the company hired in 1986?
<img width="1126" alt="homicide_investigation_suspects_query1" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/b8eb9d65-7c09-4e75-813d-78095d353131">

2.2 Which employees were Department Managers in Sales or Development?
<img width="975" alt="homicide_investigation_suspects_query2" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/7e69f6bb-4317-4129-97a5-5de85d0317be">

2.3 Which employees were men, hired in 1986, and were Department Managers in Sales or Development?
<img width="974" alt="homicide_investigation_suspects_query3" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/ecb3f736-628a-4f8e-b083-155dd52fb101">

From this analysis, I had two suspects for my client: Hercules Benzmuller, an engineer in the Production Department; and Hauke Zhang, a manager in the Sales Department.

In conclusion, investigators found and arrested the perpetrator of Magdalena Krider’s murder. One week after my analysis, several police detectives walked into Mr. Zhang's office to ask a series of routine questions about the murder when one investigator noticed a damaged gold and crystal obelisk award in a bookcase (next to a picture of Mr. Zhang’s wife).  Upon confrontation with the evidence, Mr. Zhang confessed to the crime, its details, and keeping the murder weapon in his office in plain view for the last twenty-seven years.  

The married Mr. Zhang had a quid pro quo relationship with the victim that led to her promotion and subsequent death.  On the night of the awards event, the pair walked back to the building where Mr. Zhang opened the doors, deactivated the alarm system, and entered the empty building with Ms. Krider with the expectation of a romantic liaison.  When she resisted his overtures and announced that the more intimate aspects of their arrangement were over, Mr. Zhang killed Ms. Krider in a fit of rage.  Mr. Zhang then hid the body in the basement utility closet before cleaning up, turning on the alarm system, locking the doors, and going home to his family.  By virtue of his socioeconomic status, his and the victim's discretion concerning their relationship, and the apparent lack of any evidence connecting the pair beyond working in the same building for a mutual employer, he was not a suspect when she went missing or was found dead.

Although speculation, I believe Mr. Zhang kept the evidence in plain sight to remind him of the inevitable: an hourglass with sand endlessly running from the top to the bottom bulb until those detectives walked through his office door.  Ultimately, if this situation teaches us anything, it's that love can be a funny thing and make us act out of character, but obsession is not love.  Obsessions brings out the worst in us, and, if left unchecked, will lead eventually to our ruin.  Mr. Zhang was living on borrowed time, a little over twenty-seven years to be exact, but it was twenty-seven years more than Ms. Krider had.

----

## Copyright

Nicholas J. George © 2024. All Rights Reserved.
