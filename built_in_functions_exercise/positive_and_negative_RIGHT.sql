SELECT
	peak_name,
	RIGHT(peak_name, 4) AS positive_right,
	SUBSTRING(peak_name FROM 5) AS negativ_right
FROM
	peaks
;