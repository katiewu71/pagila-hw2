/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT special_features, count(*)
FROM (
    SELECT (unnest(special_features)) as special_features from film
) t
GROUP BY special_features
ORDER BY special_features asc;
