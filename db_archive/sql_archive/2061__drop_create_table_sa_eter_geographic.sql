USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_geographic')
BEGIN
	DROP TABLE [sa].[sa_eter_geographic];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_geographic')
BEGIN

CREATE TABLE [sa].[sa_eter_geographic](
	[_id] [varchar](24) NOT NULL,
	[GEO.NUTS2] [varchar](4) NULL,
	[GEO.NOTESREG] [varchar](121) NULL,
	[GEO.COORDLON.v] [varchar](11) NULL,
	[GEO.COORDLON.code] [varchar](10) NULL,
	[GEO.NOTESCITYPOSTCODE] [varchar](105) NULL,
	[GEO.MULTISITECITY] [varchar](1) NULL,
	[GEO.MULTISITELON] [varchar](1) NULL,
	[GEO.FLAG] [varchar](2) NULL,
	[GEO.COORDLAT.v] [varchar](10) NULL,
	[GEO.COORDLAT.code] [varchar](10) NULL,
	[GEO.NUTS3MULTISITE] [varchar](102) NULL,
	[GEO.NOTESMULTISITE] [varchar](215) NULL,
	[GEO.CITY] [varchar](147) NULL,
	[GEO.MULTISITE.v] [varchar](5) NULL,
	[GEO.MULTISITE.code] [varchar](2) NULL,
	[GEO.MULTISITEPOSTCODE] [varchar](1) NULL,
	[GEO.NUTS3] [varchar](5) NULL,
	[GEO.POSTCODE] [varchar](10) NULL,
	[GEO.MULTISITELAT] [varchar](1) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_geographic] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_geographic] ADD  CONSTRAINT [DF__sa_eter_geographic]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO