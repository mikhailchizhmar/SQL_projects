(SELECT name, COUNT(*), 'visit' AS action_type
 FROM person_visits pv
 	JOIN
 	pizzeria pz ON pv.pizzeria_id = pz.id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3
 )
UNION
(SELECT name, COUNT(*), 'order' AS action_type
 FROM person_order po
 	JOIN
 	menu ON po.menu_id = menu.id
 	JOIN
 	pizzeria pz ON menu.pizzeria_id = pz.id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3
 )
ORDER BY 3, 2 DESC;