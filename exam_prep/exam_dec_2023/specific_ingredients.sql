SELECT
	i.name,
	p.name,
	d.name
FROM
	ingredients AS i
JOIN
	products_ingredients AS pi ON i.id = pi.ingredient_id
JOIN
	products AS p ON p.id = pi.product_id
JOIN
	distributors AS d ON d.id = i.distributor_id
WHERE
	LOWER(i.name) LIKE '%mustard%'
	AND d.country_id = 16
ORDER BY
	p.name
;