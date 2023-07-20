USE [ANTERO]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 20.7.2023 17:27:17 ******/
DROP TABLE [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 20.7.2023 17:27:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot](
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


