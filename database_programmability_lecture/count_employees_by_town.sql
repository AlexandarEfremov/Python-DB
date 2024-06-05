CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name TEXT)
RETURNS INT
AS
$$
	DECLARE
		my_count INT;
	BEGIN
		SELECT COUNT(e.employee_id) INTO my_count
		FROM employees AS e
		JOIN addresses AS a ON e.address_id = a.address_id
		JOIN towns AS t ON a.town_id = t.town_id
		WHERE t.name = town_name;

		RETURN my_count;
	END;
$$ LANGUAGE plpgsql;