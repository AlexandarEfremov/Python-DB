SELECT
	peak_name,
	SUBSTRING(peak_name, 1, 4) AS positive_left,
	LEFT(peak_name, -4) AS negative_left
FROM
	peaks
;