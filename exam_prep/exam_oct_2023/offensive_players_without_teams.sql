SELECT
	p.id,
	CONCAT(first_name, ' ', last_name) AS full_name,
	age,
	position,
	salary,
	sd.pace,
	sd.shooting
FROM
	players AS p
JOIN
	skills_data AS sd ON p.skills_data_id = sd.id
LEFT JOIN
	teams AS t ON p.team_id = t.id
WHERE
	position = 'A'
	AND p.team_id IS NULL
	AND sd.pace + sd.shooting > 130
;