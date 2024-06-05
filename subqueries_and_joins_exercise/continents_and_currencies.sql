CREATE VIEW continent_currency_usage
AS
SELECT
	data.continent_code,
	data.currency_code,
	data.currency_usage
FROM (
	SELECT
		con.continent_code,
		con.currency_code,
		con.currency_usage,
		DENSE_RANK() OVER (PARTITION BY con.continent_code ORDER BY con.currency_usage DESC) AS ranked_usage
	FROM(
		SELECT
			continent_code,
			currency_code,
			COUNT(currency_code) AS currency_usage
		FROM
			countries
		GROUP BY
			continent_code,
			currency_code
		HAVING
			COUNT(*) > 1
		ORDER BY
			continent_code
	) AS con
) AS data
WHERE
	data.ranked_usage = 1
ORDER BY
	data.currency_usage DESC,
	data.continent_code ASC,
	data.currency_code ASC
;
