![homicide](https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-PostgresSQL-Queries/assets/137228821/64a64c35-126f-4886-a0f3-ecb80294004b)

# **Cold Case: The Murder of Magdalena Krider**
## *A PostgreSQL Database Investigation into a 27-Year-Old Homicide*

---

## **Discovery**

On the night of December 28, 2023, at 10:35 PM, a janitor named Ulf Flexer was searching the basement of 457 E. Gladwell Ave — an office building owned by his employer, Pewlett Hackard — when he stumbled upon something unexpected: a utility closet that, to all appearances, no one knew existed. The closet was locked. Mr. Flexer called his supervisor, Herb Swiler, to report the anomaly. Mr. Swiler, himself unaware of the closet's existence, authorized Mr. Flexer to break the lock and enter.

Inside, Mr. Flexer found a completely decomposed human corpse. He contacted police immediately.

Within hours, investigators cordoned off the scene, methodically photographed, collected, and catalogued the evidence, and transported the remains to the Office of the Medical Examiner. What had begun as a routine search for cleaning supplies had just reopened a 27-year-old homicide.

---

## **The Victim and the Night She Disappeared**

The body was identified as Ms. Magdalena Krider, 32 years old, a Pewlett Hackard employee of ten years who had recently been promoted to Technique Leader in the Development Department. She was last seen on the evening of December 18, 1996 — leaving an awards dinner held at Pewlett Hackard's headquarters, four blocks from where her remains were found — in the company of an unidentified man at approximately 10:00 PM.

The dinner was the company's tribute to its distinguished ten-year employees, each of whom received an engraved gold and crystal obelisk as recognition of their service and achievement. Ms. Krider was among thousands honored that night. The cause of death: blunt force trauma. The murder weapon: one of those very obelisks — though not Ms. Krider's own, which was recovered intact among her possessions.

Among her belongings, investigators also found a letter from another award recipient that evening, signed only as *Hercules B.*, expressing romantic feelings for Ms. Krider. The letter would prove significant.

Investigators theorized that Ms. Krider had been murdered nearby and her body subsequently moved to the utility closet. How the perpetrator gained access to the building remained unclear. Pewlett Hackard's department managers held after-hours access and alarm codes, but only for buildings housing their own departments. The building at 457 E. Gladwell Ave — home to the Sales and Development Departments — showed no signs of forced entry and recorded no alarm events on the night of the murder.

---

## **The Investigation: Building the Database**

With the physical evidence exhausted and the case long cold, my client engaged me to generate a fresh suspect list using the only company records available from the period: a legacy employee database preserved across six CSV files.

I began by studying the structure and relationships within the files, then designed a normalized schema of database tables to house the data. Using pgAdmin4, I executed my SQL script — `create_table_schemata.sql` — to implement the schema in a PostgreSQL database, then used pgAdmin4 again to upload the CSV files into their respective tables.

![pewlett_hackard_entity_relationship_diagram](https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/42bf8727-9139-4d90-b15a-a9766e2abea5)

Before querying for suspects, I ran a suite of data integrity checks using `data_integrity_queries.sql` to verify internal consistency and establish a clear picture of Pewlett Hackard as an organization between 1985 and 2000. The data proved consistent across all tables and revealed the following:

- **Total employees:** 300,024
- **Gender distribution:** 60% male, 40% female
- **Departments:** Nine, each managed by one or more of 24 total managers — Marketing, Finance, Human Resources, Production, Development, Quality Management, Sales, Research, and Customer Service
- **Departmental assignments:** 89.5% of employees belong to a single department; 10.5% belong to two; managers exclusively belong to and oversee one department
- **Job titles:** Seven distinct titles — Staff, Senior Staff, Assistant Engineer, Engineer, Senior Engineer, Technique Leader, and Manager — with Staff being the most common and Manager the least
- **Name uniqueness:** 93.1% of employees have a distinct combination of first and last name

---

## **Narrowing the Suspect List**

With data integrity confirmed, I began querying the database — starting broad and progressively narrowing based on the case's known constraints.

**Initial queries** explored the full scope of relevant employee groups:

1.1	Which department managers held after-hours building access and alarm codes?
<img width="1155" alt="homicide_investigation_employees_query1" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/53ae4115-99d8-42be-b5c0-030fffab4b76">

