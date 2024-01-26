USE [VipunenTK_SA]
GO

IF OBJECT_ID(N'dbo.TK_Koski_perusopetus_ainevalinnat', N'U') IS NULL AND OBJECT_ID(N'dbo.TK_Koski_perusopetus_ainevalinnat_2020', N'U') IS NULL AND OBJECT_ID(N'dbo.TK_Koski_perusopetus_ainevalinnat_2021', N'U') IS NULL 
BEGIN

/****** Object:  Table [dw].[f_koski_perusopetus_ainevalinnat]    Script Date: 31.1.2022 10:30:19 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TK_Koski_perusopetus_ainevalinnat](
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

CREATE TABLE [dbo].[TK_Koski_perusopetus_ainevalinnat_2020](
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

CREATE TABLE [dbo].[TK_Koski_perusopetus_ainevalinnat_2021](
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

END





