UPDATE coaches
SET salary = salary * coach_level
WHERE
	LOWER(first_name) LIKE 'c%'
	AND (
		SELECT
			COUNT(pc.player_id)
		FROM coaches AS c
		JOIN players_coaches AS pc ON c.id = pc.coach_id
	) > 1;