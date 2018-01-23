USE [ANTERO]
GO
IF NOT EXISTS (select * from INFORMATION_SCHEMA.COLUMNS
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kaikki'
    and COLUMN_NAME='kysely_alkupvm')
BEGIN
ALTER TABLE [sa].[sa_arvo_kaikki] ADD kysely_alkupvm nvarchar(max) NULL;
END

GO

IF NOT EXISTS (select * from INFORMATION_SCHEMA.COLUMNS
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kaikki'
    and COLUMN_NAME='kysely_loppupvm')
BEGIN
ALTER TABLE [sa].[sa_arvo_kaikki] ADD kysely_loppupvm nvarchar(max) NULL;
END
