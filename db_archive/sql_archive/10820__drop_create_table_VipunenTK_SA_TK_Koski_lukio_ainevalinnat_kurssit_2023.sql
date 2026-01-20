USE [VipunenTK_SA]
GO

IF @@SERVERNAME like '%pvipu%' 
BEGIN 
	DROP TABLE  [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023];
	CREATE TABLE [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2023](
		[tilastovuosi] [int] NOT NULL,
		[lukuvuosi] [nvarchar](25) NOT NULL,
		[lukukausi] [nvarchar](2) NOT NULL,
		[paatason_suoritus_id] [bigint] NOT NULL,
		[ops_voimaantulo] [nvarchar](50) NULL,
		[lukionoppimaara] [nvarchar](255) NULL,
		[lukionoppimaara_suorituskieli] [nvarchar](50) NULL,
		[katsomusaine_suoritettu_1_0] [int] NULL,
		[toimipiste_oid] [nvarchar](255) NULL,
		[oppilaitos_oid] [nvarchar](255) NULL,
		[koulutustoimija_oid] [nvarchar](255) NULL,
		[sukupuoli] [nvarchar](2) NULL,
		[ylempi_osasuoritus_id] [bigint] NULL,
		[aine_koodisto] [nvarchar](255) NULL,
		[aine] [nvarchar](50) NULL,
		[aine_suorituskieli] [nvarchar](255) NULL,
		[aineenoppimaara_koodisto] [nvarchar](255) NULL,
		[aineenoppimaara] [nvarchar](50) NULL,
		[katsomusaineen_oppimaara_koodisto] [nvarchar](255) NULL,
		[katsomusaineen_oppimaara] [nvarchar](50) NULL,
		[kurssi_koodisto] [nvarchar](255) NULL,
		[kurssi] [nvarchar](255) NULL,
		[kurssi_paikallinen_OPS_0_1] [int] NULL,
		[kurssi_pakollinen_0_1] [int] NULL,
		[kurssi_tyyppi] [nvarchar](255) NULL,
		[kurssi_suorituskieli] [nvarchar](50) NULL,
		[kurssi_arvosana] [nvarchar](50) NULL,
		[lkm] [int] NOT NULL
	) ON [PRIMARY]
END
