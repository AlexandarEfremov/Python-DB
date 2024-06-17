SELECT
	p.name AS product_name,
	ROUND(AVG(p.price), 2) AS average_price,
	COUNT(fb.id) AS total_feedbacks
FROM
	products AS p
JOIN
	feedbacks AS fb ON p.id = fb.product_id
WHERE
	p.price > 15
GROUP BY
	p.name
HAVING
	COUNT(fb.id) > 1
ORDER BY
	total_feedbacks,
	average_price DESC
;