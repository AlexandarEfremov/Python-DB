SELECT
	COUNT(customer_id)
FROM
	bookings AS b
JOIN
	customers AS c
	USING(customer_id)
WHERE last_name LIKE '%Hahn%'