-- JOINS ON SALESMAN DATABASE

-- https://www.w3resource.com/sql-exercises/sql-joins-exercises.php

-- 1 
SELECT S.name, C.cust_name, C.city 
FROM salesman AS S 
JOIN customer AS C
ON C.city = S.city;

-- 2
SELECT O.ord_no, O.purch_amt, C.cust_name, C.city 
FROM customer AS C
JOIN orders AS O
ON O.customer_id = C.customer_id
WHERE O.purch_amt BETWEEN 500 AND 2000;

-- 3
SELECT C.cust_name AS 'Customer', S.name AS 'Salesman'
FROM salesman AS S
JOIN customer AS C
ON C.salesman_id = S.salesman_id;

-- 4
SELECT C.cust_name AS 'Customer', S.name AS 'Salesman', S.comission
FROM salesman AS S
JOIN customer AS C
ON C.salesman_id = S.salesman_id
WHERE S.comission > 0.12;

-- 5
SELECT C.cust_name AS 'Customer', S.name AS 'Salesman', S.comission, S.city
FROM salesman AS S
JOIN customer AS C
ON C.salesman_id = S.salesman_id
WHERE S.comission > 0.12 AND S.city != C.city;


-- 6
SELECT O.ord_no, O.ord_date, O.purch_amt, C.cust_name AS "Customer", S.name AS "Salesman", S.commission
FROM orders AS O
INNER JOIN customer AS C
ON O.customer_id = C.customer_id 
INNER JOIN salesman AS S
ON O.salesman_id = S.salesman_id;

-- 7
SELECT C.cust_name AS "Customer"
FROM customer AS C
LEFT JOIN salesman AS S
ON C.salesman_id=C.salesman_id

-- 8
SELECT C.cust_name AS "Customer", C.customer_id
FROM customer AS C
LEFT JOIN salesman AS S
ON C.salesman_id=S.salesman_id
WHERE C.grade < 300
ORDER BY C.customer_id ASC;

-- 10
SELECT C.cust_name AS "Customer Name", C.city, O.ord_no, O.ord_date, O.purch_amt 
FROM customer AS C
LEFT JOIN orders AS O
ON C.customer_id=O.customer_id
ORDER BY O.ord_date;

-- 11
SELECT O.ord_no, O.ord_date, O.purch_amt, C.cust_name AS "Customer", S.name AS "Salesman", S.commission
FROM customer AS C
LEFT JOIN orders AS O
ON O.customer_id = C.customer_id 
LEFT JOIN salesman AS S
ON O.salesman_id = S.salesman_id;

-- 12
SELECT S.name AS "Salesman"
FROM salesman AS S
LEFT JOIN customer AS C
ON S.salesman_id=C.salesman_id
ORDER BY C.salesman_id ASC;

-- 13
SELECT S.name AS "Salesman"
FROM salesman AS S
LEFT JOIN customer AS C
ON S.salesman_id=C.salesman_id
LEFT JOIN orders AS O
ON C.customer_id=O.customer_id;

-- 14
SELECT S.name AS "Salesman"
FROM salesman AS S
LEFT JOIN customer AS C
ON S.salesman_id=C.salesman_id
LEFT OUTER JOIN orders AS O
ON C.customer_id=O.customer_id
WHERE O.purch_amt >= 2000
AND grade IS NOT NULL;

-- 15
SELECT C.cust_name AS "Customer",C.city, O.ord_no, O.ord_date, O.purch_amt
FROM customer AS C
RIGHT JOIN orders AS O
ON C.customer_id = O.customer_id;

-- 16
SELECT C.cust_name AS "Customer", C.city, O.ord_no, O.ord_date, O.purch_amt 
FROM customer AS C
FULL OUTER JOIN orders AS O
ON C.customer_id = O.customer_id
AND C.grade IS NOT NULL;

-- 17
SELECT S.name AS "Salesman", C.cust_name AS "Customer"
FROM salesman AS S
CROSS JOIN customer AS C;

-- 18
SELECT S.name AS "Salesman", C.cust_name AS "Customer"
FROM salesman AS S
CROSS JOIN customer AS C
WHERE s.city IS NOT NULL;

-- 19
SELECT S.name AS "Salesman", C.cust_name AS "Customer"
FROM salesman AS S
CROSS JOIN customer AS C
WHERE S.city IS NOT NULL AND C.grade IS NOT NULL;

-- 20
SELECT S.name AS "Salesman", C.cust_name AS "Customer"
FROM salesman AS S
CROSS JOIN customer AS C
WHERE S.city IS NOT NULL AND C.grade IS NOT NULL AND S.city != C.city;

-- 21
SELECT *
FROM item_mast AS I
INNER JOIN company_mast AS C
ON I.pro_com=C.com_id;


-- 22
SELECT I.pro_name, I.pro_price, C.com_name
FROM item_mast AS I
INNER JOIN company_mast AS C
ON I.pro_com=C.com_id;

-- 23
SELECT C.com_name, AVG(C.pro_price)
FROM item_mast AS I JOIN company_mast AS C
ON I.pro_com=C.com_id
GROUP BY C.com_name;

-- 24
SELECT C.com_name, AVG(C.pro_price) AS "Media"
FROM item_mast AS I JOIN company_mast AS C
ON I.pro_com=C.com_id
GROUP BY C.com_name
HAVING Media >= 350;

-- 25
SELECT C.com_name, I.pro_name, I.pro_price 
FROM item_mast AS I
JOIN company_mast AS C
ON I.pro_com=C.com_id
AND I.pro_price = (SELECT MAX(I.pro_price) FROM item_mast AS I WHERE I.pro_com = C.com_id);

-- 26
SELECT *
FROM emp_details edet
JOIN emp_department edep
ON edet.emp_dept = edep.dpt_code;

-- 27
SELECT edet.emp_fname AS "First", edet.emp_lname AS "Last", edep.dpt_name AS "Department", edep.dpt_allotment AS "Amount" 
FROM emp_details edet
JOIN emp_department edep
ON edet.emp_dept = edep.dpt_code;


-- 28
SELECT edet.emp_fname AS "First", edet.emp_lname AS "Last"
FROM emp_details edet
JOIN emp_department edep
ON edet.emp_dept = edep.dpt_code
AND edep.dpt_allotment > 50000;

-- 29
SELECT edep.dpt_name, COUNT(edet.emp_idno) 
FROM emp_details edet
JOIN emp_department edep
ON edet.emp_dept = edep.dpt_code
GROUP BY edep.dpt_name
HAVING COUNT(edet.emp_idno) > 2;

