WITH visits AS
	(
		SELECT name, COUNT(*)
		FROM person_visits pv
			JOIN
			pizzeria pz ON pv.pizzeria_id = pz.id
		GROUP BY name
	),
	orders AS
	(
		SELECT name, COUNT(*)
		FROM person_order po
			JOIN
			menu ON po.menu_id = menu.id
			JOIN
			pizzeria pz ON menu.pizzeria_id = pz.id
		GROUP BY name
	)

SELECT v.name, COALESCE(o.count, 0) + COALESCE(v.count, 0) AS total_count
FROM orders o
	RIGHT JOIN
	visits v ON o.name = v.name
ORDER BY 2 DESC, 1;