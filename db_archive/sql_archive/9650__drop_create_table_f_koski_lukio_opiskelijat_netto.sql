USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_netto]    Script Date: 23.2.2024 8:16:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_lukio_opiskelijat_netto]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_lukio_opiskelijat_netto]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_netto]    Script Date: 23.2.2024 8:16:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_lukio_opiskelijat_netto](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[tavoitetutkinto] [varchar](100) NULL,
	[oppimaara] [varchar](100) NULL,
	[koulutus] [varchar](100) NULL,
	[jarj_tavoitetutkinto] [int] NULL,
	[jarj_koulutus] [int] NULL,
	[jarj_oppimaara] [int] NOT NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kytkin_oppivelvollinen_id] [int] NULL,
	[opiskelijat] [numeric](38, 14) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
GO

USE [ANTERO]