USE [Koski_SA]
GO

/****** Object:  Table [dbo].[esi_ja_perus_yksilollistaminen_oppiainesuoritukset]    Script Date: 24.8.2023 23:50:28 ******/
DROP TABLE IF EXISTS [dbo].[esi_ja_perus_yksilollistaminen_oppiainesuoritukset]
GO

/****** Object:  Table [dbo].[esi_ja_perus_yksilollistaminen_oppiainesuoritukset]    Script Date: 24.8.2023 23:50:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[esi_ja_perus_yksilollistaminen_oppiainesuoritukset](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[vuosiluokka] [varchar](50) NULL,
	[oppiaineita_yksilollistetty_lkm] [int] NULL,
	[ei_oppiainesuorituksia] [int] NULL,
	[MA_yksilollistetty] [int] NULL,
	[AI_yksilollistetty] [int] NULL
) ON [PRIMARY] 

GO


