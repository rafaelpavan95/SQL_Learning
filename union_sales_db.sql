-- UNION ON SALES DATABASE

SELECT 
  salesman_id AS "ID", 
  name, 
  'Salesman' 
FROM 
  salesman 
WHERE 
  city = 'London' 
UNION 
  (
    SELECT 
      customer_id AS "ID", 
      cust_name, 
      'Customer' 
    FROM 
      customer 
    WHERE 
      city = 'London'
  );
SELECT 
  salesman_id, 
  city 
FROM 
  customer 
UNION 
  (
    SELECT 
      salesman_id, 
      city 
    FROM 
      salesman
  );
SELECT 
  salesman_id, 
  customer_id 
FROM 
  customer 
UNION 
  (
    SELECT 
      salesman_id, 
      customer_id 
    FROM 
      orders
  );
SELECT 
  a.salesman_id, 
  name, 
  ord_no, 
  'maior na data', 
  ord_date 
FROM 
  salesman a, 
  orders b 
WHERE 
  a.salesman_id = b.salesman_id 
  AND b.purch_amt = (
    SELECT 
      MAX (purch_amt) 
    FROM 
      orders c 
    WHERE 
      c.ord_date = b.ord_date
  ) 
UNION 
  (
    SELECT 
      a.salesman_id, 
      name, 
      ord_no, 
      'menor na data', 
      ord_date 
    FROM 
      salesman a, 
      orders b 
    WHERE 
      a.salesman_id = b.salesman_id 
      AND b.purch_amt = (
        SELECT 
          MIN (purch_amt) 
        FROM 
          orders c 
        WHERE 
          c.ord_date = b.ord_date
      );
SELECT 
  a.salesman_id, 
  name, 
  ord_no, 
  'maior na data', 
  ord_date 
FROM 
  salesman a, 
  orders b 
WHERE 
  a.salesman_id = b.salesman_id 
  AND b.purch_amt = (
    SELECT 
      MAX (purch_amt) 
    FROM 
      orders c 
    WHERE 
      c.ord_date = b.ord_date
  ) 
UNION 
  (
    SELECT 
      a.salesman_id, 
      name, 
      ord_no, 
      'menor na data', 
      ord_date 
    FROM 
      salesman a, 
      orders b 
    WHERE 
      a.salesman_id = b.salesman_id 
      AND b.purch_amt = (
        SELECT 
          MIN (purch_amt) 
        FROM 
          orders c 
        WHERE 
          c.ord_date = b.ord_date
      ) 
    ORDER BY 
      3;
SELECT 
  salesman.salesman_id, 
  name, 
  cust_name, 
  commission 
FROM 
  salesman, 
  customer 
WHERE 
  salesman.city = customer.city 
UNION 
  (
    SELECT 
      salesman_id, 
      name, 
      'no match', 
      commission 
    FROM 
      salesman 
    WHERE 
      NOT city = ANY (
        SELECT 
          city 
        FROM 
          customer
      )
  ) 
ORDER BY 
  2 DESC;
SELECT 
  a.salesman_id, 
  name, 
  a.city, 
  'matched' 
FROM 
  salesman a, 
  customer b 
WHERE 
  a.city = b.city 
UNION 
  (
    SELECT 
      salesman_id, 
      name, 
      city, 
      'no matched' 
    FROM 
      salesman 
    WHERE 
      NOT city = ANY (
        SELECT 
          city 
        FROM 
          customer
      )
  ) 
ORDER BY 
  2 DESC;
SELECT 
  customer_id, 
  city, 
  grade, 
  'High Rating' 
FROM 
  customer 
WHERE 
  grade >= 300 
UNION 
  (
    SELECT 
      customer_id, 
      city, 
      grade, 
      'Low Rating' 
    FROM 
      customer 
    WHERE 
      grade < 300
  );
SELECT 
  customer_id AS “ID”, 
  cust_name AS “NAME” 
FROM 
  customer a 
WHERE 
  (
    SELECT 
      COUNT (*) 
    FROM 
      orders b 
    WHERE 
      a.customer_id = b.customer_id
  ) > 1 
UNION 
  (
    SELECT 
      salesman_idas “ID”, 
      name AS “NAME” 
    FROM 
      salesman a 
    WHERE 
      (
        SELECT 
          COUNT (*) 
        FROM 
          orders b 
        WHERE 
          a.salesman_id = b.salesman_id
      )
  ) > 1 
ORDER BY 
  2;
