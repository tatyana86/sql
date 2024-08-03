1. Получить информацию о всех гномах, которые входят в какой-либо отряд,
вместе с информацией об их отрядах.

SELECT Dwarves.*, Squads.*
FROM Dwarves
INNER JOIN Squads
ON Dwarves.squad_id = Squads.squad_id; 

2. Найти всех гномов с профессией "miner", которые не состоят ни в одном
отряде.

SELECT * FROM Dwarves 
WHERE (profession = 'miner') AND (squad_id IS NULL);

3. Получить все задачи с наивысшим приоритетом, которые находятся в статусе
"pending".

SELECT * FROM Tasks
WHERE (priority = (SELECT MAX(priority FROM Tasks WHERE status = 'pending'))
	AND (status = 'pending');

4. Для каждого гнома, который владеет хотя бы одним предметом, получить
количество предметов, которыми он владеет.

SELECT owner_id, COUNT(item_id)
FROM Items
WHERE owner_id IS NOT NULL
GROUP BY owner_id;

5. Получить список всех отрядов и количество гномов в каждом отряде. Также
включите в выдачу отряды без гномов.

SELECT Squads.squad_id, COUNT(Dwarves.dwarf_id)
FROM Squads
LEFT JOIN Dwarves ON Squads.squad_id = Dwarves.squad_id
GROUP BY Squads.squad_id;

6. Получить список профессий с наибольшим количеством незавершённых задач
("pending" и "in_progress") у гномов этих профессий.

SELECT Dwarves.profession, COUNT(Tasks.task_id)
FROM Dwarves
INNER JOIN Tasks ON Dwarves.dwarf_id = Tasks.assigned_to
WHERE Tasks.status IN ('pending', 'in_progress')
GROUP BY Dwarves.profession
HAVING COUNT(Tasks.task_id) = (
	SELECT MAX(task_count)
	FROM (
		SELECT COUNT(Tasks.task_id) AS task_count
		FROM Dwarves
		INNER JOIN Tasks ON Dwarves.dwarf_id = Tasks.assigned_to
		WHERE Tasks.status IN ('pending', 'in_progress')
		GROUP BY Dwarves.profession
	) AS subquery
);

7. Для каждого типа предметов узнать средний возраст гномов, владеющих этими
предметами.

SELECT Items.type, AVG(Dwarves.age)
FROM Items
INNER JOIN Dwarves ON Items.owner_id = Dwarves.dwarf_id;
GROUP BY Items.type;


8. Найти всех гномов старше среднего возраста (по всем гномам в базе),
которые не владеют никакими предметами.

SELECT * FROM Dwarves
WHERE (age > (SELECT AVG(age) FROM Dwarves))
	AND dwarf_id NOT IN (SELECT owner_id FROM Items WHERE owner_id IS NOT NULL);
