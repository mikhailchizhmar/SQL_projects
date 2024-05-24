/* ----- Data Definition language ----- */

CREATE DATABASE web_university;
DROP DATABASE web_university;

/* DROP TABLES */
DROP TABLE university;
DROP TABLE faculty;

/* Table creation */
CREATE TABLE university (
  id BIGINT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR (255),
  age REAL
);

CREATE TABLE faculty (
  id BIGINT PRIMARY KEY,
  university_id BIGINT,
  name VARCHAR (255),
  FOREIGN KEY (university_id) REFERENCES university(id)
);

/* Alter table */
ALTER TABLE university DROP COLUMN age;
SELECT * FROM university;
ALTER TABLE university ADD COLUMN rating INT;
SELECT * FROM university;


/* ----- Data Manipulation language ----- */

/* INSERT */
INSERT INTO university (id, name, city, rating) VALUES
    (1, 'МГТУ', 'Калуга', '78'),
    (2, 'МГУ', 'Москва', '97'),
    (3, 'ВШЭ', 'Мурманск', '83');

INSERT INTO university (id, name, city, rating) VALUES (4, 'MIT','Massachusetts', '99');
SELECT * FROM university;

INSERT INTO faculty (id, name, university_id) VALUES
    (1, 'Информационные технологии', 1),
    (2, 'Машиностроение', 1),
    (3, 'ВМК', 2),
    (4, 'Мехмат' , 2),
    (5, 'Физфак' , 2),
    (6, 'Экономика и финансы', 3);

SELECT * FROM faculty;

/* UPDATE */
UPDATE university
SET name = 'МФТИ', city = 'Долгопрудный'
WHERE id = 4;

SELECT * FROM university;

/* DELETE */
DELETE FROM university WHERE id = 4;
SELECT * FROM university;


/* ----- Data Query language ----- */

SELECT * FROM university;
SELECT * FROM university WHERE rating > 80;
SELECT * FROM university WHERE rating > 80 AND name = 'МГУ';
SELECT * FROM university WHERE name LIKE 'МГ%';
SELECT * FROM university WHERE name IN ('МГУ', 'ВШЭ');
SELECT * FROM university WHERE rating BETWEEN 70 AND 85;

/* Order BY */
SELECT name, rating FROM university
ORDER BY rating;

SELECT name, rating FROM university
ORDER BY rating DESC;

/* Join [INNER] */
SELECT * FROM university;
SELECT * FROM faculty;

SELECT *
FROM faculty AS f JOIN university AS u ON f.university_id = u.id;

/* GROUP BY */
SELECT u.name, COUNT(*) AS number_of_faculties
FROM faculty AS f JOIN university AS u ON f.university_id = u.id
GROUP BY u.id;

/* Having */
SELECT u.* , COUNT(*) AS number_of_faculties
FROM faculty AS f JOIN university AS u ON f.university_id = u.id
WHERE u.rating > 60
GROUP BY u.id
HAVING COUNT(*) >= 2
ORDER BY u.rating DESC;


/* Как мы видим SELECT запросы VS Как видит их SQL-сервер */

/* Мы:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

/* SQL-сервер:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

/*
INSERT INTO menu VALUES ((SELECT MAX(menu.id) + 1  FROM menu),
(SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
 'sicilian pizza', 900)
*/