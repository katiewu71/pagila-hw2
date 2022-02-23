/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT customer.customer_id 
FROM film 
INNER JOIN inventory on film.film_id = inventory.film_id
INNER JOIN rental on rental.inventory_id = inventory.inventory_id
INNER JOIN customer on customer.customer_id = rental.customer_id
WHERE film.film_id IN (
    SELECT film.film_id
    FROM payment
    INNER JOIN rental on payment.rental_id = rental.rental_id
    INNER JOIN inventory on inventory.inventory_id = rental.inventory_id
    INNER JOIN film on film.film_id = inventory.film_id
    GROUP BY film.film_id
    ORDER BY sum(amount) desc
    LIMIT 5
)
ORDER BY customer.customer_id asc;
