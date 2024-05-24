SELECT name AS object_name
FROM (
	(
		SELECT id, name
		FROM person
		ORDER BY name
	)
	UNION ALL
	(
		SELECT id, pizza_name name
		FROM menu
		ORDER BY pizza_name
	)
);