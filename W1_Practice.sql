-- Retrieve all the records from the Employees table.

SELECT * FROM Employees;

-- Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

SELECT FirstName,Birthdate FROM Employees;

--3. Retrieve all the columns from the Tracks table, but only return 20 rows.

SELECT * FROM Tracks limit 20;

SELECT Composer FROM Tracks WHERE TrackId = 18;


-- Run Query: Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?

SELECT * FROM Artists;

--Run Query: Retrieve all data from the invoices table. What is the billing address for customer 31?

SELECT * FROM Invoices;

-- Run Query: Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?

SELECT Playlistid, Name FROM Playlists;

-- Run Query: Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?

SELECT CustomerId, InvoiceDate, BillingCity FROM Invoices;

-- Run Query: Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?

SELECT FirstName, LastName, Email, Phone FROM Customers;

-- Run Query: Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?

SELECT TrackId, GenreId, Composer, UnitPrice FROM Tracks;

-- Run Query: Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?

SELECT * FROM Playlist_track Limit 10;

-- Run Query: Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?

SELECT * FROM Media_types Limit 50;

-- Run Query: Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table?

SELECT * FROM Albums;
