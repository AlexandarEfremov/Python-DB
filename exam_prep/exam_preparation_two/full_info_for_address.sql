CREATE TABLE search_results (
	id SERIAL PRIMARY KEY,
	address_name VARCHAR(50),
	full_name VARCHAR(100),
	level_of_bill VARCHAR(20),
	make VARCHAR(30),
	condition CHAR(1),
	category_name VARCHAR(50)
	);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
	address_name VARCHAR(100)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	TRUNCATE search_results;
	INSERT INTO search_results(
		address_name,
		full_name,
		level_of_bill,
		make,
		condition,
		category_name
	)

	SELECT
		a.name,
		cl.full_name,
		CASE
			WHEN cou.bill <= 20 THEN 'Low'
			WHEN cou.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END AS level_of_bill,
		ca.make,
		ca.condition,
		cat.name
	FROM
		addresses AS a
	JOIN courses AS cou ON a.id = cou.from_address_id
	JOIN clients AS cl ON cl.id = cou.client_id
	JOIN cars AS ca ON ca.id = cou.car_id
	JOIN categories AS cat ON cat.id = ca.category_id
	WHERE a.name = address_name
	ORDER BY
		ca.make,
		cl.full_name;
END;
$$;
