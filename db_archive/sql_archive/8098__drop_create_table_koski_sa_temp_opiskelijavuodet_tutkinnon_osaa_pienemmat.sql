USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_tutkinnon_osaa_pienemmat]    Script Date: 27.9.2023 12:12:47 ******/
DROP TABLE [sa].[temp_opiskelijavuodet_tutkinnon_osaa_pienemmat]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_tutkinnon_osaa_pienemmat]    Script Date: 27.9.2023 12:12:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_tutkinnon_osaa_pienemmat](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto] [varchar](10) NULL,
	[tutkintotyyppi] [varchar](2) NULL,
	[liittyy_tutkinnonosaan_1_0] [int] NULL
) ON [PRIMARY]

GO
