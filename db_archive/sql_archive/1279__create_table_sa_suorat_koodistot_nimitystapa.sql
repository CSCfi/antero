USE [ANTERO]
GO
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_suorat_koodistot_nimitystapa')
BEGIN
CREATE TABLE [sa].[sa_suorat_koodistot_nimitystapa](
	[koodi] [varchar](5) NULL,
	[selite_fi] [varchar](50) NULL,
	[selite_sv] [varchar](50) NULL,
	[selite_en] [varchar](50) NULL,
	[selite2016_fi] [varchar](50) NULL,
	[selite2016_sv] [varchar](50) NULL,
	[selite2016_en] [varchar](50) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](30) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
END
