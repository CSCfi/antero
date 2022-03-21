USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[d_ytj_yritystiedot]
GO

/****** Object:  Table [dw].[d_ytj_yritystiedot]    Script Date: 14.12.2020 17:16:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_ytj_yritystiedot](
	[id] [int] NOT NULL,
	[ytunnus] [varchar](12) NOT NULL,
	[toiminimi] [varchar](256) NULL,
	[posti_postinumero] [varchar](64) NULL,
	[posti_maa] [varchar](256) NULL,
	[posti_toimipaikka] [varchar](256) NULL,
	[kaynti_postinumero] [varchar](256) NULL,
	[kaynti_maa] [varchar](256) NULL,
	[kaynti_toimipaikka] [varchar](256) NULL,
	[yrityslopetettu] [int] NULL,
	[yrityslopetettu_pvm] [bigint] NULL,
	[yritysmuoto_seloste] [varchar](256) NULL,
	[yritysmuoto_koodi] [int] NULL,
	[kotipaikkakunta_seloste] [varchar](256) NULL,
	[kotipaikkakunta_koodi] [int] NULL,
	[toimiala_seloste] [varchar](256) NULL,
	[toimiala_koodi] [varchar](50) NULL,
	[kieli_seloste] [varchar](50) NULL,
	[elinkeinotoimintalopetettu_pvm] [bigint] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](26) NOT NULL
) ON [PRIMARY]

GO
USE ANTERO

