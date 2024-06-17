CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
RETURNS TABLE(
	customer_id INT,
	customer_name VARCHAR(75),
	feedback_description VARCHAR(255),
	feedback_rate numeric(4, 2)
)
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN QUERY
	SELECT
	c.id AS customer_id,
	c.first_name AS customer_name,
	fb.description AS feedback_description,
	fb.rate AS feedback_rate
	FROM
		customers AS c
	JOIN
		feedbacks AS fb ON c.id = fb.customer_id
	JOIN
		products AS p ON fb.product_id = p.id
	WHERE
		p.name = product_name
	ORDER BY
		customer_id;
END;
$$
;

SELECT * FROM fn_feedbacks_for_product('Bread');
