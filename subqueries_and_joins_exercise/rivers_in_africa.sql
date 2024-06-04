SELECT
	c.country_name,
	r.river_name
FROM
	countries AS c
FULL JOIN
	countries_rivers AS cr
	USING(country_code)
FULL JOIN
	rivers AS r
	ON cr.river_id = r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5