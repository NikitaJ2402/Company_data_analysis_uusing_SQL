# Company_data_analysis_uusing_SQL

Project Overview

This repository contains SQL scripts for creating and querying a database named company. The database is designed to store and analyze information related to employees, their departments, salaries, and management structure. The project demonstrates fundamental database operations, aggregation techniques, and data retrieval methods to facilitate insights into organizational data.

Features

Database Initialization:

Script to create a company database.

Tables include employee_title, employees, department, dept_emp, salaries, and dept_manager.

Data Retrieval Queries:

Fetch employee first and last names.

Retrieve department names and IDs.

Explore relationships between employees and departments.

Aggregations and Insights:

Calculate the total number of employees.

Determine the average salary across all employees.

How to Use

Clone the repository to your local machine.

git clone <repository_url>

Open the SQL file in your preferred database management tool.

Execute the script to create the database and run the queries.

Analyze the output to gain insights into the company data.

Prerequisites

A SQL-compatible database management system (e.g., MySQL, MariaDB).

Basic understanding of SQL commands and database operations.

Example Queries

List of Employees:

SELECT first_name, last_name FROM employees;

Total Number of Employees:

SELECT COUNT(*) AS total_employees FROM employees;

Average Salary:

SELECT AVG(salary) AS Avg_salary FROM salaries;

Contributing

Contributions are welcome! Please submit issues or pull requests for bug fixes, enhancements, or new features.

License

This project is licensed under the MIT License.
