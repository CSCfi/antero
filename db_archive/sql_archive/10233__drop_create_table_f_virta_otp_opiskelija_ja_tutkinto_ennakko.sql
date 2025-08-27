USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 16.10.2024 9:05:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 16.10.2024 9:05:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opiskelija_ja_tutkinto_ennakko](
	[tilastovuosi] [varchar](4) NULL,
	[aloitusvuosi] [int] NULL,
	[kirjoihintulovuosi] [varchar](4) NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kytkin_ensikertalainen_id] [int] NULL,
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
	[opyht] [int] NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [int] NULL,
	[d_tk_koulutustyyppi_id] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]
