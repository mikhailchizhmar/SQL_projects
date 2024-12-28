SELECT visit_date AS action_date, (
	SELECT name
	FROM person
	WHERE id = person_id
) AS person_name
FROM (
	SELECT visit_date, person_id
	FROM person_visits
	INTERSECT
	SELECT order_date, person_id
	FROM person_order
)
ORDER BY action_date, person_name DESC;