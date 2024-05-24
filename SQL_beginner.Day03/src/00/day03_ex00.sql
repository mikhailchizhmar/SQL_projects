SELECT
	menu.pizza_name,
	menu.price,
	piz.name AS pizzeria_name,
	pv.visit_date
FROM person_visits pv
	JOIN
	person p ON pv.person_id = p.id
	JOIN
	pizzeria piz ON pv.pizzeria_id = piz.id
	JOIN
	menu ON pv.pizzeria_id = menu.pizzeria_id
WHERE p.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;