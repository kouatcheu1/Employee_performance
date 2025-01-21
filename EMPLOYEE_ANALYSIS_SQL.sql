-- creating database
create database EMPLOYEE_INFO;
use EMPLOYEE_INFO;

-- selecting all information on the table 
select * from employee_data; 

-- Identify missing or null values
-- 1.	Handle Missing Data 
SELECT *
FROM employee_data
WHERE salary IS NULL OR job_category IS NULL OR experience_level IS NULL;

-- 2.	Segment Data: 
-- updating the table to add the values 
update employee_data set company_size = 'Large' where company_size = 'L';
update employee_data set company_size = 'Medium' where company_size = 'M';
update employee_data set company_size = 'Small' where company_size = 'S';

-- 3.	Add Derived Fields
-- adding necessary field 
ALTER TABLE employee_data ADD COLUMN tenure_years INT;  

-- updating the column 
UPDATE employee_data
SET tenure_years = 2024 - work_year;

-- changing tabe name to employee
alter table employee_data rename to employee;

-- Employee Performance Analysis using sql
-- 1.	Assess Salary and Performance Correlation:
SELECT experience_level, AVG(salary) AS avg_salary, COUNT(*) AS employee_count
FROM employee
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- 2.	Work Setting Analysis
SELECT work_setting, AVG(salary) AS avg_salary, COUNT(*) AS employee_count
FROM employee
GROUP BY work_setting
ORDER BY avg_salary DESC;

-- 3.	Experience Level and Job Role Insights
SELECT job_category, experience_level, AVG(salary) AS avg_salary, COUNT(*) AS employee_count
FROM employee
GROUP BY job_category, experience_level
ORDER BY avg_salary desc;
