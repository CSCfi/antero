USE [ANTERO]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 14.3.2023 22:39:12 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 14.3.2023 22:39:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot](
	[oppija_oid] [varchar](50) NULL,
	[max_ajankohta] [date] NULL,
	[koodit_koulutusnimike_hv_opiskelutiedot] [varchar](6) NULL,
	[tilastovuosi] [int] NULL,
	[Opiskelun tarkasteluhetki] [nvarchar](46) NOT NULL,
	[Täyttänyt 18 v. (opiskelun tarkasteluhetki)] [varchar](39) NULL,
	[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)] [varchar](5) NOT NULL,
	[Koulutustyyppi (opiskelun tarkasteluhetki)] [nvarchar](255) NULL,
	[Koulutusmuoto (opiskelun tarkasteluhetki)] [varchar](200) NULL,
	[Suorituksen tyyppi (opiskelun tarkasteluhetki)] [varchar](200) NULL,
	[jarjestys_opiskelun_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] [int] NULL
) ON [PRIMARY]

GO


