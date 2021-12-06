USE HR_db;

-- Joins on HR Database

 SELECT e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM   employees AS e
       JOIN departments AS d
         ON e.department_id = d.department_id;  
         
          SELECT e.first_name,
       e.last_name,
       d.department_name,
       l.city,
       l.country_id,
       l.state_province
FROM   employees AS e
       INNER JOIN departments AS d
               ON e.department_id = d.department_id
       JOIN locations AS l
         ON l.location_id = d.location_id;

SELECT e.first_name,
       e.last_name,
       e.salary,
       j.job_title
FROM   employees AS e
       INNER JOIN jobs AS j
               ON e.job_id = j.job_id;  
               
SELECT e.first_name,
       e.last_name,
       d.department_name,
       d.department_id,
       l.city,
       l.country_id,
       l.state_province
FROM   employees AS e
       INNER JOIN departments AS d
               ON e.department_id = d.department_id
       JOIN locations AS l
         ON l.location_id = d.location_id
WHERE  e.department_id IN ( 1, 2, 3, 4 )
       AND l.country_id = 'US';


SELECT e.first_name,
       e.last_name,
       d.department_name,
       d.department_id,
       l.city,
       l.country_id,
       l.state_province
FROM   employees AS e
       INNER JOIN departments AS d
               ON e.department_id = d.department_id
       JOIN locations AS l
         ON l.location_id = d.location_id
WHERE  e.first_name LIKE '%w%';


SELECT e.first_name,
       e.last_name,
       d.department_name,
       d.department_id
FROM   employees AS e
       RIGHT OUTER JOIN departments AS d
                     ON e.department_id = d.department_id;


SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary
FROM   employees AS e
WHERE  e.salary > (SELECT salary
                   FROM   employees
                   WHERE  employee_id = 103);


SELECT e.first_name,
       e.last_name,
       d.department_name,
       l.city,
       l.country_id,
       l.state_province
FROM   employees AS e
       INNER JOIN departments AS d
               ON e.department_id = d.department_id
       JOIN locations AS l
         ON l.location_id = d.location_id;


SELECT *
FROM   employees
WHERE  department_id = (SELECT department_id
                        FROM   employees
                        WHERE  last_name LIKE 'Taylor');


SELECT E.first_name,
       E.last_name,
       D.department_name,
       Year(E.hire_date)  AS ano,
       Month(E.hire_date) AS mes,
       Day(E.hire_date)   AS dia,
       J.job_title
FROM   employees AS E
       JOIN departments AS D
         ON E.department_id = D.department_id
       JOIN jobs AS J
         ON J.job_id = E.job_id
WHERE  E.hire_date > '1990-01-01'
ORDER  BY E.hire_date;



SELECT Avg(E.salary)        AS media_salarial,
       Count(E.employee_id) AS numero_pessoas,
       D.department_name
FROM   employees AS E
       JOIN departments AS D
         ON E.department_id = D.department_id
GROUP  BY D.department_name
HAVING media_salarial > 5000;



SELECT L.country_id,
       L.state_province,
       L.city,
       Avg(E.salary)
FROM   employees AS E
       JOIN departments AS D
         ON E.department_id = D.department_id
       JOIN locations AS L
         ON L.location_id = D.location_id
GROUP  BY L.country_id,
          L.state_province,
          L.city;



SELECT Avg(E.salary)                 AS media_salarial,
       Stddev(ALL E.salary)          AS std,
       Count(E.employee_id)          AS numero_pessoas,
       Max(E.salary) - Min(E.salary) AS DIFMAXMIN,
       J.job_title
FROM   employees AS E
       JOIN jobs AS J
         ON E.job_id = J.job_id
GROUP  BY J.job_title;


SELECT E.employee_id,
       E.first_name,
       E.last_name,
       E.manager_id,
       D.department_name,
       M.nome AS Manager_Name
FROM   employees AS E
       JOIN departments AS D
         ON D.department_id = E.department_id
       JOIN (SELECT Concat(first_name, ' ', last_name) AS NOME,
                    department_id
             FROM   employees
             WHERE  manager_id IN (SELECT employee_id
                                   FROM   employees)) AS M
         ON M.department_id = D.department_id;  
