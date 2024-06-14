SELECT
	CONCAT(first_name, ' ', last_name) AS full_name,
	age,
	hire_date
FROM
	players
WHERE
	LOWER(first_name) LIKE 'm%'
ORDER BY
	age DESC,
	full_name
;