IF NOT EXISTS (
	SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_oiva_luvat' AND COLUMN_NAME = 'paalupa_id')
BEGIN
    ALTER TABLE sa.sa_oiva_luvat
    ADD [paalupa_id] varchar(255) null
END