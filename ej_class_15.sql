/*1*/
CREATE OR REPLACE VIEW list_of_customers AS
SELECT c.customer_id, CONCAT(c.last_name, ', ', c.first_name), a.address, a.postal_code, a.phone, ci.city, co.country,
CASE
WHEN c.active = 1 THEN 'active'
ELSE 'inactive'
END AS status

FROM customer c
INNER JOIN address a USING(address_id)
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id);


 
/*2*/
CREATE OR REPLACE VIEW film_details AS
SELECT f.film_id, f.title, f.description, f.rental_rate, f.`length`, f.rating, GROUP_CONCAT(CONCAT_WS(" ", a.first_name, a.last_name) SEPARATOR ",") AS actors

FROM film f 
INNER JOIN film_category fc USING(film_id)
INNER JOIN category c USING(category_id)
INNER JOIN film_actor fa USING(film_id)
INNER JOIN actor a USING(actor_id)
GROUP BY film_id;



/*3*/
CREATE OR REPLACE VIEW sales_by_film_category AS
SELECT DISTINCT c.name, SUM(p.amount) as total_rental

FROM category c
INNER JOIN film_category fc USING(category_id)
INNER JOIN film f USING(film_id)
INNER JOIN inventory i USING(film_id)
INNER JOIN rental r USING(inventory_id)
INNER JOIN payment p USING(rental_id)
GROUP BY c.name;



/*4*/
CREATE OR REPLACE VIEW actor_information AS
SELECT a.actor_id, CONCAT(a.first_name, " ", a.last_name), (SELECT COUNT(f.film_id)

FROM film f
INNER JOIN film_actor fa USING(film_id)
INNER JOIN actor a2 USING(actor_id)
WHERE a2.actor_id = a.actor_id) AS 'amount of films he/she acted on'
FROM actor a;



/*5 Analyze view actor_info, explain the entire query and specially how the sub query works.
	Be very specific, take some time and decompose each part and give an explanation for each.
TO DO
*/

/*6 Materialized views, write a description, why they are used, alternatives, DBMS were they exist, etc.
TO DO
*/
