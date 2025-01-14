create database company;
use company;

select * from employee_title;
select * from employees;
select * from department;
select * from dept_emp;
select * from salaries;
select * from dept_manager;

select first_name,last_name from employees;    #first and last name of employees

select * from department;                      # department number and names

SELECT COUNT(*) AS total_employees             #total number of employees
FROM employees;

SELECT avg(salary) as Avg_salary From salaries;    #average salaries of all employees

SELECT birth_date, hire_date
FROM employees
WHERE emp_no = 10003;							#Retrieve the birth date and hire date of employee with emp_no 10003.


SELECT emp_no, title
FROM employee_title;							#finding title of all employees


select count(dep_name) from department;												#Get the total number of departments.

SELECT d.dep_no, d.dep_name
FROM department d
JOIN dept_manager et ON d.dep_no = et.dept_no									#Retrieve the department number and name where employee with emp_no 10004 works.
WHERE et.emp_no = 10004;


select gender from 	employees where emp_no=10007	;																		#Find the gender of employee with emp_no 10007.

SELECT MAX(salary) AS highest_salary
FROM salaries;

SELECT e.first_name, e.last_name, t.title
FROM employees e
JOIN employee_title t ON e.emp_no = t.emp_no;					#Retrieve the names of all managers along with their department names.


SELECT d.dep_no, d.dep_name, COUNT(de.emp_no) AS employee_count
FROM dept_manager de
JOIN department d ON de.dept_no = d.dep_no					 #Find the department with the highest number of employees.
GROUP BY d.dep_no, d.dep_name
ORDER BY employee_count DESC
LIMIT 1;


SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e													
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 60000;									#Retrieve the employee number, first name, last name, and salary of employees earning more than $60,000.


SELECT de.dep_name, AVG(s.salary) AS average_salary
FROM salaries s
JOIN dept_manager d ON s.emp_no = d.emp_no
JOIN department de ON de.dep_no = d.dept_no
GROUP BY de.dep_name;												#Get the average salary for each department.
					
                    
																	SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN employee_title t ON e.emp_no = t.emp_no;       # Retrieve the employee number, first name, last name, and title of all employees who are currently managers.
                                                                    
                         
SELECT d.dep_name, COUNT(de.emp_no) AS total_employees
FROM dept_manager de
JOIN department d ON de.dept_no = d.dep_no
GROUP BY d.dep_name;										# Find the total number of employees in each department.


SELECT d.dep_no, d.dep_name, AVG(s.salary) AS average_salary
FROM dept_manager de
JOIN department d ON de.dept_no = d.dep_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dep_no, d.dep_name
HAVING COUNT(de.emp_no) > 3;															# Get the department number, name, and average salary for departments with more than 3 employees.



SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employee_title t
JOIN employees e ON e.emp_no = t.emp_no
WHERE YEAR(STR_TO_DATE(e.hire_date, '%d-%m-%Y')) = 2005;				#Retrieve the employee number, first name, last name, and title of all employees hired in 2005.


SELECT d.dep_name, AVG(s.salary) AS avg_salary
FROM department d
JOIN dept_manager de ON d.dep_no = de.dept_no
JOIN (
    SELECT emp_no, AVG(salary) as salary
    FROM salaries
    GROUP BY emp_no
) s ON de.emp_no = s.emp_no
GROUP BY d.dep_name
ORDER BY avg_salary DESC
LIMIT 1;														#Find the department with the highest average salary.


SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.hire_date < '2005-01-01'; 							 #Retrieve the employee number, first name, last name, and salary of employees hired before the year 2005.


SELECT d.dep_no, d.dep_name, COUNT(de.emp_no) AS total_employees
FROM department d
JOIN dept_manager dm ON d.dep_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
JOIN dept_manager de ON d.dep_no = de.dept_no
WHERE e.gender = 'F'
GROUP BY d.dep_no, d.dep_name;											#Get the department number, name, and total number of employees for departments with a female manager.


SELECT e.emp_no, e.first_name, e.last_name, d.dep_name
FROM employees e
JOIN dept_manager de ON e.emp_no = de.emp_no
JOIN department d ON de.dept_no = d.dep_no
WHERE d.dep_name = 'Finance'
AND de.to_date = '01-01-9999';           #Retrieve the employee number, first name, last name, and department name of employees who are currently working in the Finance department.


SELECT d.dep_no, d.dep_name, e.emp_no, e.first_name, e.last_name, s.salary
FROM department d
JOIN dept_manager de ON d.dep_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE (d.dep_no, s.salary) IN (
    SELECT de.dept_no, MAX(s.salary)
    FROM dept_emp de
    JOIN salaries s ON de.emp_no = s.emp_no
    GROUP BY de.dept_no
);                                                   #Find the employee with the highest salary in each department.


SELECT e.emp_no, e.first_name, e.last_name, d.dep_name
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN department d ON dm.dept_no = d.dep_no
JOIN employee_title t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager';       #Retrieve the employee number, first name, last name, and department name of employees who have held a managerial position.


SELECT COUNT(DISTINCT emp_no) AS total_senior_managers
FROM employee_title
WHERE title = 'Senior Manager';    				#Get the total number of employees who have held the title "Senior Manager."


SELECT 
    dm.dept_no,
    d.dep_name,
    COUNT(e.emp_no) AS num_employees
FROM 
    dept_manager dm
JOIN 
    employees e ON dm.emp_no = e.emp_no
JOIN 
    department d ON dm.dept_no = d.dep_no
WHERE 
    DATEDIFF(CURRENT_DATE, STR_TO_DATE(e.hire_date, '%d-%m-%Y')) > 5 * 365
GROUP BY 
    dm.dept_no, d.dep_name;                #Retrieve the department number, name, and the number of employees who have worked there for more than 5 years.
    
    
    
SELECT 
    emp_no, 
    first_name, 
    last_name, 
    hire_date,
    DATEDIFF(CURRENT_DATE, STR_TO_DATE(hire_date, '%d-%m-%Y')) AS tenure_days
FROM 
    employees
ORDER BY 
    STR_TO_DATE(hire_date, '%d-%m-%Y') ASC
LIMIT 
    1;																#Find the employee with the longest tenure in the company.
    

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    et.title
FROM 
    employees e
JOIN 
    employee_title et ON e.emp_no = et.emp_no
WHERE 
    STR_TO_DATE(e.hire_date, '%d-%m-%Y') BETWEEN '2005-01-01' AND '2006-01-01';				#Retrieve the employee number, first name, last name, and title of employees whose hire date is between '2005-01-01' and '2006-01-01'.
    
    
    SELECT 
    dm.dept_no,
    d.dep_name,
    MIN(STR_TO_DATE(e.birth_date, '%d-%m-%Y')) AS oldest_birth_date
FROM 
    dept_manager dm																		#Get the department number, name, and the oldest employee's birth date for each department.
JOIN 
    employees e ON dm.emp_no = e.emp_no
JOIN 
    department d ON dm.dept_no = d.dep_no
GROUP BY 
    dm.dept_no, d.dep_name;


