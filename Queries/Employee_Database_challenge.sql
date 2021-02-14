SELECT e.emp_no,
    e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	rt.emp_no, 
	rt.first_name, 
	rt.last_name, 
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

-- Retiring Titles table
SELECT COUNT (ut.emp_no) as count, ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Create Mentorship Eligibility table
SELECT DISTINCT ON (emp_no) 
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date, 
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
	ON (de.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY emp_no;




---------------------------------------

-- Create Mentorship Count table
SELECT COUNT (me.emp_no) as count, me.title
INTO mentorship_count
FROM mentorship_eligibilty as me
GROUP BY me.title
ORDER BY count DESC;

--------------------------------

-- Add Salary info to retirement titles 
SELECT 
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	e.hire_date,
	t.from_date,
	t.to_date,
	s.salary
INTO retirement_salary
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
LEFT JOIN salaries as s
ON (t.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	rs.emp_no, 
	rs.first_name, 
	rs.last_name, 
	rs.title,
	rs.to_date,
	rs.salary
INTO unique_salary
FROM retirement_salary as rs
ORDER BY emp_no, to_date DESC;

-- Average salary by title (retirement)
SELECT ROUND(AVG(salary),0) as Average_Salary, title
FROM unique_salary
WHERE (to_date = '9999-01-01')
GROUP BY title
ORDER BY Average_Salary;

----------------------------------------------

--Create New Hire Salary table
SELECT 
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	e.hire_date,
	t.from_date,
	t.to_date,
	s.salary
INTO new_hire_salary
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
LEFT JOIN salaries as s
ON (t.emp_no = s.emp_no)
WHERE (e.hire_date BETWEEN '1999-01-01' AND '1999-12-31')
ORDER BY emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	rs.emp_no, 
	rs.first_name, 
	rs.last_name, 
	rs.title,
	rs.to_date,
	rs.salary
INTO unique_nh_salary
FROM new_hire_salary as rs
ORDER BY emp_no, to_date DESC;

-- Average salary by title (new hires)
SELECT ROUND(AVG(salary),0) as Average_Salary, title
FROM unique_nh_salary
WHERE (to_date = '9999-01-01')
GROUP BY title
ORDER BY Average_Salary;
