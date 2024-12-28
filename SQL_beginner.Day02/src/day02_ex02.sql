SELECT
	CASE WHEN p.name IS null THEN '-' ELSE p.name END AS person_name,
	pv.visit_date,
	CASE WHEN piz.name IS null THEN '-' ELSE piz.name END AS pizzeria_name
FROM (
	SELECT *
	FROM person_visits
	WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
	) AS pv
	RIGHT JOIN
	person p ON pv.person_id = p.id
	FULL JOIN
	pizzeria piz ON pv.pizzeria_id = piz.id
ORDER BY person_name, pv.visit_date, pizzeria_name;