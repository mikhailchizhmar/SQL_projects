SELECT id AS object_id, name AS object_name
FROM (
	SELECT id, name FROM person
	UNION ALL
	SELECT id, pizza_name name FROM menu
)
ORDER BY id, name;