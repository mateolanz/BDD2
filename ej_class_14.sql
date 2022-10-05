/* 1. Write a query that gets all the customers that live in Argentina. Show the first and last name in one column, the address and the city.*/

SELECT
CONCAT(c.first_name, ' ', c.last_name) AS 'Name', ad.address, ci.city
FROM customer c

INNER JOIN store sto USING(store_id)
INNER JOIN address ad ON sto.address_id = ad.address_id
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id)
WHERE co.country = 'Canada';



/* 2. Write a query that shows the film title, language and rating. 
Rating shall be shown as the full text described here: https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States. 
Hint: use case.*/

SELECT f.title, l.name, f.rating,
CASE
    WHEN f.rating LIKE 'G' THEN 'All ages admitted'
    WHEN f.rating LIKE 'PG' THEN 'Some material may not be suitable for children'
    WHEN f.rating LIKE 'PG-13' THEN 'Some material may be inappropriate for children under 13'
    WHEN f.rating LIKE 'R' THEN 'Under 17 requires accompanying parent or adult guardian'
    WHEN f.rating LIKE 'NC-17' THEN 'No one 17 and under admitted'
END 'Rating Text'
FROM film f

INNER JOIN language l USING(language_id);



/*3. Write a search query that shows all the films (title and release year) an actor was part of.
Assume the actor comes from a text box introduced by hand from a web page.
Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.*/

SELECT  CONCAT(ac.first_name, ' ', ac.last_name) AS 'actor', f.title AS 'film', f.release_year AS 'release_year'
FROM film f

INNER JOIN film_actor USING(film_id)
INNER JOIN actor ac USING(actor_id)
WHERE CONCAT(first_name, ' ', last_name) LIKE TRIM(UPPER('AUDREY BAILEY'));



/*4. Find all the rentals done in the months of May and June. Show the film title, customer name and if it was returned or not.
There should be returned column with two possible values 'Yes' and 'No'.*/

SELECT  f.title, r.rental_date, c.first_name AS 'customer_name',
CASE
    WHEN r.return_date IS NOT NULL THEN 'Yes'
    ELSE 'No'
END 'Returned'
FROM rental r

INNER JOIN inventory i USING(inventory_id)
INNER JOIN film f USING(film_id)
INNER JOIN customer c USING(customer_id)
WHERE MONTH(r.rental_date) = '05' OR MONTH(r.rental_date) = '06'

ORDER BY r.rental_date;



/*5. Investigate CAST and CONVERT functions. Explain the differences if any, write examples based on sakila DB.

CAST() and CONVERT() function converts a value (of any type) into a specified datatype.

- CONVERT is SQL Server specific, CAST is ANSI. CONVERT is more flexible in that you can format dates etc.

Examples:
*/
SELECT CAST('2022-03-10 04:20:00' AS datetime); 

SELECT CONVERT(varchar, '2001-09-11', 101);



/*. Investigate NVL, ISNULL, IFNULL, COALESCE, etc type of function. Explain what they do. Which ones are not in MySql and write usage examples.

All the functions above (NVL, ISNULL, IFNULL, COALCE) let you return an alternative value if an expression is NULL.
The difference is that each of them are used in different DBMS (Examples: MySQL, SQL Server, Oracle...)
In MySQL, we only have IFNULL and COALESCE. Thus, NVL and ISNULL are not in MySQL
Examples of usage:*/

SELECT address_id, address, IFNULL(address2, "Alternative value") FROM address LIMIT 10;

SELECT address_id, address, COALESCE(address2, "Alternative value") FROM address LIMIT 10;
