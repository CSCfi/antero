--
--  create table f_yo_rekrytointihaut
--

USE [ANTERO]
GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_hakuajat')

BEGIN
CREATE TABLE [sa].[sa_hakuajat](
	[hakuaikaId] [nvarchar](15) NULL,
	[hakuOid] [nvarchar](100) NULL,
	[alkuPvm] [datetime2](7) NULL,
	[loppuPvm] [datetime2](7) NULL,
	[nimi_fi] [nvarchar](400) NULL,
	[nimi_sv] [nvarchar](400) NULL,
	[nimi_en] [nvarchar](400) NULL,
	[source] [nvarchar](100) NULL,
	[lataaja] [nvarchar](100) NULL,
	[latausaika] [datetime2](7) NULL,
	[tila] [nvarchar](100) NULL,
	[modified] [datetime2](7) NULL
) 
END
