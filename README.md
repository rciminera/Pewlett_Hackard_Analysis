
# Pewlett_Hackard_Analysis
by Bob Ciminera




### Overview

Pewlett Hackard (PH) is a large company that is planning for the future staffing of the firm by offering early retirement to eligible employees with the objective of replacing them with the next generation of upcoming talent.  

Employees with birth dates between 1952 and 1955 are eligible for the retirement program.  

In order to transition the experience of the retirees to the individuals that will be filling the roles that the retirees vacate, PH will offer a mentoring program.  This program will be a part time engagement where retirees are assigned individuals to mentor for a period of time.

To perform the analysis a database schema and SQL queries were created based on data provided by the company.


![GitHubLogo](https://github.com/rciminera/World_Weather_Analysis/blob/main/Module/weather_data/Fig6.png)


![GitHubLogo](https://github.com/rciminera/Pewlett_Hackard_Analysis/blob/main/EmployeeDB.png)


[sql queries] (queries.sql)

### Results: 
1. Duplicate employee entries were observed when selecting titles from the employee file for birthdates between 1952 and 1955, inclusive.

    [github] (retirement_titles.png)
2. The duplicate employee and title entries from 1. above were eliminated by using the Distinct sql function to select the last title per employee.

    [github] (unique_titles.png)

3. The unique employee title list was grouped and counted by title with the followiong results:

    [github] (retiring_titles.png)

4. A list of employees eligible for mentorship was created based on a birth year of 1965:

    [github] (Pewlett_Hackard_Analysis/mentorship_eligibility.png)


### Summary: 

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
