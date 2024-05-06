/*
Author: Kingsly Bude
*/

/*Droping existing database if it exists*/
DROP DATABASE IF EXISTS dbasDatabase;
/*GO keyword will make sure the query updates the database according to the statements before it*/
GO

/*Creating a new database.*/
CREATE DATABASE dbasDatabase;
GO

/*The rest of this script will use the following database*/
USE dbasDatabase;
GO

/* Creating the customer table to hold the information about a customer */
CREATE TABLE tblCustomer (
   CustomerID INT PRIMARY KEY,
   CustomerCompany VARCHAR(50),
   CustomerFirstName VARCHAR(40),
   CustomerLastName VARCHAR(40),
   CustomerStreetAddress VARCHAR(80),
   CustomerCity VARCHAR(40),
   CustomerPostalCode VARCHAR(6),
   CustomerProvince CHAR(2)
);
/*Inserting relevant data*/
INSERT INTO tblCustomer VALUES(1, 'Durham College', 'Kevin', 'Dougherty', '2000 Simcoe Street North', 'Oshawa', 'L1N2J3', 'ON');
INSERT INTO tblCustomer VALUES(2, 'University of Ontario Institute of Technology','Roland','van Oostveen','Simcoe Street North','Oshawa','L1G4R7','ON');
INSERT INTO tblCustomer VALUES(3, 'Canadian Tire Motorsport Park','Glenn','Bottom','3233 Concession Rd 10','Bowmanville','L1C3K6','ON');
INSERT INTO tblCustomer VALUES(4, 'Fraser Ford Sales & Service','Kim','Eh','815 King St W','Oshawa','L1J8N5','ON');
INSERT INTO tblCustomer VALUES(5, 'Johnson Research & Performance','Ben','Kitchen','2344 South Sheridan Way','Mississauga','L5J2M4','ON');
INSERT INTO tblCustomer VALUES(6, 'Casino Niagara','Ashley','Peckford','5705 Falls Ave','Niagara Falls','L2E6T3','ON');



/*Creating the territory table to hold data on customer locations*/
CREATE TABLE tblTerritory(
   TerritoryID INT PRIMARY KEY,
   TerritoryName VARCHAR(40),
   TerritoryRegion VARCHAR(2)
);
/*Inserting relevant data*/
INSERT INTO tblTerritory VALUES(1,'Essex','W');
INSERT INTO tblTerritory VALUES(2,'Chatham-Kent','W');
INSERT INTO tblTerritory VALUES(3,'Lambton','W');
INSERT INTO tblTerritory VALUES(4,'MiddleSex','W');
INSERT INTO tblTerritory VALUES(5,'Elgin','W');
INSERT INTO tblTerritory VALUES(6,'Oxford','W');
INSERT INTO tblTerritory VALUES(7,'Norfolk','W');
INSERT INTO tblTerritory VALUES(8,'Haldimand','W');
INSERT INTO tblTerritory VALUES(9,'Niagara','W');
INSERT INTO tblTerritory VALUES(10,'Hamilton','W');
INSERT INTO tblTerritory VALUES(11,'Brant','W');
INSERT INTO tblTerritory VALUES(12,'Perth','W');
INSERT INTO tblTerritory VALUES(13,'Huron','W');
INSERT INTO tblTerritory VALUES(14,'Bruce','W');
INSERT INTO tblTerritory VALUES(15,'Grey','W');
INSERT INTO tblTerritory VALUES(16,'Wellington','W');
INSERT INTO tblTerritory VALUES(17,'Waterloo','W');
INSERT INTO tblTerritory VALUES(18,'Halton','W');
INSERT INTO tblTerritory VALUES(19,'Peel','CW');
INSERT INTO tblTerritory VALUES(20,'Dufferin','CW');
INSERT INTO tblTerritory VALUES(21,'Simcoe','CW');
INSERT INTO tblTerritory VALUES(22,'York','CW');
INSERT INTO tblTerritory VALUES(23,'Toronto','CE');
INSERT INTO tblTerritory VALUES(24,'Durham','CE');
INSERT INTO tblTerritory VALUES(25,'Kawartha Lakes','E');
INSERT INTO tblTerritory VALUES(26,'Muskoka','E');
INSERT INTO tblTerritory VALUES(27,'Haliburton','E');
INSERT INTO tblTerritory VALUES(28,'Peterborough','E');
INSERT INTO tblTerritory VALUES(29,'Hastings','E');
INSERT INTO tblTerritory VALUES(30,'Frontenac','E');
INSERT INTO tblTerritory VALUES(31,'Lanark','E');
INSERT INTO tblTerritory VALUES(32,'Leeds and Granville','E');
INSERT INTO tblTerritory VALUES(33,'Nipissing','E');
INSERT INTO tblTerritory VALUES(34,'Parry Sound','N');
INSERT INTO tblTerritory VALUES(35,'Manitoulin','N');
INSERT INTO tblTerritory VALUES(36,'Sudbury','N');
INSERT INTO tblTerritory VALUES(37,'Cochrane','N');
INSERT INTO tblTerritory VALUES(38,'Thunder Bay','N');
INSERT INTO tblTerritory VALUES(39,'Kenora','N');
INSERT INTO tblTerritory VALUES(40,'Northumberland','E');



