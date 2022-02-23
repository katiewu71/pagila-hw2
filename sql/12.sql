/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT t1.title 
FROM(
    SELECT title FROM (
        SELECT title, (unnest(special_features)) as feature from film
    ) t
    WHERE t.feature = 'Behind the Scenes'
) t1
INNER JOIN (
    SELECT title FROM (
        SELECT title, (unnest(special_features)) as feature from film
    ) t2
    WHERE t2.feature = 'Trailers'
) t3 on t1.title = t3.title
ORDER BY t1.title;
