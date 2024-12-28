SELECT name
FROM (
	(
		SELECT piz.name, COUNT(*)
		FROM person_visits pv
			JOIN
			person p ON pv.person_id = p.id
			JOIN
			pizzeria piz ON pv.pizzeria_id = piz.id
		WHERE gender = 'female'
		GROUP BY piz.name
	)
	EXCEPT ALL
	(
		SELECT piz.name, COUNT(*)
		FROM person_visits pv
			JOIN
			person p ON pv.person_id = p.id
			JOIN
			pizzeria piz ON pv.pizzeria_id = piz.id
		WHERE gender = 'male'
		GROUP BY piz.name
	)
)
ORDER BY 1;