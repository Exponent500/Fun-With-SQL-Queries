/* Exercise #1 */

SELECT CategoryName, Description
FROM Categories

/* Exercise #2 */

SELECT ContactName, CustomerID, CompanyName
FROM Customers
WHERE City = 'London'

/*Exercise #3 */

SELECT *
FROM Suppliers
WHERE ContactTitle IN ('Marketing Manager', 'Sales Representative') AND Fax is not null

/*Exercise #4 */

SELECT CustomerID
FROM Orders
WHERE RequiredDate BETWEEN  '01/01/1997' AND '01/01/1998' AND Freight < 100

/*Exercise #5 */

SELECT CompanyName, ContactName, Country
FROM  Customers
WHERE Country IN ('Mexico', 'Sweden', 'Germany')

/*Exercise #6 */

SELECT count(*)
FROM Products
WHERE Discontinued = 'true'

/*Exercise #7 */

SELECT CategoryName, Description
FROM Categories
WHERE CategoryName LIKE 'Co%'

/*Exercise #8 */

SELECT CompanyName,City, Country, PostalCode
FROM Suppliers
WHERE Address LIKE '%rue%'
ORDER BY CompanyName ASC

/* Exercise #9 */

SELECT ProductID, Quantity
FROM "Order Details"

/* Exercise #10 */

SELECT o.OrderID, c.CompanyName, c.Address
FROM Orders o, Customers c
WHERE o.ShipVia = 1
AND o.CustomerID = c.CustomerID
ORDER BY o.OrderID

/* Exercise #11 */

SELECT CompanyName, ContactName, ContactTitle, Region
FROM Suppliers

/* Exercise #12 */

SELECT p.ProductName, c.CategoryName 
FROM Products p, Categories c
WHERE p.CategoryID = c.CategoryID AND c.CategoryName = 'Condiments'

/* Exercise #13 */

SELECT c.CompanyName
FROM Customers c
WHERE NOT EXISTS (SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID)

/* Exercise #14 */

INSERT INTO Shippers(CompanyName)
VALUES('Amazon')

/* Exercise #15 */

UPDATE Shippers
SET CompanyName = 'Amazon Prime Shipping'
WHERE ShipperID = 4

/* Exercise #16 */
SELECT s.CompanyName, ROUND(SUM(o.Freight),0) AS 'Total Freight'
FROM Shippers s, Orders o
WHERE s.ShipperID = o.ShipVia
GROUP BY s.CompanyName


/* Exercise #17 */
SELECT COALESCE(LastName, '') + COALESCE(', ','') + COALESCE(FirstName, '') AS 'DisplayName'
FROM Employees


/* Exercise #18 */

INSERT INTO Customers(CustomerID, CompanyName, ContactName)
VALUES('REUVK', 'ACME', 'Reuven Kishon')

INSERT INTO Orders(CustomerID)
VALUES ('REUVK')

DECLARE @OrderID int /* declares a variable of type int*/
SELECT @OrderID = OrderID /* stores a value into OrderID variable */
FROM Orders
WHERE CustomerID LIKE '%REUVK%'

INSERT INTO [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (@OrderID, '6', '20', '2', '0')

/* Exercise #19 */

DECLARE @OrderID int
SELECT @OrderID = OrderID
FROM Orders
WHERE CustomerID LIKE '%REUVK%'

DELETE FROM [Order Details] 
WHERE OrderID = @OrderID  

DELETE FROM Orders
WHERE CustomerID = 'REUVK'

DELETE FROM Customers
WHERE ContactName = 'Reuven Kishon'

/* Exercise #20 */

SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock > 100