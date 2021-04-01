-- Start QUERIES file name: queries.sql

	SELECT * FROM retirement_info;
	
-- 	Retirement eligibility count
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
-- Create retirement_info table for all employees who are retirement eligible
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;	
SELECT COUNT (emp_no)
FROM retirement_info;

-- Joins Section:
-- Create current_emp table of all retirement eligible employees currently employed 
-- take retirement info ('52-'55 bdates) and join with dept emp by using to date on dept emp
-- 33,118 employees born between '52 and '55 and hired between '85 and '87
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT COUNT(first_name)
FROM current_emp;

SELECT * FROM current_emp;


-- Create current_emp_bydept table to count retirement eligible employees by department number 
-- ret_emp_dept_count table and csv
SELECT COUNT(ce.emp_no), de.dept_no
INTO current_emp_bydept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- DROP TABLE ret_emp_dept_count
SELECT * FROM current_emp_bydept


-- Create emp_info table: a list of employees who were born from '52-'55, and hired from '85-'88'
-- Unique emp_no, last_name, first_name, salary, gender, current employee
SELECT 	e.emp_no, e.first_name, e.last_name, e.gender,
		s.salary,
    	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)	
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
   AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info

-- Create manager_info table: a List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT * FROM manager_info


-- Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info;

SELECT COUNT(emp_no)
FROM dept_info;

-- Create a list of retirees from Sales and Development departments using IN function
SELECT di.emp_no, di.first_name, di.last_name, di.dept_name 
INTO salesdev_dept_info
FROM dept_info as di
WHERE di.dept_name IN ('Development', 'Sales')
ORDER BY di.dept_name DESC;

SELECT COUNT(sd.dept_name), sd.dept_name
FROM salesdev_dept_info as sd
GROUP BY sd.dept_name
ORDER BY sd.dept_name DESC;

SELECT * FROM salesdev_dept_info