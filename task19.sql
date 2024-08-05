1. Найдите все отряды, у которых нет лидера.

SELECT squad_id, name
FROM Squads
WHERE leader_id IS NULL;

2. Получите список всех гномов старше 150 лет, у которых профессия
"Warrior".

SELECT dwarf_id, name
FROM Dwarves
WHERE age > 150 AND profession = 'Warrior';

3. Найдите гномов, у которых есть хотя бы один предмет типа "weapon".

SELECT DISTINCT D.dwarf_id, I.type
FROM Dwarfs D
INNER JOIN Items I
ON D.dwarf_id = I.owner_id
WHERE I.type = 'weapon';

4. Получите количество задач для каждого гнома, сгруппировав их по статусу.

SELECT D.dwarf_id, D.name, COUNT(T.task_id) AS COUNT_TASK
FROM Dwarves D
LEFT JOIN Tasks T 
ON D.dwarf_id = T.assigned_to
GROUP BY D.dwarf_id, D.name, T.status;

5. Найдите все задачи, которые были назначены гномам из отряда с именем
"Guardians".

SELECT T.task_id, T.description
FROM Tasks T
INNER JOIN Dwarves D ON D.dwarf_id = T.assigned_to
INNER JOIN Squads S ON D.squad_id = S.squad_id
WHERE S.name = 'Guardians';

6. Выведите всех гномов и их ближайших родственников, указав тип родственных
отношений.

SELECT D1.name AS dwarf, D2.name AS related_dwarf, R.relationship
FROM Relationships R
INNER JOIN Dwarves D1 ON D1.dwarf_id = R.dwarf_id
INNER JOIN Dwarves D2 ON D2.dwarf_id = R.related_to;
