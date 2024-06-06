CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR(50))
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE employees AS e
    SET salary = salary * 1.05
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE name = department_name
    );
END;
$$;