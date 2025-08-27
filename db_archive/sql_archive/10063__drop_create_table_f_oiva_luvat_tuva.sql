USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_tuva]    Script Date: 29.8.2024 15:57:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_oiva_luvat_tuva]') AND type in (N'U'))
DROP TABLE [dw].[f_oiva_luvat_tuva]
GO

/****** Object:  Table [dw].[f_oiva_luvat_tuva]    Script Date: 29.8.2024 15:57:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_tuva](
	[tarkasteluvuosi] [int] NULL,
	[alkup_jarjestamislupa] [nvarchar](255) NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[tarkastelukuukausi] [int] NOT NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_alueluokitus_toiminta_alue_kunta_id] [int] NULL,
	[d_alueluokitus_toiminta_alue_maakunta_id] [int] NULL,
	[d_kytkin_toiminta_alue_koko_maa_id] [int] NULL,
	[d_kytkin_toiminta_alue_koko_maakunta_id] [int] NULL,
	[d_oppilaitoksenopetuskieli_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[opiskelijavuodet] [int] NULL,
	[opiskelijavuodet_sisa] [int] NULL,
	[opiskelijavuodet_vet] [int] NULL
) ON [PRIMARY]