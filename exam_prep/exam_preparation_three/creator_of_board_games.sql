CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
	creator_first_name VARCHAR(30)
)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE amount_of_games INT;
BEGIN
	SELECT
	INTO amount_of_games
	COUNT(cbg.board_game_id)
	FROM
		creators AS c
	JOIN
		creators_board_games AS cbg ON c.id = cbg.creator_id
	WHERE
		c.first_name = creator_first_name;
	RETURN amount_of_games;
END;
$$;