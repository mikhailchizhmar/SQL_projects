WITH s AS (
	SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date
	),
	pv AS (
		SELECT DISTINCT visit_date
		FROM person_visits
		WHERE person_id = 1 OR person_id = 2
	)

SELECT s.generate_series AS missing_date
FROM 
	s LEFT JOIN pv ON s.generate_series = pv.visit_date
WHERE pv.visit_date IS null;