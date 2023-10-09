10.4.1
SELECT Products.ProductName, [Order Details].UnitPrice
FROM Products
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
	AND [Order Details].UnitPrice < 20;
	
10.4.2
Результат с FULL JOIN получился объемнее, чем с INNER JOIN, так как появились записи, которе не входят одновременно в обе таблицы (Orders и Customers) на основании условия Orders.CustomerID = Customers.CustomerID. То есть те записи, для которых нет пересечения.
В данном случае в таблице Customers есть две записи (два клиента), которые не встречаются в таблице Orders, что означает, что у данных клиентов нет текущих заказов, поэтому поле Freight = NULL.

10.4.3
Как мне кажется, CROSS JOIN можно "сравнить" с отношением многие-ко-многим. Тогда INNER JOIN соответствует один-к-одному. Таким образом, необходимо, чтобы записи одной таблицы соответствовала лишь одна запись другой таблицы. Это возможно при наличии внешних ключей в одной из таблицы.

В уроке был приведен запрос:	
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID;

Чтобы записать его через CROSS JOIN и WHERE, формально нужно поместить условие в ON в WHERE:
SELECT Products.ProductName, Categories.CategoryName
FROM Products
CROSS JOIN Categories
WHERE Products.CategoryID = Categories.CategoryID;
	
10.4.4
SELECT Products.ProductName, [Order Details].UnitPrice
FROM Products INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID

Рефлексия:
В эталонном решении представлен альтернативный вариант решения 9.4.2 с использованием EXISTS.