1.2 Which employees were hired in 1986?
<img width="1207" alt="homicide_investigation_employees_query2" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/f041724d-b464-42c4-b1b2-73af2381ee94">

1.3 Which employees had the first name Hercules and a last name beginning with the letter B?
<img width="1040" alt="homicide_investigation_employees_query3" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/dff1593f-5a7e-4db1-b527-9fe1acf63f43">

1.4 Which employees worked in the Sales Department?
<img width="1139" alt="homicide_investigation_employees_query4" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/5ed7e267-8498-4c34-a618-6fb2f610f3ae">

1.5 Which employees worked in either the Sales or Development Departments?
<img width="1086" alt="homicide_investigation_employees_query5" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/ffe2cfd5-df73-4b34-bd12-ff2a2f28d427">

Each query was accurate but returned too many results to be actionable. I then combined criteria to tighten the field.

**Refined queries** cross-referenced multiple conditions simultaneously:

2.1 Which employees named Hercules, with a last name beginning with B, were hired in 1986?
<img width="1126" alt="homicide_investigation_suspects_query1" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/b8eb9d65-7c09-4e75-813d-78095d353131">

2.2 Which employees served as department managers in Sales or Development?
<img width="975" alt="homicide_investigation_suspects_query2" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/7e69f6bb-4317-4129-97a5-5de85d0317be">

2.3 Which male employees, hired in 1986, served as department managers in Sales or Development?
<img width="974" alt="homicide_investigation_suspects_query3" src="https://github.com/njgeorge000158/Pewlett-Hackard-Homicide-Investigation-with-SQL-Queries/assets/137228821/ecb3f736-628a-4f8e-b083-155dd52fb101">

The analysis produced two suspects:

- **Hercules Benzmuller** — an engineer in the Production Department; identified through the letter found in Ms. Krider's purse
- **Hauke Zhang** — a manager in the Sales Department; identified through his after-hours access and alarm codes for the building where Ms. Krider's body was found

---

## **Resolution**

One week after delivering my analysis, police detectives visited Mr. Zhang at his place of employment. The interview was intended as a preliminary round of questioning. It ended in a confession.

As detectives entered his office, one investigator noticed a damaged gold and crystal obelisk award displayed openly on a bookcase. Confronted with the object, Mr. Zhang confessed — to the crime, to its details, and to having kept the murder weapon in plain sight for twenty-seven years.

The full picture that emerged was one of coercion, betrayal, and rage. Mr. Zhang, married at the time, had maintained a quid pro quo relationship with Ms. Krider — one that had facilitated her recent promotion. On the night of the awards dinner, the two walked back together to the building at 457 E. Gladwell Ave, where Mr. Zhang used his managerial access to open the doors, deactivate the alarm, and enter the empty building expecting a continuation of their arrangement. When Ms. Krider refused his advances and told him that the intimate dimensions of their relationship were finished, Mr. Zhang killed her in a fit of rage.

He then moved her body to the basement utility closet, cleaned the scene, reset the alarm, locked the building, and went home to his family. His socioeconomic standing, the private nature of the relationship, and the absence of any apparent connection between the two beyond shared employment had kept him beyond suspicion — both when Ms. Krider went missing and when she was initially reported as an unresolved case.

He remained free for twenty-seven years, two months, and ten days.

---

## **Closing Reflection**

Why did Mr. Zhang keep the murder weapon? Logic offers no satisfying answer — only psychology does. Perhaps the obelisk served as a private monument to his crime, or perhaps it was something darker: a reminder of the reckoning he must have known, on some level, was coming. An hourglass, its sand running quietly for nearly three decades, until the day those detectives walked through his door.

This case offers a sobering lesson. Love, even in its most complicated and imperfect forms, remains recognizably human. Obsession is something else entirely. It distorts, it consumes, and — if left unchecked — it destroys, first its object, and ultimately itself. Mr. Zhang had borrowed more than twenty-seven years of time. But it was never really his to borrow. It belonged to Magdalena Krider, whose story was cut short at 32 in a basement utility closet that the world forgot existed.

The data remembered.

----

## Copyright

Nicholas J. George © 2024. All Rights Reserved.
