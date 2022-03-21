USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_yoarvosanat]    Script Date: 25.10.2019 15:05:38 ******/
DROP TABLE [dw].[f_haku_ja_valinta_yoarvosanat]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_yoarvosanat]    Script Date: 25.10.2019 15:05:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_yoarvosanat](
	[henkiloOID] [nvarchar](255) NULL,
	[valmistumispaivamaara] [nvarchar] (20) NULL,
	[valmistumisvuosi] [int] NULL,
	[d_ytl_aine_id] [int] NULL,
	[d_ytl_aine_laajuus_id] [int] NULL,
	[d_ytl_aine_matikka_id] [int] NULL,
	[kielet_lkm] [int] NULL,
	[reaali_lkm] [int] NULL,
	[l_lkm] [int] NULL,
	[el_lkm] [int] NULL,
	[mel_lkm] [int] NULL,
	[arvosana_kirjain] [nchar](2) NULL,
	[arvosana_numero] [int] NULL,
	[arvosana_keskiarvo] [decimal](4, 2) NULL
) ON [PRIMARY]




