/*1*/
SELECT *
FROM address a
WHERE postal_code BETWEEN 1000 and 50000;
SELECT *
FROM address a 
	INNER JOIN city c USING(city_id)
	INNER JOIN country c2 USING(country_id)
WHERE postal_code like '%13%';
CREATE INDEX postalCode ON address(postal_code);
show index from address;
DROP INDEX postalCode ON address;

/*2*/
SHOW INDEX FROM actor;
SELECT a.first_name 
FROM actor a
ORDER BY a.first_name DESC;/*4ms */
SELECT a2.last_name
FROM actor a2
ORDER BY a2.last_name DESC;/*2ms */


/*3*/

SELECT f.description
FROM film f
WHERE f.description LIKE '%Documentary%';
SHOW INDEX FROM film;
CREATE FULLTEXT INDEX desc_index ON film(description);
SELECT f.description 
FROM film f 
WHERE MATCH(f.description) AGAINST('%Documentary%');
