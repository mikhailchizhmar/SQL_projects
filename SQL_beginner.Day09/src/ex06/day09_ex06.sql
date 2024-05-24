CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
															  pprice NUMERIC DEFAULT 500,
															  pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(name VARCHAR) AS $$
BEGIN
RETURN QUERY
	SELECT piz.name
	FROM person p
		JOIN
		person_visits pv ON p.id = pv.person_id
		JOIN
		pizzeria piz ON pv.pizzeria_id = piz.id
	WHERE p.name = pperson AND visit_date = pdate
	INTERSECT
	SELECT piz.name
	FROM menu m
		JOIN
		pizzeria piz ON m.pizzeria_id = piz.id
	WHERE price < pprice;
END;
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');