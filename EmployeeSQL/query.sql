-- Data Analysis
-- Q1 List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e 
join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no;

-- Q2 List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from to_date(hire_date, 'MM/DD/YYYY')) = 1986
order by first_name, last_name;

-- Q3 List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from department as d
join dept_manager as dm
on d.dept_no = dm.dept_no
join employees as e
on e.emp_no = dm.emp_no
order by dm.dept_no;

-- Q4 List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from department as d
join dept_emp as de
on d.dept_no = de.dept_no
join employees as e
on de.emp_no = e.emp_no
order by de.emp_no;

-- Q5 List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name;

-- Q6 List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on de.emp_no = e.emp_no
join department as d
on d.dept_no = de.dept_no
where de.dept_no in (
	select dept_no
	from department
	where dept_name = 'Sales'
)
order by emp_no;

-- Q7 List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on de.emp_no = e.emp_no
join department as d
on d.dept_no = de.dept_no
where de.dept_no in (
	select dept_no
	from department
	where dept_name = 'Sales'
	or dept_name = 'Development'
)
order by emp_no;

-- Q8 In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name) as "frequency count"
from employees
group by last_name
order by "frequency count" desc;

-- Epilogue
-- Search my ID number and my information as following:
select e.emp_no, e.first_name, e.last_name, d.dept_name, t.title, s.salary
from salaries as s
join employees as e
on s.emp_no = e.emp_no
join dept_emp as de
on e.emp_no = de.emp_no
join department as d 
on d.dept_no = de.dept_no
join titles as t
on t.title_id = e.emp_title_id
where e.emp_no = 499942;