15.7 
// создание таблицы
USE MyTest
CREATE TABLE Territories ( 
    TerritoryID int NOT NULL, 
	TerritoryDescription nchar(50) NOT NULL,
	RegionID int NOT NULL);
	
// добавление записей в таблицы
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
   VALUES (01581, 'Westboro', 1), (03049, 'Hollis', 3), (60601, 'Chicago', 2);
   
INSERT INTO Region (RegionID, RegionDescription)
   VALUES (1, 'Eastern'), (2, 'Western'), (3, 'Northern'), (4, 'Southern');
   
// далее использовала графический интерфейс. 
// сначала определила PK для таблицы Region;
// затем создала FK в таблице Territories с ссылкой на PK таблицы Region.
// не знаю, как лаконично записать это в коде запросов, 
// пока приведу варианты скриптов, предлагаемых в граф. среде

// скрипт для создания PK:
ALTER TABLE [dbo].[Region] DROP CONSTRAINT [PK_Region] WITH ( ONLINE = OFF );

// скрипт для создания FK:
ALTER TABLE [dbo].[Territories] DROP CONSTRAINT [FK_Territories_Region];

