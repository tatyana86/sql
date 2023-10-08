9.4.1
SELECT t1.ContactName, t2.ContactName
FROM Customers t1, Customers t2
WHERE (t1.Region IS NULL) 
	AND (t2.Region IS NULL) 
	AND (t1.CustomerID <> t2.CustomerID);
	
9.4.2
1 вариант
SELECT OrderID
FROM Orders
WHERE CustomerID IN 
	(SELECT CustomerID
	FROM Customers
	WHERE Region IS NOT NULL);
	
2 вариант
SELECT OrderID
FROM Orders
WHERE CustomerID = ANY
	(SELECT CustomerID
	FROM Customers
	WHERE Region IS NOT NULL);

	
9.4.3
SELECT OrderID
FROM Orders
WHERE Freight > ALL
	(SELECT UnitPrice
	FROM Products);