/*Creating the product table to hold data on all products.*/
CREATE TABLE tblProduct(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(50),
   Description VARCHAR(200),
   MSRP DECIMAL(6,2)
);
/*Inserting relevant data*/
INSERT INTO tblProduct VALUES(1, 'Office Chair ProDeluxe Supreme', 'Super soft, super cushy, try to not fall asleep.', 299.99);
INSERT INTO tblProduct VALUES(2, 'Office Chair Deluxe', 'It''s a chair, with wheels. It''ll support you in your office.', 59.99);
INSERT INTO tblProduct VALUES(3, 'Single Station Work Desk', 'Small desk large enough for a laptop and some paperwork. Meant as a temporary/transient work station.', 89.99);
INSERT INTO tblProduct VALUES(4, 'The Swingline Full Desk', 'A tribute to our favourite stapler, this desk is large and in charge with three drawers, a deep surface to hold all your work and plenty of trinkets. Available in a variety of one colour. Enjoy!',499.99);
INSERT INTO tblProduct VALUES(5, 'The Execudesk', 'Our top of the line product as per desks. Fine oak stained finish, sparkles in the sunlight through your corner office window.', 1299.99);
INSERT INTO tblProduct VALUES(6, 'The Common Diner', 'Simple dining table great for break rooms.', 100.00);
INSERT INTO tblProduct VALUES(7, 'The Common Diner w/attached Seat', 'Our same classic break room table design with attached chairs.', 350.00);
INSERT INTO tblProduct VALUES(8, 'A Chair', 'Simple, clean and easy to stack. Perfect for group seating that you don''t need 100% of the time.', 15.00);
INSERT INTO tblProduct VALUES(9, 'The Book Nook', 'Modern take on a classic design, this 3 shelf bookery will hold books and other stuff. It''s especially fantastic at stuff.', 69.99);


/*Creating the order table will let us keep track of the orders created*/
CREATE TABLE tblOrder (
   OrderID INT PRIMARY KEY,
   OrderDate DATE,
   CustomerID  INT REFERENCES tblCustomer (CustomerID),
   Fulfilled BIT
);
/*Inserting relevant data*/
INSERT INTO tblOrder VALUES(1, '2018-03-01', 1, 0);
INSERT INTO tblOrder VALUES(2, '2018-08-01', 1, 0);
INSERT INTO tblOrder VALUES(3, '2018-03-06', 3, 0);
INSERT INTO tblOrder VALUES(4, '2018-05-14', 4, 0);
INSERT INTO tblOrder VALUES(5, '2017-11-05', 6, 0);
INSERT INTO tblOrder VALUES(6, '2012-04-03', 5, 0);
INSERT INTO tblOrder VALUES(7, '2015-01-29', 2, 0);



/*Creating the ordered items table to list all orders and thir accociated order id*/
CREATE TABLE tblOrderedItems (
   OrderID INT REFERENCES tblOrder (OrderID),
   ProductID INT REFERENCES tblProduct (ProductID),
   OrderedQuantity INT,
);
/*Inserting relevant data*/
INSERT INTO tblOrderedItems VALUES(1,1,1);
INSERT INTO tblOrderedItems VALUES(1,5,1);
INSERT INTO tblOrderedItems VALUES(2,7,16);
INSERT INTO tblOrderedItems VALUES(3,8,200);
INSERT INTO tblOrderedItems VALUES(4,2,20);
INSERT INTO tblOrderedItems VALUES(4,3,15);
INSERT INTO tblOrderedItems VALUES(4,4,3);
INSERT INTO tblOrderedItems VALUES(4,5,2);
INSERT INTO tblOrderedItems VALUES(5,6,45);
INSERT INTO tblOrderedItems VALUES(5,8,180);
INSERT INTO tblOrderedItems VALUES(6,1,1);
INSERT INTO tblOrderedItems VALUES(6,2,1);
INSERT INTO tblOrderedItems VALUES(6,4,1);
INSERT INTO tblOrderedItems VALUES(6,5,1);
INSERT INTO tblOrderedItems VALUES(7,7,5);


