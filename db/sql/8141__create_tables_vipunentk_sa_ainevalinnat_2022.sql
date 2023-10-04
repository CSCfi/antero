USE [VipunenTK_SA]
GO
/****** Object:  Table [dbo].[TK_Koski_perusopetus_ainevalinnat_2023]    Script Date: 4.10.2023 10:29:51 ******/
DROP TABLE IF EXISTS [dbo].[TK_Koski_perusopetus_ainevalinnat_2023]
GO
/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2023]    Script Date: 4.10.2023 10:29:51 ******/
DROP TABLE IF EXISTS [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2023]
GO
/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023]    Script Date: 4.10.2023 10:29:51 ******/
DROP TABLE IF EXISTS [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023]
GO
/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023]    Script Date: 4.10.2023 10:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023](
	[Tilastovuosi] [int] NOT NULL,
	[paatason_suoritus_id] [bigint] NOT NULL,
	[lukionoppimaara] [nvarchar](255) NULL,
	[lukionoppimaara_suorituskieli] [nvarchar](50) NULL,
	[toimipiste_oid] [nvarchar](255) NULL,
	[oppilaitos_oid] [nvarchar](255) NULL,
	[koulutustoimija_oid] [nvarchar](255) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aine_koodisto] [nvarchar](255) NULL,
	[aine] [nvarchar](50) NULL,
	[aineenoppimaara_koodisto] [nvarchar](255) NULL,
	[aineenoppimaara] [nvarchar](50) NULL,
	[kurssi_koodisto] [nvarchar](255) NULL,
	[kurssi] [nvarchar](255) NULL,
	[kurssi_paikallinen_OPS_0_1] [int] NULL,
	[kurssi_tyyppi] [nvarchar](255) NULL,
	[kurssi_suorituskieli] [nvarchar](50) NULL,
	[kurssi_arvosana] [nvarchar](50) NULL,
	[lkm] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2023]    Script Date: 4.10.2023 10:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2023](
	[Tilastovuosi] [int] NOT NULL,
	[paatason_suoritus_id] [bigint] NOT NULL,
	[lukionoppimaara] [nvarchar](255) NULL,
	[lukionoppimaara_suorituskieli] [nvarchar](255) NULL,
	[toimipiste_oid] [nvarchar](255) NULL,
	[oppilaitos_oid] [nvarchar](255) NULL,
	[koulutustoimija_oid] [nvarchar](255) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[ika] [int] NULL,
	[aidinkieli] [nvarchar](50) NULL,
	[kansalaisuus] [nvarchar](3) NULL,
	[osasuoritus_id] [bigint] NOT NULL,
	[aine_koodisto] [nvarchar](255) NULL,
	[aine] [nvarchar](255) NULL,
	[aineenoppimaara_koodisto] [nvarchar](255) NULL,
	[aineenoppimaara] [nvarchar](255) NULL,
	[aine_suorituskieli] [nvarchar](255) NULL,
	[aine_laajuus] [float] NULL,
	[aine_laajuus_yksikko] [nvarchar](255) NULL,
	[aine_laajuus_puuttuu_0_1] [int] NOT NULL,
	[aine_S_arvosana_0_1] [int] NOT NULL,
	[aine_arvosana] [nvarchar](2) NULL,
	[aine_arviointi_hyvaksytty] [int] NULL,
	[kielet_lkm] [int] NULL,
	[kurssi_paikallinen_OPS_0_1] [int] NULL,
	[kurssi_tyyppi] [nvarchar](255) NULL,
	[kurssi_suorituskieli] [nvarchar](255) NULL,
	[kurssit_laajuus] [float] NULL,
	[kurssit_laajuus_all_suorituskieli] [float] NULL,
	[kurssit_S_arvosanat_laajuus] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TK_Koski_perusopetus_ainevalinnat_2023]    Script Date: 4.10.2023 10:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_Koski_perusopetus_ainevalinnat_2023](
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
	[koulutusmoduuli_laajuus_yksikko] [varchar](50) NULL,
	[kielet_lkm] [int] NULL
) ON [PRIMARY]

GO
