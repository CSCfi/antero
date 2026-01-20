USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 15.4.2025 12.39.02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_hakeutumisvelvolliset]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_hakeutumisvelvolliset]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 15.4.2025 12.39.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset](
	[master_oid] [varchar](50) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[tilastovuosi] [int] NULL,
	[syntymavuosi] [int] NULL,
	[hak_velv_tarkasteluhetki_fi] [nvarchar](35) NOT NULL,
	[sukupuoli_fi] [nvarchar](100) NULL,
	[ika_fi] [nvarchar](100) NULL,
	[aidinkieli_ryhma_fi] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_fi] [nvarchar](200) NULL,
	[kotikunta_hak_velv_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[kotimaakunta_hak_velv_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[perusopetuksen_suorituskunta_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_fi] [varchar](30) NULL,
	[perusopetuksen_suorituskausi_fi] [nvarchar](20) NULL,
	[pidennetty_oppivelvollisuus_fi] [varchar](200) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_fi] [varchar](200) NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[erityisopetus_hak_velv_tarkasteluhetki_fi] [varchar](100) NULL,
	[hak_velv_tarkasteluhetki_sv] [nvarchar](33) NOT NULL,
	[sukupuoli_sv] [nvarchar](100) NULL,
	[ika_sv] [nvarchar](100) NULL,
	[aidinkieli_ryhma_sv] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_sv] [nvarchar](200) NULL,
	[kotikunta_hak_velv_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[kotimaakunta_hak_velv_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[perusopetuksen_suorituskunta_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_sv] [varchar](49) NULL,
	[perusopetuksen_suorituskausi_sv] [nvarchar](20) NULL,
	[pidennetty_oppivelvollisuus_sv] [varchar](200) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_sv] [varchar](200) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_sv] [varchar](3) NOT NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[erityisopetus_hak_velv_tarkasteluhetki_sv] [varchar](100) NULL,
	[jarjestys_hak_velv_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_sukupuoli] [varchar](10) NULL,
	[jarjestys_aidinkieli_ryhma] [int] NULL,
	[jarjestys_kansalaisuus_ryhma] [int] NULL,
	[jarjestys_kotimaakunta_hak_velv_tarkasteluhetki] [varchar](10) NULL,
	[jarjestys_kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusmaakunta] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusvuosi] [int] NULL,
	[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_pidennetty_oppivelvollisuus] [int] NULL,
	[jarjestys_perusopetuksen_oppimaaran_yksilollistaminen] [int] NULL,
	[jarjestys_erityisopetus_hak_velv_tarkasteluhetki] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]