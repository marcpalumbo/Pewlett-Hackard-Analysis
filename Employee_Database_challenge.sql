
-- creating new retirement titles table and selecting all results
select e.emp_no,e.first_name,e.last_name,ti.title,ti.from_date,ti.to_date
INTO retirement_titles
from employees as e
INNER join titles as ti 
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- selecting all results from new table and ordering by employee number in ascending order

select *from retirement_titles
order by emp_no;


-- creating unique titles table to filter out duplicates from previous query
SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
 -- selecting all results of new table

select * from unique_titles;


-- creating retiring titles to find number of people with certain title that are retiring

select count(title),title
into retiring_titles
from unique_titles
group by title
order by count desc;

-- selecting all results

select * from retiring_titles;



-- Deliverable 2 query

--creating table of all mentorship eligible employees

select distinct on(e.emp_no) e.emp_no, e.first_name,e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibility
from employees as e
join dept_employees as de
	on e.emp_no = de.emp_no
join titles as ti
	on e.emp_no = ti.emp_no
where de.to_date = '9999-01-01' AND
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;




-- checking results of tables

select * from mentorship_eligibility;
