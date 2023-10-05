6.3.1
SELECT ContactType,
	COUNT(ContactType) AS COUNT_OF_CONTACTS
FROM Contacts
GROUP BY ContactType;

6.3.2
SELECT CategoryID,
	AVG(UnitPrice) AS AVG_Price
FROM Products
GROUP BY CategoryID
ORDER BY AVG_Price;