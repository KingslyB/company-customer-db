/*
Author: Kingsly Bude
*/

USE companyDatabase;

-- SELECTING every attribute FROM the orders table JOINED with the customer table WHERE the customer lives in Oshawa OR Whitby AND has a fufilled order
SELECT Count(*) AS "Oshawa/Whitby"
FROM tblOrder
	INNER JOIN tblCustomer ON tblOrder.CustomerID = tblCustomer.CustomerID
WHERE Fulfilled = 1  AND CustomerCity LIKE 'Oshawa' OR CustomerCity LIKE 'Whitby';



-- SELECTING the invoice ID from the invoiced items table, as well as the LOWEST, HIGEST and the TOTAL amount of items in the invoice
SELECT tblInvoicedItems.InvoiceID AS "Invoice ID",
	MIN(tblInvoicedItems.UnitPrice) AS "Lowest Priced Item in Invoice",
	MAX(tblInvoicedItems.UnitPrice) AS "Highest Priced Item in Invoice",
	SUM (tblInvoicedItems.QuantityShipped) AS "Number of Items"
FROM tblInvoicedItems
GROUP BY tblInvoicedItems.InvoiceID;



-- SELECTING the customer's company, order id, invoice id, the date the order placed, and the date the invoice was created FROM the order table JOINED with the customer and invoice table.
SELECT CustomerCompany,
	tblOrder.OrderID,
	InvoiceID,
	OrderDate,
	InvoiceDate,
	DATEDIFF(day, OrderDate, InvoiceDate) AS "Difference in Days"
FROM tblOrder
	INNER JOIN tblInvoice ON tblOrder.OrderID = tblInvoice.OrderID
	INNER JOIN tblCustomer ON tblOrder.CustomerID = tblCustomer.CustomerID
WHERE YEAR(InvoiceDate) != YEAR(OrderDate);



-- SELECTING the order id, as well as combining from the customer's first and last name from the customer table JOINED with the order table WHERE the record places the order date between May 1st, 2018 and May 31st, 2018.
SELECT  OrderID, (CustomerFirstName + ' ' + CustomerLastName) AS "Customer Name"
FROM tblOrder
		INNER JOIN tblCustomer ON tblOrder.CustomerID = tblCustomer.CustomerID
WHERE OrderDate BETWEEN '2018-05-01' AND '2018-05-31';