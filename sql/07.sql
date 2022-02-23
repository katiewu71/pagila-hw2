/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

SELECT DISTINCT title 
FROM inventory INNER JOIN film using (film_id)
WHERE film.film_id NOT IN (
    SELECT DISTINCT inventory.film_id
    FROM inventory
    JOIN rental using (inventory_id)
    JOIN customer using (customer_id)
    JOIN address using (address_id)
    JOIN city using (city_id)
    JOIN country using(country_id)
    WHERE country.country='United States')
ORDER BY title;
