USE [Koski_SA]
GO

if not exists (

	SELECT top 1 *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'sa'
	AND table_name = 'sa_koski_opiskeluoikeus'
	AND column_name = 'tuva_jarjestamislupa'

)

alter table [sa].[sa_koski_opiskeluoikeus]
add [tuva_jarjestamislupa] [varchar](100) NULL
