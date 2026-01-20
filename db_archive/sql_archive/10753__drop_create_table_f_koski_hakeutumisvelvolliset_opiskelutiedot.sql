USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 15.4.2025 12.44.47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 15.4.2025 12.44.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot](
	[master_oid] [varchar](50) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[max_ajankohta] [date] NULL,
	[tilastovuosi] [int] NULL,
	[opiskelun_tarkasteluhetki_fi] [nvarchar](46) NOT NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_fi] [varchar](39) NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_fi] [varchar](81) NOT NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_fi] [nvarchar](255) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi] [varchar](200) NULL,
	[erityisopetus_opiskelun_tarkasteluhetki_fi] [varchar](100) NULL,
	[kotikunta_opiskelun_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[kotimaakunta_opiskelun_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_fi] [nvarchar](200) NULL,
	[opiskelun_tarkasteluhetki_sv] [nvarchar](53) NOT NULL,
	[tayttanyt_18_v_opiskelun_tarkasteluhetki_sv] [varchar](49) NULL,
	[opiskelutoiminta_opiskelun_tarkasteluhetki_sv] [varchar](114) NOT NULL,
	[koulutustyyppi_opiskelun_tarkasteluhetki_sv] [nvarchar](255) NULL,
	[koulutusmuoto_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv] [varchar](200) NULL,
	[erityisopetus_opiskelun_tarkasteluhetki_sv] [varchar](100) NULL,
	[kotikunta_opiskelun_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[kotimaakunta_opiskelun_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_sv] [nvarchar](200) NULL,
	[jarjestys_opiskelun_tarkasteluhetki] [varchar](24) NOT NULL,
	[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_erityisopetus_opiskelun_tarkasteluhetki] [int] NULL,
	[jarjestys_kotimaakunta_opiskelun_tarkasteluhetki] [varchar](10) NULL,
	[jarjestys_kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki] [varchar](10) NULL
) ON [PRIMARY]
GO

USE [ANTERO]