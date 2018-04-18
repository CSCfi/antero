IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='tieteenalan_TTHV') BEGIN

CREATE TABLE [dbo].[tieteenalan_TTHV](
	[Tieteenala2010] [varchar](50) NOT NULL,
	[TTHV] [varchar](50) NOT NULL,
	[TTHV_koodi] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]