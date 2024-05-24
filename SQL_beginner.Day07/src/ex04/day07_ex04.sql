SELECT name, COUNT(*) AS count_of_visits
FROM person_visits pv
	JOIN
	person p ON pv.person_id = p.id
GROUP BY name
HAVING COUNT(*) > 3;