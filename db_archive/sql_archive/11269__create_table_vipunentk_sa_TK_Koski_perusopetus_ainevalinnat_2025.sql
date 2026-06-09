USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TK_Koski_perusopetus_ainevalinnat_2025]') AND type in (N'U'))
CREATE TABLE [dbo].[TK_Koski_perusopetus_ainevalinnat_2025](
	[Lukuvuosi] [varchar](50) NOT NULL,
	oppija_oid [varchar](50) NOT NULL,
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
