USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 10.3.2023 9:12:47 ******/
DROP TABLE IF EXISTS [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 10.3.2023 9:12:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko](
	[tilastovuosi] [varchar](4) NULL,
	[kirjoihintulovuosi] [varchar](4) NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_koulutuksen_kieli_id] [bigint] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[opiskelijat_fte] [decimal](18, 1) NULL,
	[aloittaneet] [int] NULL,
	[op55] [varchar](1) NULL,
	[opyht0] [int] NULL,
	[opyht104] [int] NULL,
	[opyht119] [int] NULL,
	[opyht120] [int] NULL,
	[opyht14] [int] NULL,
	[opyht29] [int] NULL,
	[opyht44] [int] NULL,
	[opyht59] [int] NULL,
	[opyht74] [int] NULL,
	[opyht89] [int] NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [int] NULL,
	[d_tk_koulutustyyppi_id] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]