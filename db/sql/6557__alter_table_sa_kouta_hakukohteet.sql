USE  ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_kouta_hakukohteet'
  AND COLUMN_NAME ='ammatillinenPerustutkintoErityisopetuksena')
BEGIN
	ALTER TABLE [sa].[sa_kouta_hakukohteet] ADD [ammatillinenPerustutkintoErityisopetuksena] bit NULL
END
