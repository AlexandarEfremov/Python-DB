SELECT REPLACE(title, 'The', '***')
	AS "Title"
FROM books
WHERE SUBSTRING(Title, 1, 3) = 'The'
ORDER BY id
;