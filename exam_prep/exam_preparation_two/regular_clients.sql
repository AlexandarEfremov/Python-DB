SELECT
	c.full_name,
	COUNT(cou.car_id) AS count_of_cars,
	SUM(cou.bill) AS total_bill
FROM
	clients AS c
JOIN
	courses AS cou ON c.id = cou.client_id
GROUP BY
	c.full_name
HAVING
	COUNT(cou.car_id) > 1
	AND SUBSTRING(c.full_name FROM 2 FOR 1) = 'a'
ORDER BY
	c.full_name