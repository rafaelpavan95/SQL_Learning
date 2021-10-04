
-- Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.


SELECT COUNT(Milliseconds) From Tracks WHERE Milliseconds >= 5000000;


-- Run Query: Find all the invoices whose total is between $5 and $15 dollars.


SELECT COUNT(Total) FROM Invoices WHERE Total BETWEEN 5 AND 15;


-- Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.


SELECT State, FirstName, LastName, Company FROM Customers WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');


-- Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT Total, CustomerId, InvoiceId, InvoiceDate FROM Invoices WHERE (Total BETWEEN 1 AND 5) AND CustomerId IN (56,58);


-- Run Query: Find all the tracks whose name starts with 'All'.

SELECT COUNT(Name) FROM Tracks WHERE Name Like 'All%';


-- Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email from Customers WHERE Email Like 'j%' AND Email Like '%gmail.com%';


-- Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT Total, BillingCity, InvoiceId FROM Invoices WHERE BillingCity IN ('Brasília', 'Edmonton','Vancouver') ORDER BY InvoiceId DESC; 


-- Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order. 

SELECT CustomerId, COUNT(*) AS Orders FROM Invoices GROUP BY CustomerId ORDER BY Orders DESC;


-- Run Query: Find the albums with 12 or more tracks. 

SELECT AlbumId, COUNT(*) AS QUANTIDADE FROM Tracks GROUP BY AlbumId HAVING QUANTIDADE>=12; 

