UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar'
;

INSERT INTO monasteries(monastery_name, country_code)
VALUES
	('Hanga Abbey', (SELECT country_code FROM countries WHERE country_name = 'Tanzania')),
    ('Myin-Tin-Daik', (SELECT country_code FROM countries WHERE country_name = 'Myanmar'))
;

SELECT
	c.continent_name,
	cou.country_name,
	COUNT(m.id) AS monasteries_count
FROM
	countries AS cou
LEFT JOIN
	continents AS c
	USING(continent_code)
LEFT JOIN
	monasteries AS m
	USING(country_code)
WHERE NOT cou.three_rivers
GROUP BY
	c.continent_name, cou.country_name
ORDER BY
	COUNT(m.id) DESC,
	cou.country_name
;