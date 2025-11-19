USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_tase_ja_tunnusluvut]    Script Date: 19.11.2025 12.02.38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tase_ja_tunnusluvut]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tase_ja_tunnusluvut]
GO

/****** Object:  Table [dw].[f_amos_tase_ja_tunnusluvut]    Script Date: 19.11.2025 12.02.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tase_ja_tunnusluvut](
	[vuosi] [float] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[omistajatyyppi_nimi] [varchar](100) NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[vos_rahoitus] [float] NOT NULL,
	[toimintatuotot_vos] [float] NOT NULL,
	[toimintakulut] [float] NOT NULL,
	[toimintakate] [float] NOT NULL,
	[poistot_arvonalen] [float] NOT NULL,
	[investoinnit] [float] NOT NULL,
	[ylialijaama] [float] NOT NULL,
	[taseen_loppusumma] [float] NOT NULL,
	[oma_paaoma] [float] NOT NULL,
	[rahoitusomaisuus] [float] NOT NULL,
	[edel_ylialijaama] [float] NOT NULL,
	[poistoero_vapaaehtvar] [float] NOT NULL,
	[vieras_paaoma] [float] NOT NULL,
	[lyhyt_vieras_paaoma] [float] NOT NULL,
	[rahoitustuotot] [float] NOT NULL,
	[rahoituskulut] [float] NOT NULL
) ON [PRIMARY]