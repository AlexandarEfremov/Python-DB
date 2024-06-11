DELETE FROM clients
WHERE id IN(
		SELECT
			clients.id
		FROM clients
		LEFT JOIN courses ON clients.id = courses.client_id
		WHERE courses.id IS NULL
	) AND

	LENGTH(full_name) > 3
;