SELECT
	e.employee_id,
	CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	p.project_id,
	p.name AS project_name
FROM
	employees AS e
JOIN
	employees_projects ON e.employee_id = employees_projects.employee_id
JOIN
	projects AS p ON p.project_id = employees_projects.project_id
WHERE p.project_id = 1
;