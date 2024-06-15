CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE count_of_photos INT;
BEGIN
	SELECT
		COUNT(ap.photo_id)
	INTO count_of_photos
	FROM
		accounts AS a
	LEFT JOIN
		accounts_photos AS ap ON a.id = ap.account_id
	WHERE a.username = account_username
	GROUP BY
		a.username;

	RETURN count_of_photos;
END;
$$;

