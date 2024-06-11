CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE count_of_employees INT;
BEGIN
		SELECT
			COUNT(v.id)
		INTO count_of_employees
		FROM volunteers AS v
		JOIN volunteers_departments AS vd
		ON vd.id = v.department_id
		WHERE vd.department_name = searched_volunteers_department;

		RETURN count_of_employees;
END;
$$
;