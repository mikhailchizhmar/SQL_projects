SELECT name
FROM person
WHERE name = '1'
UNION
SELECT pizza_name
FROM menu
ORDER BY name DESC;