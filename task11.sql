11.5.1
SELECT * FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;  

11.5.2
SELECT 'Customer' As Type, ContactName, City, Country FROM Customers 
UNION 
SELECT 'Supplier' As Type, ContactName, City, Country FROM Suppliers;