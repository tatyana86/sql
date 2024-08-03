12.3.1
INSERT INTO Employees (LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region, PostalCode, Country, HomePhone, Extension)
VALUES ('Vinogradov', 'Artem', 'Inside Sales Coordinator', 'Mr.', 1980-05-01, 2000-03-14, '100 Street', 'Samara', 'Volga', 'Russia', 66-67-68, 4562);

12.3.2
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(10, 27511);

12.3.3
При добавлении записи:
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, Freight)
VALUES ('SMRRG', 10, 2000-08-04, 30.5);

возникает ошибка: 
Сообщение 547, уровень 16, состояние 0, строка 1
Конфликт инструкции INSERT с ограничением FOREIGN KEY "FK_Orders_Customers". Конфликт произошел в базе данных "northwnd", таблица "dbo.Customers", column 'CustomerID'.

Предполагаю, что так происходит, потому что значение CustomerID должно впервые задаваться в таблице, в которой данное поле является PK - то есть в таблице Customers.
В таблицу Orders данное поле является FK, поэтому не может быть впервые задано. 
В то же время можно добавлять заказы с уже созданными CustomerID в таблице Customers.

Рефлексия:
В задании 11.5.2 отсутствует сортировка по типу.
