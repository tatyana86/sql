// Так как PK в созданных таблицах представляют собой числа, 
// то для данных полей созданы кластерные индексы:
USE MyTest
CREATE CLUSTERED INDEX PK_Region ON Region (RegionID); 
CREATE CLUSTERED INDEX PK_Territories ON Territories (TerritoryID);

// Пример некластерного индекса:
CREATE INDEX idxTerritoryIDAndTerritoryDescription ON Territories (TerritoryID, TerritoryDescription);