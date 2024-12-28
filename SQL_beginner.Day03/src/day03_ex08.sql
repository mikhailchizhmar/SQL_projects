WITH 
	max_id AS (
		SELECT MAX(id)
		FROM menu
	),
	piz_id AS (
		SELECT id
		FROM pizzeria
		WHERE name = 'Dominos'
	)

INSERT INTO menu
SELECT max_id.max + 1, piz_id.id, 'sicilian pizza', 900
FROM max_id, piz_id;