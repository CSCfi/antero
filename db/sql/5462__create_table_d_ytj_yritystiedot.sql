USE [ANTERO]
GO

/****** Object:  Table [dw].[d_ytj_yritystiedot]    Script Date: 18.1.2022 12:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dw].[d_ytj_yritystiedot];

CREATE TABLE [dw].[d_ytj_yritystiedot](
	[id] [int] NOT NULL,
	[ytunnus] [varchar](12) NOT NULL,
	[toiminimi] [varchar](5000) NULL,
	[posti_postinumero] [varchar](64) NULL,
	[posti_maa] [varchar](256) NULL,
	[posti_toimipaikka] [varchar](256) NULL,
	[kaynti_postinumero] [varchar](256) NULL,
	[kaynti_maa] [varchar](256) NULL,
	[kaynti_toimipaikka] [varchar](256) NULL,
	[yrityslopetettu] [int] NULL,
	[yrityslopetettu_pvm] [bigint] NULL,
	[yritysmuoto_seloste] [varchar](5000) NULL,
	[yritysmuoto_koodi] [int] NULL,
	[kotipaikkakunta_seloste] [varchar](5000) NULL,
	[kotipaikkakunta_koodi] [int]  NULL,
	[toimiala_seloste] [varchar](5000) NULL,
	[toimiala_koodi] [varchar] (50) NULL,
	[kieli_seloste] [varchar](5000) NULL,
	[elinkeinotoimintalopetettu_pvm] [bigint] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](26) NOT NULL,
	[username] [nvarchar](55) NULL,

CONSTRAINT [PK_d_ytj_yritystiedot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_ytj_yritystiedot] ADD  CONSTRAINT [DF_d_ytj_yritystiedot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_ytj_yritystiedot] ADD  CONSTRAINT [DF_d_ytj_yritystiedot_username]  DEFAULT (suser_sname()) FOR [username]
GO
