/*
Author: Kingsly Bude
*/

USE companyDatabase;

/*The following query selects the first name, last name, city, and company of customers that are recorded in the tblCustomer table.
However, It will only retrieve records that do not have an entry of "Oshawa" in the CustomerCity column.*/
SELECT CustomerCompany, CustomerFirstName, CustomerLastName, CustomerCity
FROM tblCustomer
WHERE CustomerCity <> 'Oshawa';

/*Query will retrieve all the columns from the tblInvoice where the Invoice was created before June 1st 2018.*/
SELECT *
FROM tblInvoice
WHERE InvoiceDate < '2018-06-01';

/*Query will obtain all the columns from tblInvoice where the Invoice was filed between June 1st, 2018 and December 31st, 2018.*/
SELECT *
FROM tblInvoice
WHERE InvoiceDate BETWEEN '2018-06-01' AND '2018-12-31';


/*This query retrieves customers that have"college" or "univeristy"  in their record in the tblCustomber table.*/
SELECT CustomerCompany, CustomerFirstName, CustomerLastName
FROM tblCustomer
WHERE CustomerCompany LIKE '%college%' OR CustomerCompany LIKE '%university%';


/*This obtains the number of people with a record of HSTDue inside the tblInvoice table balance due over $275.*/
SELECT COUNT(*) AS 'Over $275' 
FROM tblInvoice
WHERE HSTDue > $275;



