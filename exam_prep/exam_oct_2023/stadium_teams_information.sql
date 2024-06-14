CREATE OR REPLACE FUNCTION  fn_stadium_team_name(
	stadium_name VARCHAR(30)
)
RETURNS TABLE (team_name VARCHAR(50))
LANGUAGE plpgsql
AS
$$
BEGIN
	RETURN QUERY
	SELECT
		t.name
	FROM
		teams AS t
	JOIN
		stadiums AS s ON t.stadium_id = s.id
	WHERE
		t.stadium_id IN (SELECT id FROM stadiums WHERE name = stadium_name)
	ORDER BY
		t.name;
END;
$$;

SELECT fn_stadium_team_name('Jaxworks')

