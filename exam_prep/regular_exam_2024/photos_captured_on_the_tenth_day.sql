SELECT
    CASE
        WHEN description IS NOT NULL THEN SUBSTRING(description FROM 1 FOR 10) || '...'
        ELSE '...'
    END AS summary,
    TO_CHAR(capture_date, 'DD.MM HH24:MI') AS date
FROM photos
WHERE EXTRACT(DAY FROM capture_date) = 10
ORDER BY capture_date DESC;
