
# Pewlett_Hackard_Analysis
by Bob Ciminera




### Overview

Pewlett Hackard (PH) is a large company that is planning for the future staffing of the firm by offering early retirement to eligible employees with the objective of replacing them with the next generation of upcoming talent.  

Employees with birth dates between 1952 and 1955 are eligible for the retirement program.  

In order to transition the experience of the retirees to the individuals that will be filling the roles that the retirees vacate, PH will offer a mentoring program.  This program will be a part time engagement where retirees are assigned individuals to mentor for a period of time.

To perform the analysis a database schema and SQL queries were created based on data provided by the company.

Schema:

![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/EmployeeDB.png)

SQL Queries:

[sql queries](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/Queries/queries.sql)




### Results: 

Results of the analysis are as follows:


1. Duplicate employee entries were observed when selecting titles from the employee file for birthdates between 1952 and 1955, inclusive.

  ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/retirement_titles.png)
  
2. The duplicate employee and title entries from 1. above were eliminated by using the Distinct sql function to select the latest title per employee.

  ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/unique_titles.png)

3. The unique employee title list was grouped and counted by title with the following results:

  ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/retiring_titles.png)

4. A list of employees eligible for mentorship was created based on a birth year of 1965:

  ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/mentorship_eligibility.png)


### Summary: 

As a result of the imopending retirement, and, assuming that these roles need to be back filled, there will be 36,619 roles that will need to be replaced across 9 departments as follows:

 ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/retirees_by_dept.png)


There are 1,549 candidates to be mentored across the 9 departments.  Based on the analysis there are more than enough retirees in each department to serve as mentors.

 ![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/mentees_by_dept.png)

