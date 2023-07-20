USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 20.7.2023 17:33:25 ******/
DROP TABLE [dw].[f_koski_hakeutumisvelvolliset]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 20.7.2023 17:33:25 ******/
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
	[oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_1_0] [int] NULL,
	[tilastovuosi] [int] NULL,
	[syntymavuosi] [int] NULL,
	[hak_velv_tarkasteluhetki_fi] [nvarchar](35) NOT NULL,
	[opiskelun_tarkasteluhetki_fi] [nvarchar](46) NULL,
	[koulutuksen_alkamiskausi_hakukohde_fi] [varchar](13) NOT NULL,
	[sukupuoli_fi] [nvarchar](100) NULL,
	[ika_fi] [nvarchar](100) NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_fi] [varchar](39) NULL,
	[aidinkieli_ryhma_fi] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_fi] [nvarchar](200) NULL,
	[kotikunta_nykyinen_fi] [nvarchar](200) NULL,
	[kotimaakunta_nykyinen_fi] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_nykyinen_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_fi] [varchar](30) NULL,
	[perusopetuksen_suorituskausi_fi] [nvarchar](20) NULL,
	[perusop_suor_tilastovuoden_kevaana_fi] [varchar](5) NOT NULL,
	[perusopetuksen_suorituskunta_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_fi] [nvarchar](200) NULL,
	[hakutoiminta_fi] [varchar](50) NOT NULL,
	[hakutapa_fi] [nvarchar](255) NULL,
	[hakutyyppi_fi] [nvarchar](255) NULL,
	[hakutoivenumero_fi] [varchar](30) NULL,
	[hakutoiveen_tila_fi] [varchar](14) NOT NULL,
	[koulutustyyppi_hakukohde_fi] [nvarchar](255) NULL,
	[vaativa_erityinen_tuki_hakukohde_fi] [varchar](5) NOT NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_fi] [varchar](81) NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_fi] [nvarchar](255) NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[hak_velv_tarkasteluhetki_sv] [nvarchar](33) NOT NULL,
	[opiskelun_tarkasteluhetki_sv] [nvarchar](53) NULL,
	[koulutuksen_alkamiskausi_hakukohde_sv] [varchar](18) NOT NULL,
	[sukupuoli_sv] [nvarchar](100) NULL,
	[ika_sv] [nvarchar](100) NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_sv] [varchar](49) NULL,
	[aidinkieli_ryhma_sv] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_sv] [nvarchar](200) NULL,
	[kotikunta_nykyinen_sv] [nvarchar](200) NULL,
	[kotimaakunta_nykyinen_sv] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_nykyinen_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_sv] [varchar](49) NULL,
	[perusopetuksen_suorituskausi_sv] [nvarchar](20) NULL,
	[perusop_suor_tilastovuoden_kevaana_sv] [varchar](4) NOT NULL,
	[perusopetuksen_suorituskunta_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_sv] [nvarchar](200) NULL,
	[hakutoiminta_sv] [varchar](54) NOT NULL,
	[hakutapa_sv] [nvarchar](255) NULL,
	[hakutyyppi_sv] [nvarchar](255) NULL,
	[hakutoivenumero_sv] [varchar](30) NULL,
	[hakutoiveen_tila_sv] [varchar](15) NOT NULL,
	[koulutustyyppi_hakukohde_sv] [nvarchar](255) NULL,
	[vaativa_erityinen_tuki_hakukohde_sv] [varchar](5) NOT NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_sv] [varchar](114) NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_sv] [nvarchar](255) NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[jarjestys_hak_velv_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_opiskelun_tarkasteluhetki] [varchar](24) NULL,
	[jarjestys_koulutuksen_alkamiskausi_hakukohde] [nvarchar](10) NULL,
	[jarjestys_sukupuoli] [varchar](10) NULL,
	[jarjestys_aidinkieli_ryhma] [int] NULL,
	[jarjestys_kansalaisuus_ryhma] [int] NULL,
	[jarjestys_kotimaakunta] [varchar](10) NULL,
	[jarjestys_kotikunnan_hyvinvointialue] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusmaakunta] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusvuosi] [int] NULL,
	[jarjestys_perusopetuksen_suorituskausi] [nvarchar](1) NULL,
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


