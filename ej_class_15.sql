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
FROM film f 
INNER JOIN film_category fc USING(film_id)
INNER JOIN category c USING(category_id)
INNER JOIN film_actor fa USING(film_id)
INNER JOIN actor a USING(actor_id)
GROUP BY film_id;
