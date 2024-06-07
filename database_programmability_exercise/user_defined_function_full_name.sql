CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN CASE
        WHEN first_name IS NULL AND last_name IS NULL THEN 'null'
        WHEN first_name IS NULL AND last_name IS NOT NULL THEN INITCAP(last_name)
        WHEN first_name IS NOT NULL AND last_name IS NULL THEN INITCAP(first_name)
        ELSE CONCAT(INITCAP(first_name), ' ', INITCAP(last_name))
    END;
END;
$$;