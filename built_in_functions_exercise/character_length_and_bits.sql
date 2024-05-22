SELECT
	CONCAT(mou.mountain_range, ' ', pea.peak_name) AS mountain_information,
	CHAR_LENGTH(CONCAT(mou.mountain_range, ' ', pea.peak_name)) AS characters_length,
	BIT_LENGTH(CONCAT(mou.mountain_range, ' ', pea.peak_name)) AS bits_of_tring
FROM
	mountains AS mou,
	peaks AS pea
WHERE
	mou."id" = pea.mountain_id
;