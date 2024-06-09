CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INT,
	money_amount NUMERIC(4)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	IF balance - money_amount < 0 FROM accounts WHERE id = account_id THEN
	RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	ELSE
		UPDATE accounts
		SET balance = balance - money_amount
		WHERE id = account_id;
	END IF;
END;
$$
;