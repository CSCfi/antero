USE [VipunenTK_SA]
GO

/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:12:51 ******/
DROP TABLE IF EXISTS [dbo].[TK_Koski_lukio_ainevalinnat_kurssit]
GO

/****** Object:  Table [dbo].[TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:12:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TK_Koski_lukio_ainevalinnat_kurssit](
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


use antero