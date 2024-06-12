CREATE OR REPLACE FUNCTION fn_courses_by_client(
	phone_num VARCHAR(20)
)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE amount_of_courses INT;
BEGIN
	SELECT
	COUNT(cou.id)
	INTO amount_of_courses
	FROM
		clients AS c
	JOIN
		courses AS cou ON c.id = cou.client_id
	WHERE
		c.phone_number = phone_num;
	RETURN amount_of_courses;
END;
$$
;