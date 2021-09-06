USE HR_db;

-- exercícios https://www.w3resource.com/sql-exercises/sorting-and-filtering-hr/index.php

SELECT CONCAT(first_name,' ', last_name) as full_name, salary FROM employees WHERE salary < 6000;

SELECT first_name, last_name, department_id FROM employees  WHERE last_name = 'Russell';

SELECT * FROM employees WHERE department_id IS NULL;

SELECT * FROM departments WHERE department_name = 'Marketing';

SELECT CONCAT(first_name,' ', last_name) AS full_name, department_id, salary FROM employees WHERE first_name NOT LIKE '%M%' ORDER BY department_id;

SELECT * FROM employees WHERE (job_id IN(4,3,9)) AND (SALARY BETWEEN 4000 AND 9000) AND hire_date < '1995-01-01';

SELECT * FROM employees WHERE salary>4000 AND salary<8000;

SELECT first_name, last_name, salary FROM employees WHERE first_name LIKE '%m';

SELECT * FROM employees WHERE salary NOT BETWEEN 7000 AND 12000 ORDER BY CONCAT(first_name,' ',last_name);

SELECT * FROM employees WHERE hire_date BETWEEN '1994-05-11' AND '1998-07-09' ORDER BY hire_date;

SELECT CONCAT(first_name,' ', last_name) AS full_name, department_id FROM employees WHERE department_id IN (1,3);

SELECT CONCAT(first_name,' ', last_name) AS full_name, manager_id FROM employees WHERE manager_id IS NOT NULL;

SELECT * FROM employees WHERE hire_date > '1999-01-01' ORDER BY hire_date;

SELECT CONCAT(first_name,' ', last_name) AS full_name, manager_id FROM employees WHERE manager_id IN(100,108,101);

SELECT CONCAT(first_name,' ', last_name) AS full_name FROM employees WHERE first_name LIKE '%x%' AND last_name LIKE 'H%';

SELECT CONCAT(first_name, ' ', last_name) AS nome, CONCAT(email, ' - ', phone_number) AS contato, salary
	FROM employees 
    WHERE salary > 4000 OR phone_number LIKE '______3%';

SELECT first_name, last_name, department_id FROM employees WHERE first_name LIKE '__s%';

SELECT first_name, last_name, employee_id, job_id, department_id FROM employees WHERE department_id NOT IN (10,4);

SELECT first_name, last_name, employee_id, job_id, department_id FROM employees WHERE department_id IN (10,4);

SELECT job_id, SUM(salary) FROM employees GROUP BY job_id HAVING COUNT(*) > 3;

SELECT job_id, SUM(salary), COUNT(salary), AVG(salary), MAX(salary) - MIN(salary) AS dif FROM employees GROUP BY job_id;

SELECT country_id, COUNT(DISTINCT city) FROM locations GROUP BY country_id;

SELECT manager_id, COUNT(DISTINCT employee_id) FROM employees GROUP BY manager_id;

SELECT * FROM jobs ORDER BY job_title;

SELECT E.first_name, E.last_name, E.hire_date, E.job_id, J.job_id, J.job_title FROM employees AS E INNER JOIN jobs as J ON E.job_id = J.job_id; 

SELECT DISTINCT department_id, manager_id, COUNT(DISTINCT employee_id) as conta FROM employees GROUP BY department_id, manager_id HAVING conta>3;

SELECT * FROM employees WHERE salary BETWEEN 4000 and 8000 OR department_id IN (6,5,10);

SELECT job_id, AVG(salary), MAX(salary),MIN(salary) FROM employees WHERE salary > 8000 GROUP BY job_id;

SELECT job_id, job_title, max_salary - min_salary AS dif FROM jobs WHERE max_salary BETWEEN 2000 AND 18000;

SELECT * FROM jobs WHERE min_salary > 9000;

SELECT * FROM employees WHERE hire_date > '1995-02-16';
