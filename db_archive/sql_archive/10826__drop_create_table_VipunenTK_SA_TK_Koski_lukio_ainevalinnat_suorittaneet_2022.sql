USE [VipunenTK_SA]
GO

IF @@SERVERNAME like '%pvipu%' 
BEGIN 
	DROP TABLE [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2022];
	CREATE TABLE [dbo].[TK_Koski_lukio_ainevalinnat_suorittaneet_2022](
		[tilastovuosi] [int] NOT NULL,
		[lukuvuosi] [nvarchar](25) NOT NULL,
		[lukukausi] [nvarchar](2) NOT NULL,
		[paatason_suoritus_id] [bigint] NOT NULL,
		[ops_voimaantulo] [nvarchar](50) NULL,
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
		[kurssi_pakollinen_0_1] [int] NULL,
		[kurssi_tyyppi] [nvarchar](255) NULL,
		[kurssi_suorituskieli] [nvarchar](255) NULL,
		[kurssit_laajuus] [float] NULL,
		[kurssit_laajuus_all_suorituskieli] [float] NULL,
		[kurssit_S_arvosanat_laajuus] [float] NULL
	) ON [PRIMARY]
END
