SELECT p.name
FROM person_order po
	JOIN
	person p ON po.person_id = p.id
	JOIN
	menu m ON po.menu_id = m.id
WHERE p.gender = 'male' AND p.address IN ('Moscow', 'Samara')
	AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC;