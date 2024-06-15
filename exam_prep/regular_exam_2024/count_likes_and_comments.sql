SELECT
	p.id AS photo_id,
    (SELECT COUNT(*) FROM likes WHERE photo_id = p.id) AS likes_count,
    (SELECT COUNT(*) FROM comments WHERE photo_id = p.id) AS comments_count
FROM
	photos AS p
LEFT JOIN
	likes AS l ON p.id = l.photo_id
LEFT JOIN
	comments AS c ON p.id = c.photo_id
GROUP BY
	p.id
ORDER BY
	likes_count DESC,
	comments_count DESC,
	photo_id
;