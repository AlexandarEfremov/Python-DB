UPDATE products
SET price = price * 1.1
WHERE
	id IN (
			SELECT
				p.id
			FROM products AS p
			JOIN feedbacks AS fb ON p.id = fb.product_id
			WHERE fb.rate  > 8
		  )
;