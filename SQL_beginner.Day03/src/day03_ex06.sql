WITH piz AS (
	SELECT pizzeria.id, pizza_name, name, price
	FROM menu
		JOIN
		pizzeria ON menu.pizzeria_id = pizzeria.id
	)

SELECT
	p1.pizza_name,
	p1.name AS pizzeria_name_1,
	p2.name AS pizzeria_name_2,
	p1.price
FROM piz p1, piz p2
WHERE p1.pizza_name = p2.pizza_name
	AND p1.price = p2.price
	AND p1.name != p2.name
	AND p1.id > p2.id
ORDER BY 1;