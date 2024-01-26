IF NOT EXISTS (
	SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'd_opetustehtava'
    AND COLUMN_NAME = 'jarjestys2'
)
BEGIN
    ALTER TABLE [dw].[d_opetustehtava] ADD jarjestys2 INT
END
