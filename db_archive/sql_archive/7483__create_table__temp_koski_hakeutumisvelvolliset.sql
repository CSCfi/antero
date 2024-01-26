USE [ANTERO]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset]    Script Date: 14.3.2023 22:38:40 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset]    Script Date: 14.3.2023 22:38:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[_temp_koski_hakeutumisvelvolliset](
	[oppija_oid] [varchar](50) NULL,
	[koodit_koulutusnimike_hv] [varchar](6) NULL,
	[Tilastovuosi] [int] NULL,
	[Hak.velv. tarkasteluhetki] [nvarchar](35) NOT NULL,
	[Sukupuoli] [nvarchar](100) NULL,
	[Ikä] [nvarchar](100) NULL,
	[Syntymävuosi] [int] NULL,
	[Äidinkieli (ryhmä)] [nvarchar](100) NULL,
	[Kansalaisuus (ryhmä)] [nvarchar](200) NULL,
	[Kotikunta] [nvarchar](200) NULL,
	[Kotimaakunta] [nvarchar](200) NULL,
	[Perusop. suorituskunta] [nvarchar](200) NULL,
	[Perusop. suoritusmaakunta] [nvarchar](200) NULL,
	[Perusop. suoritusvuosi] [varchar](33) NULL,
	[Perusop. suorituskausi] [nvarchar](20) NULL,
	[Oppiv. suor. kelp. koul. (hak.velv. tarkasteluhetki)] [varchar](5) NOT NULL,
	[Koulutusmuoto (hak.velv. tarkasteluhetki)] [varchar](200) NULL,
	[Suorituksen tyyppi (hak.velv. tarkasteluhetki)] [varchar](200) NULL,
	[jarjestys_hak_velv_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_sukupuoli] [varchar](10) NULL,
	[jarjestys_aidinkieli_ryhma] [int] NULL,
	[jarjestys_kansalaisuus_ryhma] [int] NULL,
	[jarjestys_kotimaakunta] [varchar](50) NULL,
	[jarjestys_perusop_suoritusmaakunta] [varchar](50) NULL,
	[jarjestys_perusop_suoritusvuosi] [int] NULL,
	[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] [int] NULL
) ON [PRIMARY]

GO


