SELECT
	t.town_id,
	t.name AS town_name,
	a.address_text
FROM
	towns AS t
JOIN
	addresses AS a
ON
	t.town_id = a.town_id
WHERE
	t.name LIKE 'Sofia' OR t.name LIKE 'San Francisco' OR t.name LIKE 'Carnation'
ORDER BY
	town_id, address_text
;