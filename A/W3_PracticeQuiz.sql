-- How many albums does the artist Led Zeppelin have? 

SELECT COUNT(DISTINCT(B.Title)) 
FROM Artists A 
INNER JOIN Albums B 
ON B.ArtistId = A.ArtistId 
WHERE A.Name = 'Led Zeppelin';

-- Create a list of album titles and the unit prices for the artist "Audioslave"

SELECT B.Title, T.UnitPrice, A.Name FROM Albums B 
INNER JOIN Tracks T ON B.AlbumId = T.AlbumId 
INNER JOIN Artists A ON A.ArtistId = B.ArtistId 
WHERE A.Name = 'Audioslave';


-- Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  

SELECT C.FirstName, C.LastName, I.InvoiceID FROM Customers C 
LEFT JOIN Invoices I ON I.CustomerId = C.CustomerId WHERE I.CustomerId IS NULL

-- What is the total price for the album “Big Ones”?

SELECT B.Title, SUM(T.UnitPrice), A.Name FROM Albums B 
INNER JOIN Tracks T ON B.AlbumId = T.AlbumId 
INNER JOIN Artists A ON A.ArtistId = B.ArtistId 
GROUP BY A.Name HAVING B.Title = 'Big Ones' 


-- How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT I.InvoiceId Dados
FROM Invoices I
CROSS JOIN Invoice_Items 
