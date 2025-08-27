USE VARDA_SA

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_varda_kielipainotus' AND COLUMN_NAME = 'kielipainotustyyppi_koodi' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_varda_kielipainotus ADD  kielipainotustyyppi_koodi nvarchar(30)
END

USE ANTERO
