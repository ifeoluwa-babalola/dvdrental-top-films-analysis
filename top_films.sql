SELECT f.title, f.release_year, f.rental_rate,
ROUND(SUM(p.amount),2) AS total_revenue,
COUNT(DISTINCT r.customer_id) AS unique_customers
FROM film AS f
INNER JOIN inventory AS i
USING(film_id)
INNER JOIN rental AS r
USING(inventory_id)
INNER JOIN payment AS p
USING(rental_id)
WHERE EXTRACT(YEAR FROM r.rental_date) = 2005
GROUP BY f.title, f.release_year, f.rental_rate
ORDER BY total_revenue DESC
LIMIT 5;
