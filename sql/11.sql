/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT first_name, last_name, special_features
    FROM actor
    INNER JOIN film_actor on film_actor.actor_id = actor.actor_id
    INNER JOIN (
        SELECT film_id, (unnest(special_features)) as special_features from film
    ) t on t.film_id = film_actor.film_id
) t2
WHERE special_features='Behind the Scenes'
ORDER BY "Actor Name";
