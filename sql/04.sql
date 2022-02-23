/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT title 
FROM (
    SELECT title, count(*) as rental_freq
    FROM rental
    INNER JOIN inventory on inventory.inventory_id = rental.inventory_id
    INNER JOIN film on film.film_id = inventory.film_id
    WHERE customer_id = 1
    GROUP BY title
) t
WHERE rental_freq > 1;
