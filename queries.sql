-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT
	P.ProductName AS Product,
	C.CategoryName AS Category
FROM
	Product AS P
	JOIN Category AS C 
	  ON P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
	O.Id,
	S.CompanyName
FROM
	"Order" AS O
	JOIN "Shipper" AS S 
    ON O.ShipVia = S.Id
WHERE
	O.OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
	P.ProductName,
	O.Quantity
FROM
	OrderDetail AS O
	JOIN Product AS P 
	  ON O.ProductId = P.Id
WHERE
	O.OrderId = 10251
ORDER BY
	P.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
	O.Id AS ID,
	C.CompanyName AS "Company Name",
	E.LastName AS "Employee's Last Name"
FROM
	"Order" AS O
	INNER JOIN "Customer" AS C 
		ON O.CustomerId = C.Id
	INNER JOIN "Employee" AS E 
		ON O.EmployeeId = E.Id

-- Stretch

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT 
	C.CategoryName AS Category, COUNT( C.CategoryID ) AS "Category Count" 
FROM 
	"Categories" AS C JOIN "Products" AS P ON C.CategoryID = P.CategoryID
GROUP BY 
	C.CategoryID
ORDER BY 
	"Category Count";

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID, SUM( Quantity ) AS "Item Count" FROM OrderDetails
GROUP BY OrderID;