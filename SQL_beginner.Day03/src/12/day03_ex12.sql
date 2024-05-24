INSERT INTO person_order
SELECT generate_series((SELECT MAX(id) FROM person_order) + 1,
                        (SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person)),
       generate_series((SELECT MIN(id) FROM person),
				        (SELECT COUNT(*) FROM person)),
       (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza'),
       '2022-02-25';