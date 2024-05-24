WITH women AS (
	SELECT p.name, m.pizza_name
	FROM person_order po
		JOIN
		person p ON po.person_id = p.id
		JOIN
		menu m ON po.menu_id = m.id
	WHERE p.gender = 'female'
	)

(
	SELECT women.name
	FROM women
	WHERE women.pizza_name = 'pepperoni pizza'
)
INTERSECT
(
	SELECT women.name
	FROM women
	WHERE women.pizza_name = 'cheese pizza'
)
ORDER BY 1;