(
	SELECT piz.name AS pizzeria_name
	FROM person_visits pv
		JOIN
		person p ON pv.person_id = p.id
		JOIN
		pizzeria piz ON pv.pizzeria_id = piz.id
	WHERE p.name = 'Andrey'
)
EXCEPT
(
	SELECT piz.name
	FROM person_order po
		JOIN
		person p ON po.person_id = p.id
		JOIN
		menu ON po.menu_id = menu.id
		JOIN
		pizzeria piz ON menu.pizzeria_id = piz.id
	WHERE p.name = 'Andrey'
);