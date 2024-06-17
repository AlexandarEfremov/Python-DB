SELECT
	d.name AS distributor_name,
	i.name AS ingredient_name,
	p.name AS product_name,
	AVG(fb.rate) AS average_rate
FROM
	distributors AS d
JOIN
	ingredients AS i ON i.distributor_id = d.id
JOIN
	products_ingredients AS pi ON i.id = pi.ingredient_id
JOIN
	products AS p ON p.id = pi.product_id
LEFT JOIN
	feedbacks AS fb ON fb.product_id = p.id
GROUP BY
	distributor_name,
	ingredient_name,
	product_name
HAVING
	AVG(fb.rate) >= 5
	AND
	AVG(fb.rate) <= 8
ORDER BY
	distributor_name,
	ingredient_name,
	product_name