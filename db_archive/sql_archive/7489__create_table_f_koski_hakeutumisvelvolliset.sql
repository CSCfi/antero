USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 14.3.2023 19:10:29 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 14.3.2023 19:10:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset](
	[oppija_oid] [varchar](50) NULL,
	[hakenut_ensisijaisesti_1_0] [int] NOT NULL,
	[hakenut_1_0] [int] NOT NULL,
	[valittu_1_0] [int] NOT NULL,
	[vastaanottanut_1_0] [int] NOT NULL,
	[ilmoittautunut_1_0] [int] NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Hak.velv. tarkasteluhetki] [nvarchar](35) NOT NULL,
	[Opiskelun tarkasteluhetki] [nvarchar](46) NULL,
	[Koul. alkamiskausi (hakukohde)] [varchar](13) NOT NULL,
	[Sukupuoli] [nvarchar](100) NULL,
	[Ikä] [nvarchar](100) NULL,
	[Täyttänyt 18 v. (opiskelun tarkasteluhetki)] [varchar](39) NULL,
	[Syntymävuosi] [int] NULL,
	[Äidinkieli (ryhmä)] [nvarchar](100) NULL,
	[Kansalaisuus (ryhmä)] [nvarchar](200) NULL,
	[Kotikunta] [nvarchar](200) NULL,
	[Kotimaakunta] [nvarchar](200) NULL,
	[Perusop. suoritusvuosi] [varchar](33) NULL,
	[Perusop. suorituskausi] [nvarchar](20) NULL,
	[Perusop. suor. til.v. keväänä] [varchar](5) NOT NULL,
	[Perusop. suorituskunta] [nvarchar](200) NULL,
	[Perusop. suoritusmaakunta] [nvarchar](200) NULL,
	[Hakutoiminta] [varchar](50) NOT NULL,
	[Hakutapa] [nvarchar](255) NULL,
	[Hakutyyppi] [nvarchar](255) NULL,
	[Hakutoivenumero] [varchar](30) NULL,
	[Hakutoiveen tila] [varchar](14) NOT NULL,
	[Oppiv. suor. kelp. koul. (hak.velv. tarkasteluhetki)] [varchar](5) NOT NULL,
	[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)] [varchar](5) NULL,
	[Vaativa erityinen tuki (hakukohde)] [varchar](5) NOT NULL,
	[Koulutustyyppi (hakukohde)] [nvarchar](255) NULL,
	[Koulutustyyppi (opiskelun tarkasteluhetki)] [nvarchar](255) NULL,
	[Koulutusmuoto (hak.velv. tarkasteluhetki)] [varchar](200) NULL,
	[Koulutusmuoto (opiskelun tarkasteluhetki)] [varchar](200) NULL,
	[Suorituksen tyyppi (hak.velv. tarkasteluhetki)] [varchar](200) NULL,
	[Suorituksen tyyppi (opiskelun tarkasteluhetki)] [varchar](200) NULL,
	[jarjestys_hak_velv_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_opiskelun_tarkasteluhetki] [varchar](24) NULL,
	[jarjestys_koulutuksen_alkamiskausi] [nvarchar](10) NULL,
	[jarjestys_sukupuoli] [varchar](10) NULL,
	[jarjestys_aidinkieli_ryhma] [int] NULL,
	[jarjestys_kansalaisuus_ryhma] [int] NULL,
	[jarjestys_kotimaakunta] [varchar](50) NULL,
	[jarjestys_perusop_suoritusmaakunta] [varchar](50) NULL,
	[jarjestys_perusop_suoritusvuosi] [int] NULL,
	[jarjestys_perusop_suorituskausi] [nvarchar](1) NULL,
	[jarjestys_hakutapa] [int] NULL,
	[jarjestys_hakutyyppi] [int] NULL,
	[jarjestys_hakutoiveen_tila] [int] NOT NULL,
	[jarjestys_koulutustyyppi_hakukohde] [nvarchar](255) NULL,
	[jarjestys_koulutustyyppi_opiskelun_tarkasteluhetki] [nvarchar](255) NULL,
	[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] [int] NULL
) ON [PRIMARY]

GO


