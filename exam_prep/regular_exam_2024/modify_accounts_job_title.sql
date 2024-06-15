CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
LANGUAGE plpgsql
AS
$$
BEGIN
	UPDATE accounts
	SET job_title = CONCAT('(Remote) ', job_title)
	WHERE id IN (
			SELECT
				acc.id
			FROM accounts AS acc
			JOIN addresses AS add ON acc.id = add.account_id
			WHERE
				add.street = address_street
				AND add.town = address_town
		);
END;
$$;