-- Challenge Code Starts Here
-- Create a retirement_titles table with titles for employees born between 1952 and 1955
SELECT e.emp_no, e.first_name, e.last_name,
					t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Create unique_titles table using Distinct with Orderby to remove duplicate employee rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Create retiring_titles table
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Create mentorship_eligibility.csv table 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
					de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
 	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

- ADDITIONAL QUERIES START HERE

-- Count retirees by department and then count the total
-- By Department
SELECT COUNT(di.emp_no), di.dept_name
-- INTO retirees_by_dept
FROM dept_info as di
GROUP BY di.dept_name
ORDER BY di.dept_name DESC;
-- Total Retirees by Department
SELECT COUNT(di.emp_no)
FROM dept_info as di;

-- Count mentoring candidates by department

SELECT e.emp_no, e.first_name, e.last_name, e.birth_date,
					de.from_date, de.to_date, d.dept_name
INTO mentorees_by_dept
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
 	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;


SELECT COUNT(md.emp_no), md.dept_name
-- INTO mentoree_dept_count
FROM mentorees_by_dept as md
GROUP BY md.dept_name
ORDER BY md.dept_name DESC;

-- Total Mentor Candidates by Department
SELECT COUNT(md.emp_no)
FROM mentorees_by_dept as md;
