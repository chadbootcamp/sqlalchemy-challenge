--Employee number,last name, first name, sex, and salary 
SELECT emp.emp_no as employeenumber,last_name,first_name,sex, salary 
FROM public."Employees" emp, public."Salary" salary
WHERE emp.emp_no = salary.emp_no 
ORDER BY emp.emp_no ASC;

--first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name,last_name,hire_date 
FROM "Employees" 
WHERE hire_date between '1986-01-01'and'1986-12-31';

-- manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
FROM "Department_Manager"as dm
INNER JOIN "Department" as d 
on (dm.dept_no = d.dept_no)
INNER JOIN "Employees" as e
on (dm.emp_no = e.emp_no)

--the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name from 
public."Employees" e 
JOIN public."Department_Employee" ed ON e.emp_no = ed.emp_no
JOIN public."Department" d ON d.dept_no = ed.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM public."Employees" 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
Select e.emp_no, e.last_name, e.first_name from 
public."Employees" e 
JOIN public."Department_Employee" ed ON e.emp_no = ed.emp_no
JOIN public."Department" d ON d.dept_no = ed.dept_no
WHERE d.dept_no = 'd007'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name from 
public."Employees" e 
JOIN public."Department_Employee" ed ON e.emp_no = ed.emp_no
JOIN public."Department" d ON d.dept_no = ed.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, COUNT (last_name) AS frequency
from public."Employees"  
GROUP BY last_name 
ORDER BY COUNT (last_name) DESC



