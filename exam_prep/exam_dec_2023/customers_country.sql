CREATE OR REPLACE PROCEDURE sp_customer_country_name(
	 IN customer_full_name VARCHAR(50),
	 OUT country_name VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	WITH temp_table AS (
		SELECT
			CONCAT(c.first_name, ' ', c.last_name) AS full_name,
			cou.name AS country_name
		FROM
			customers AS c
		JOIN
			countries AS cou ON c.country_id = cou.id

	)

	SELECT
		tt.country_name
	INTO
		country_name
	FROM
		temp_table AS tt
	WHERE
		full_name = customer_full_name;
END;
$$;

CALL sp_customer_country_name('Betty Wallace', '')