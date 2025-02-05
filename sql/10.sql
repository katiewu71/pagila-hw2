/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */
SELECT special_feature, sum(profit) as profit
FROM (
SELECT title, sum(amount) as profit, unnest(special_features) as special_feature
FROM payment
INNER JOIN rental on payment.rental_id = rental.rental_id
INNER JOIN inventory on inventory.inventory_id = rental.inventory_id
INNER JOIN film on film.film_id = inventory.film_id
GROUP BY title,special_feature
ORDER BY profit desc
) t
GROUP BY special_feature
ORDER BY special_feature asc;
