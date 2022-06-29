SELECT co.country, COUNT(*) AS amount_of_cities
FROM city ci
JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country, co.country_id
ORDER BY co.country_id

