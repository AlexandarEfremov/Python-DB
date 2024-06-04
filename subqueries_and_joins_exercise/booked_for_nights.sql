SELECT
	CONCAT(a.address, ' ', a.address_2) AS apartment_address,
	b.booked_for AS nights
FROM apartments AS a
INNER JOIN bookings AS b
ON a.booking_id = b.booking_id
ORDER BY a.apartment_id
;