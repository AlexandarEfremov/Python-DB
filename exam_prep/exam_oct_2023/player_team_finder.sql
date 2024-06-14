CREATE OR REPLACE PROCEDURE sp_players_team_name(
    IN player_name VARCHAR(50),
    OUT team_name VARCHAR(45)
)
LANGUAGE plpgsql
AS
$$
BEGIN
    WITH temp_table AS (
        SELECT
            CONCAT(p.first_name, ' ', p.last_name) AS full_name,
            t.name AS team_name
        FROM
            players AS p
        JOIN
            teams AS t ON p.team_id = t.id
    )
    SELECT
        t.team_name
    INTO
        team_name
    FROM
        temp_table t
    WHERE
        t.full_name = player_name;

    IF team_name IS NULL THEN
        team_name := 'The player currently has no team';
    END IF;
END;
$$;

CALL sp_players_team_name('Walther Olenchenko', '')

