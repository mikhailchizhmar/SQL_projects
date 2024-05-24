WITH
	max_id AS (
		SELECT MAX(id) + 1 AS id
		FROM person_visits
	),
	p_id AS (
		SELECT id
		FROM person
		WHERE name = 'Dmitriy'
	),
	piz_id AS (
		SELECT id
		FROM pizzeria
		WHERE name = 'Best Pizza'
	)

INSERT INTO person_visits
	SELECT max_id.id, p_id.id, piz_id.id, '2022-01-08'
	FROM max_id, p_id, piz_id;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;