USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_perusopetus_ainevalinnat]    Script Date: 20.12.2021 9:33:26 ******/
DROP TABLE IF EXISTS [dw].[f_koski_perusopetus_ainevalinnat]
GO

/****** Object:  Table [dw].[f_koski_perusopetus_ainevalinnat]    Script Date: 20.12.2021 9:33:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_perusopetus_ainevalinnat](
	[Lukuvuosi] [varchar](50) NOT NULL,
	[oppija_oid] [varchar](50) NOT NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[paatason_suoritus_id] [int] NOT NULL,
	[vuosiluokka] [varchar](50) NULL,
	[vuosiluokan_suorituskieli] [nvarchar](255) NULL,
	[toimipiste_oid] [varchar](50) NULL,
	[oppilaitos_oid] [varchar](50) NULL,
	[koulutustoimija_oid] [varchar](50) NULL,
	[sukupuoli] [varchar](50) NULL,
	[ika] [int] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[osasuoritus_id] [int] NOT NULL,
	[aine_koodisto] [varchar](50) NULL,
	[aine] [varchar](50) NULL,
	[aineen_oppimaara_koodisto] [varchar](50) NULL,
	[aineen_oppimaara] [varchar](50) NULL,
	[aineen_suorituskieli] [varchar](50) NULL,
	[aineen_arvosana] [varchar](50) NULL,
	[aineen_arviointi_hyvaksytty] [bit] NULL,
	[koulutusmoduuli_pakollinen] [bit] NULL,
	[koulutusmoduuli_paikallinen] [bit] NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[kielet_lkm] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_kieli_vuosiluokan_suorituskieli_id] [bigint] NULL,
	[d_kieli_aineen_suorituskieli_id] [bigint] NULL,
	[d_vuosiluokka_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_jarj_id] [int] NULL,
	[d_oppiaine_ja_oppimaara_aine_id] [int] NULL,
	[d_oppiaine_ja_oppimaara_maara_id] [int] NULL,
	[d_opintojenlaajuusyksikko_id] [int] NULL
) ON [PRIMARY]

GO


