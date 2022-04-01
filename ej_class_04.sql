SELECT title, special_features FROM film
WHERE rating LIKE "%PG-13%";

SELECT DISTINCT length FROM film;

SELECT title, rental_rate, replacement_cost FROM film
WHERE replacement_cost BETWEEN 20.00 and 24.00;

SELECT f.title, c.name AS "category", f.rating FROM film_category fc
JOIN film f ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE f.special_features LIKE "%Behind the Scenes%";

SELECT a.first_name, a.last_name FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title LIKE "%ZOOLANDER FICTION%";

SELECT a.address, ci.city, co.country FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE s.store_id = 1;

SELECT rating FROM film
GROUP BY rating;

SELECT f.title, f.description, sta.first_name, sta.last_name FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
JOIN staff sta ON s.manager_staff_id = sta.staff_id
WHERE s.store_id = 2;