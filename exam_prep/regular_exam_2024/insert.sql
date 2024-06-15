INSERT INTO addresses(street, town, country, account_id)
SELECT
	a.username AS street,
	a.password AS town,
	a.ip AS country,
	a.age AS account_id
FROM
	accounts AS a
WHERE
	gender = 'F'
;
