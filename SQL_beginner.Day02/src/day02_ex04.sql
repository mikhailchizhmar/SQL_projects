SELECT pizza_name, piz.name AS pizzeria_name, price
FROM (
	SELECT *
	FROM menu
	WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
	) AS m
	JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
ORDER BY 1, 2;