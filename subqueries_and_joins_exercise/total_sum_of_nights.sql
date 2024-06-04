SELECT
	name,
	SUM(b.booked_for)
FROM
	apartments
JOIN
	bookings AS b
	USING(apartment_id)
GROUP BY
	name
ORDER BY
	name