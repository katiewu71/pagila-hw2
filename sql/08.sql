/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title 
FROM (
    SELECT title,rating, (unnest(special_features)) as feature from film
) t
WHERE rating = 'G' and feature = 'Trailers';

