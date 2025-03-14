-- -- -- 1. Count the number of employees in each department
-- -- -- This query groups employees by department_id and counts how many employees exist in each.
-- -- SELECT department_id, COUNT(*) AS total_employees FROM hr.employees 
-- -- GROUP BY department_id;

-- -- -- 2. find the avarage salary in each department
-- -- SELECT department_id, avg(salary) as avg_salary
-- --  FROM hr.employees 
-- -- -- group by department_id;
-- -- this query helps us to find avg salary in each department

-- -- -- 3.find the maximum and minimum salary in each department
-- -- SELECT department_id, MAX(salary) AS max_salary, MIN(salary) AS min_salary
-- -- FROM hr. employees
-- -- GROUP BY department_id;
-- -- this query helps us to find the max and min salary in each department


-- -- -- 4. Find the total salary paid in each department
-- -- SELECT department_id, SUM(salary) AS total_salary 
-- -- FROM hr,employees
-- -- GROUP BY department_id;
-- -- this query helps us to find total salary paid in each departmnt

-- -- -- 5. Count the number of employees in each job role
-- -- SELECT job_id, COUNT(*) AS total_employees 
-- -- FROM hr.employees
-- -- GROUP BY job_id;
-- this query helps us to find total no of employees in each job id


-- -- 6. Find the average salary for each job role
-- SELECT job_id, AVG(salary) AS avg_salary
-- FROM hr.employees 
-- GROUP BY job_id;
-- this query helps to find avg salary of each job id

-- 7. Find the maximum salary for each job rol
--  SELECT job_id, MAX(salary) AS max_salary
-- FROM hr.employees 
-- GROUP BY job_id;
-- this query helps to find max salary for each job id

-- 8. Find the minimum salary for each job role
--  SELECT job_id, MIN(salary) AS mIN_salary
-- FROM hr.employees 
-- GROUP BY job_id;
-- this query helps to find mIN salary for each job id

-- 9. Find the total salary paid for each job role
-- SELECT job_id, SUM(salary) AS total_salary
-- FROM hr.employees
-- GROUP BY job_id;
-- this query helps to find total salary in each job id

-- -- 10. Count the number of employees hired in each year
-- SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_employees 
-- FROM hr.employes 
-- GROUP BY EXTRACT(YEAR FROM hire_date)
-- GROUP BY hire_year;
-- this query helps to find no of employees hired in each year

-- -- 11. Find the total salary paid in each location
-- SELECT d.location_id, SUM(e.salary) AS total_salary 
-- FROM hr.employees 
-- JOIN departments d ON e.department_id = d.department_id
-- GROUP BY d.localion_id;
-- this query helps to find total salary paid in each location


-- -- 12. Find the number of employees in each manager's team
-- SELECT manager_id, COUNT(*) AS team_size 
-- FROM hr.employees 
-- WHERE manager_id IS NOT NULL
-- GROUP BY manager_id;
-- this query helps to find no of employees in each manager's team

-- -- 13. Find the highest salary for each manager
-- SELECT manager_id, MAX(salary) AS max_salary 
-- FROM hr.employees 
-- WHERE manager_id IS NOT NULL
-- GROUP BY manager_id;
-- this query helps to find the highest salary among employees under each manager

-- -- 14. Find the average salary for each manager's team
-- SELECT manager_id, AVG(salary) AS avg_salary
-- FROM hr.employees
-- WHERE manager_id IS NOT NULL
-- GROUP BY manager_id;
-- \this query helps to find the avg salary for employees under each manager's team

-- -- 15. Count the number of employees hired in each month of the year
-- SELECT EXTRACT(MONTH FROM hire_date) AS hire_month, COUNT(*) AS total_hired 
-- FROM hr.employees 
-- GROUP BY EXTRACT(MONTH FROM hire_date)
-- GROUP BY hire_month;
-- this query helps to find the no of employees hired in each month

-- -- 16. Find the department with the highest total salary
-- SELECT department_id, SUM(salary) AS total_salary
-- FROM hr.employees 
-- GROUP BY department_id 
-- GROUP BY total_salary DESC 
-- FETCH FIRST 1 ROW ONLY;


-- -- 17. Find the job role with the highest average salary
-- SELECT job_id, AVG(salary) AS avg_salary
-- FROM hr.employees 
-- GROUP BY job_id
-- ORDER BY avg_salary DESC
-- FETCH FIRST 1 ROW ONLY;
-- this query helps to find the highest avg salary of the job role


-- -- 18. Find the number of employees in each city
-- SELECT L.city, COUNT(*) AS total_employees 
-- FROM hr.employees 
-- JOIN departments d ON e.department_id = d.department_id
-- JOIN localion l ON d.location_id = l.location_id 
-- GROUP BY l.city;

-- - 19. Find the number of employees who have a commission, grouped by department
-- SELECT department_id, COUNT(*) AS employees_with_commission
-- FROM employees
-- WHERE commission_pct IS NOT NULL
-- GROUP BY department_id;
-- this query helps to count the employees who recived commissions grouped by department

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- SELECT department_id, SUM(salary) AS total_salary_with_commission
-- FROM employees
-- WHERE commission_pct IS NOT NULL
-- GROUP BY department_id;
-- this query sum up the salary of employees who recives a commissions grouped by department

-- sales query

-- SELECT * from sh.sales

-- -- -- 1. Count the number of sales transactions for each product.  
-- SELECT prod_id, COUNT(*) AS transaction_count
-- FROM sh.sales 
-- GROUP BY prod_id 
-- ORDER BY transaction_count DESC;

--  Find the average sale amount for each product. 
-- SELECT prod_id, AVG(amount_sold) AS avg_amount_sold
-- FROM sh.sales
-- GROUP BY prod_id
-- ORDER BY avg_amount_sold DESC;

--  Find the maximum and minimum sale amount for each product.
SELECT prod_id, MAX(amount_sold) AS max_sales_amount, MIN(amount_sold) AS min_sales_amount
from sh.sales 
GROUP BY prod_id 
ORDER BY max_sales_amount DESC;

-- Find the total revenue generated by each product.
SELECT prod_id, SUM(amount_sold) AS total_revenue
FROM sh.sales
GROUP BY prod_id
ORDER BY total_revenue DESC;

-- Count the number of sales transactions for each customer.
SELECT cust_id, COUNT(*) AS transaction_count
FROM sh.sales
GROUP BY cust_id
ORDER BY transaction_count DESC;

-- Find the average sale amount per customer.
SELECT cust_id, AVG(amount_sold) AS avg_sale_amount
FROM sh.sales
GROUP BY cust_id
ORDER BY avg_sale_amount DESC;

-- Find the highest purchase amount for each customer.
SELECT cust_id, MAX(amount_sold) AS highest_purchase
FROM sh.sales
GROUP BY cust_id
ORDER BY highest_purchase DESC;

--  Find the lowest purchase amount for each customer
select cust_id,min(amount_sold)as lowest_purchase
from sh.sales
group by cust_id
order by lowest_purchase desc