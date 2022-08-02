#4) Find all the film titles that are not in the inventory.
SELECT title
FROM film
WHERE film_id 
NOT IN (SELECT film.film_id
FROM film
INNER JOIN inventory using(film_id));

#5) Find all the films that are in the inventory but were never rented.
# -Show title and inventory_id.
# -This exercise is complicated.
# -hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null

SELECT DISTINCT title, i.inventory_id
FROM inventory i
INNER JOIN film f using(film_id)
WHERE f.film_id NOT IN (SELECT f.film_id
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id);

#6) Generate a report with:
# -customer (first, last) name, store id, film title,
# -when the film was rented and returned for each of these customers
# -order by store_id, customer last_name

SELECT first_name, last_name, s.store_id, title, rental_date, return_date
FROM rental r
INNER JOIN customer c using(customer_id) #on r.customer_id = c.customer_id
INNER JOIN store s using(store_id) #on c.store_id = s.store_id
INNER JOIN inventory i using(inventory_id) #on r.inventory_id = i.inventory_id
INNER JOIN film f using(film_id) #on i.film_id = f.film_id
ORDER BY store_id, last_name;

#7) Show sales per store (money of rented films)
# -show stores city, country, manager info and total sales (money)
# -(optional) Use concat to show city and country and manager first and last name

SELECT DISTINCT str.store_id, city, country,
CONCAT(first_name, " ", last_name) AS manager,
(SELECT sum(amount)
FROM payment p 
WHERE p.staff_id = str.manager_staff_id) AS "Listado de pagos"
FROM staff stf
INNER JOIN store str ON stf.staff_id = str.manager_staff_id
INNER JOIN address a ON str.address_id = a.address_id
INNER JOIN city using(city_id)
INNER JOIN country using(country_id);


#8)Which actor has appeared in the most films?
SELECT first_name, last_name, COUNT(fa.film_id) AS films_acted
FROM actor 
INNER JOIN film_actor fa using(actor_id)
GROUP BY fa.actor_id
GROUP BY films_acted DESC
LIMIT 1;
