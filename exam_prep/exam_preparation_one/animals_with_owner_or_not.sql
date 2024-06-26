CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
	OUT result VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	SELECT
		o.name
	INTO result
	FROM owners AS o
	JOIN animals AS a ON o.id = a.owner_id
	WHERE a.name = animal_name;

    IF result IS NULL THEN result := 'For adoption';
    END IF;
END;
$$;