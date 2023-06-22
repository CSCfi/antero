IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset'
    AND COLUMN_NAME = 'kysymysversio'
)
BEGIN
    ALTER TABLE sa.sa_arvo_vastaukset
    ADD kysymysversio INT;
END


IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_kysymykset'
    AND COLUMN_NAME = 'kysymysversio'
)
BEGIN
    ALTER TABLE sa.sa_arvo_kysymykset
    ADD kysymysversio INT;
END


IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_monivalintavaihtoehdot'
    AND COLUMN_NAME = 'kysymysversio'
)
BEGIN
    ALTER TABLE sa.sa_arvo_monivalintavaihtoehdot
    ADD kysymysversio INT;
END
