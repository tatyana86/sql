13.3.1
UPDATE [Order Details]
SET Discount = 0.2
WHERE Quantity > 50;

13.3.2
UPDATE Contacts
SET City = 'Piter', Country = 'Russia'
WHERE City = 'Berlin' AND Country = 'Germany';

13.3.3
INSERT INTO Shippers (CompanyName, Phone)
VALUES('TestName1', 5050);

INSERT INTO Shippers (CompanyName, Phone)
VALUES('TestName2', 6060);

INSERT INTO Shippers (CompanyName, Phone)
VALUES('TestName3', 7070);

DELETE FROM Shippers
WHERE ShipperID IN (4, 5, 6);

Рефлексия:
В комментарии к заданию 12.3.3 ушла немного в другую сторону. В эталонном решении отмечено, что товары в добавленном заказе отсутствуют так как не сформирована связь в таблице Order Details.