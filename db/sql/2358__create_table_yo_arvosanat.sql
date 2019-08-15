USE [ANTERO]
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_yoarvosanat]    Script Date: 15.8.2019 20:36:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_yoarvosanat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_yoarvosanat](
	[henkiloOID] [nvarchar](255) NULL,
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
END
GO
/****** Object:  Table [dw].[f_ytl_arvosanat]    Script Date: 15.8.2019 20:36:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_ytl_arvosanat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_ytl_arvosanat](
	[opiskelijaID] [bigint] NOT NULL,
	[vuosi] [varchar](max) NULL,
	[d_kausi_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ytl_aine_id] [int] NULL,
	[d_ytl_aine_laajuus_id] [int] NULL,
	[arvosana_kirjain] [varchar](1) NULL,
	[arvosana_numero] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