CREATE TABLE tblInvoice (
   InvoiceID INT PRIMARY KEY,
   OrderID INT FOREIGN KEY REFERENCES tblOrder(OrderID),
   InvoiceDate DATE,
   HSTDue DECIMAL(6,2)
);
/*Inserting relevant data*/
INSERT INTO tblInvoice VALUES(1,1,'2018-03-05', 207.74);
INSERT INTO tblInvoice VALUES(2,2,'2018-08-04', 455.00);
INSERT INTO tblInvoice VALUES(3,3,'2018-05-24', 292.50);
INSERT INTO tblInvoice VALUES(4,2,'2018-08-13', 273.00);
INSERT INTO tblInvoice VALUES(5,3,'2018-08-21', 0.00);
INSERT INTO tblInvoice VALUES(6,4,'2018-06-21', 864.45);
INSERT INTO tblInvoice VALUES(7,5,'2019-01-01', 0.00);


CREATE TABLE tblInvoicedItems (
   InvoiceID INT REFERENCES tblInvoice (InvoiceID),
   ProductID INT REFERENCES tblProduct (ProductID),
   QuantityShipped INT,
   UnitPrice NUMERIC(6,2)
);
/*Inserting relevant data*/
INSERT INTO tblInvoicedItems VALUES(1,1,1, 299.99);
INSERT INTO tblInvoicedItems VALUES(1,2,1, 299.99);
INSERT INTO tblInvoicedItems VALUES(2,7,10, 350.00);
INSERT INTO tblInvoicedItems VALUES(3,8,150, 15.00);
INSERT INTO tblInvoicedItems VALUES(4,7,6, 0.00);
INSERT INTO tblInvoicedItems VALUES(5,8,50, 15.00);
INSERT INTO tblInvoicedItems VALUES(6,2,20, 59.00);
INSERT INTO tblInvoicedItems VALUES(6,3,15, 89.99);
INSERT INTO tblInvoicedItems VALUES(6,4,3, 499.99);
INSERT INTO tblInvoicedItems VALUES(6,5,2, 299.99);
INSERT INTO tblInvoicedItems VALUES(7,6,40, 100.00);
INSERT INTO tblInvoicedItems VALUES(7,8,100, 15.00);


/*Creating the customer territory that holds customer's territories.
  This table contains only referenced records*/
CREATE TABLE tblCustomerTerritory (
   CustomerID INT REFERENCES tblCustomer (CustomerID),
   TerritoryID INT REFERENCES tblTerritory (TerritoryID)
);
/*Inserting relevant data*/
INSERT INTO tblCustomerTerritory VALUES(1,24);
INSERT INTO tblCustomerTerritory VALUES(2,24);
INSERT INTO tblCustomerTerritory VALUES(3,24);
INSERT INTO tblCustomerTerritory VALUES(4,24);
INSERT INTO tblCustomerTerritory VALUES(4,40);
INSERT INTO tblCustomerTerritory VALUES(5,23);
INSERT INTO tblCustomerTerritory VALUES(6,9);
INSERT INTO tblCustomerTerritory VALUES(6,21);


/*Creating the sales person table that contains information about sales employees*/
CREATE TABLE tblSalesperson (
   SalespersonID INT PRIMARY KEY,
   SalespersonFirstName VARCHAR(30),
   SalespersonLastName VARCHAR(30),
   SalespersonTelephone CHAR(14),
   TerritoryID INT REFERENCES tblTerritory (TerritoryID),
);
/*Inserting relevant data*/
INSERT INTO tblSalesperson VALUES(1, 'Jeremy', 'Irons', '9059565445', 24);
INSERT INTO tblSalesperson VALUES(2, 'Stefanie', 'Vanthoors', '9055556666', 23);
INSERT INTO tblSalesperson VALUES(3, 'Frida', 'Galvan', '4168745687', 9);
INSERT INTO tblSalesperson VALUES(4, 'Brianne', 'Madill', '9054687566', 40);
INSERT INTO tblSalesperson VALUES(5, 'Robert', 'Felisitano', '9064325433', 21);
INSERT INTO tblSalesperson VALUES(6, 'Andrew', 'McIntosh', '9059989974', 26);

