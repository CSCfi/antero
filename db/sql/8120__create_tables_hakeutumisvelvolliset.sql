USE [ANTERO]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 23:05:49 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 23:05:49 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 23:05:49 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 23:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset](
	[oppija_oid] [varchar](50) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[tilastovuosi] [int] NULL,
	[syntymavuosi] [int] NULL,
	[hak_velv_tarkasteluhetki_fi] [nvarchar](35) NOT NULL,
	[sukupuoli_fi] [nvarchar](100) NULL,
	[ika_fi] [nvarchar](100) NULL,
	[aidinkieli_ryhma_fi] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_fi] [nvarchar](200) NULL,
	[kotikunta_nykyinen_fi] [nvarchar](200) NULL,
	[kotimaakunta_nykyinen_fi] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_nykyinen_fi] [nvarchar](200) NULL,
	[perusopetuksen_suorituskunta_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_fi] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_fi] [varchar](30) NULL,
	[perusopetuksen_suorituskausi_fi] [nvarchar](20) NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi] [varchar](200) NULL,
	[hak_velv_tarkasteluhetki_sv] [nvarchar](33) NOT NULL,
	[sukupuoli_sv] [nvarchar](100) NULL,
	[ika_sv] [nvarchar](100) NULL,
	[aidinkieli_ryhma_sv] [nvarchar](100) NULL,
	[kansalaisuus_ryhma_sv] [nvarchar](200) NULL,
	[kotikunta_nykyinen_sv] [nvarchar](200) NULL,
	[kotimaakunta_nykyinen_sv] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_nykyinen_sv] [nvarchar](200) NULL,
	[perusopetuksen_suorituskunta_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusmaakunta_sv] [nvarchar](200) NULL,
	[perusopetuksen_suoritusvuosi_sv] [varchar](49) NULL,
	[perusopetuksen_suorituskausi_sv] [nvarchar](20) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_sv] [varchar](3) NOT NULL,
	[koulutusmuoto_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv] [varchar](200) NULL,
	[jarjestys_hak_velv_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_sukupuoli] [varchar](10) NULL,
	[jarjestys_aidinkieli_ryhma] [int] NULL,
	[jarjestys_kansalaisuus_ryhma] [int] NULL,
	[jarjestys_kotimaakunta] [varchar](10) NULL,
	[jarjestys_kotikunnan_hyvinvointialue] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusmaakunta] [varchar](10) NULL,
	[jarjestys_perusopetuksen_suoritusvuosi] [int] NULL,
	[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 23:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset_hakutiedot](
	[HenkiloOID] [varchar](255) NULL,
	[HakuOid] [varchar](255) NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[HakutoiveNumero] [int] NULL,
	[ValinnanTila] [varchar](255) NULL,
	[VastaanotonTila] [varchar](255) NULL,
	[IlmoittautumisenTila] [varchar](255) NULL,
	[OppilaitosOID] [varchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nchar](10) NULL,
	[koulutustyyppi_koodi] [varchar](max) NULL,
	[ammatillinen_perustutkinto_erityisopetuksena] [int] NULL,
	[hakutapa_fi] [nvarchar](255) NULL,
	[hakutyyppi_fi] [nvarchar](255) NULL,
	[koulutustyyppi_hakukohde_fi] [nvarchar](255) NULL,
	[hakutapa_sv] [nvarchar](255) NULL,
	[hakutyyppi_sv] [nvarchar](255) NULL,
	[koulutustyyppi_hakukohde_sv] [nvarchar](255) NULL,
	[jarjestys_hakutapa] [int] NULL,
	[jarjestys_hakutyyppi] [int] NULL,
	[jarjestys_koulutustyyppi_hakukohde] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 23:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot](
	[oppija_oid] [varchar](50) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[max_ajankohta] [date] NULL,
	[tilastovuosi] [int] NULL,
	[opiskelun_tarkasteluhetki_fi] [nvarchar](46) NOT NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_fi] [varchar](39) NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_fi] [varchar](81) NOT NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_fi] [nvarchar](255) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[opiskelun_tarkasteluhetki_sv] [nvarchar](53) NOT NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_sv] [varchar](49) NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_sv] [varchar](114) NOT NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_sv] [nvarchar](255) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[jarjestys_opiskelun_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] [int] NULL
) ON [PRIMARY]

GO
