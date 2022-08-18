USE KOSKI_SA

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_oman_aidinkielen_opinnot')
BEGIN
	DROP TABLE [sa].[sa_koski_oman_aidinkielen_opinnot]
END

GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_oman_aidinkielen_opinnot')
BEGIN

CREATE TABLE [sa].[sa_koski_oman_aidinkielen_opinnot](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[paatason_suoritus_id]  VARCHAR(100),
	[opiskeluoikeus_oid]  VARCHAR(100),
	[arviointipaiva] DATETIME,
	[arvosana_koodiarvo] VARCHAR(10),
	[arvosana_koodisto] VARCHAR(100),
	[kieli_koodiarvo] VARCHAR(10),
	[kieli_koodisto] VARCHAR(100),
	[laajuus_arvo] FLOAT(5),
	[laajuus_yksikko] VARCHAR(10),
	[laajuus_koodisto] VARCHAR(100),
	[omanaidinkielenopinnot] VARCHAR(MAX),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_sa_koski_oman_aidinkielen_opinnot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_koski_oman_aidinkielen_opinnot] ADD  CONSTRAINT [DF_sa_koski_oman_aidinkielen_opinnot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_koski_oman_aidinkielen_opinnot] ADD  CONSTRAINT [DF__sa_koski_oman_aidinkielen_opinnot_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
