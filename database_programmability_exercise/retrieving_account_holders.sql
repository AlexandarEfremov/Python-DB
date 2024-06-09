CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
	searched_balance NUMERIC
)
LANGUAGE plpgsql
AS
$$
DECLARE
    holder_info RECORD;
BEGIN
    FOR holder_info IN
        SELECT
            CONCAT(ah.first_name, ' ', ah.last_name) AS full_name,
            SUM(a.balance) AS total_sum
        FROM
            account_holders AS ah
        JOIN
            accounts AS a
        ON
            ah.id = a.account_holder_id
        GROUP BY
            ah.first_name, ah.last_name
        HAVING
            SUM(a.balance) > searched_balance
        ORDER BY
            ah.first_name,
            ah.last_name
    LOOP
        RAISE NOTICE '% - %', holder_info.full_name, holder_info.total_sum;
    END LOOP;
END;
$$;

CALL sp_retrieving_holders_with_balance_higher_than(200000);
