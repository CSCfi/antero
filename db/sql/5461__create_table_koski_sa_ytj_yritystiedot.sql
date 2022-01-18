USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_ytj_ytunnus_virheet]    Script Date: 10.1.2022 10:50:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
	(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ytj_yritystiedot]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_ytj_yritystiedot](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[ytunnus] [varchar](256) NOT NULL,
		[toiminimi] [varchar](5000) NULL,
		[posti_postinumero] [varchar](64) NULL,
		[posti_maa] [varchar](256) NULL,
		[posti_toimipaikka] [varchar](256) NULL,
		[kaynti_postinumero] [varchar](256) NULL,
		[kaynti_maa] [varchar](256) NULL,
		[kaynti_toimipaikka] [varchar](256) NULL,
		[yrityslopetettu] [bit] NULL,
		[yrityslopetettu_pvm] [date] NULL,
		[yritysmuoto_seloste] [varchar](5000) NULL,
		[yritysmuoto_koodi] [varchar](256) NULL,
		[kotipaikka_seloste] [varchar](5000) NULL,
		[kotipaikka_koodi] [varchar](256) NULL,
		[toimiala_seloste] [varchar](5000) NULL,
		[toimiala_koodi] [varchar](256) NULL,
		[kieli_seloste] [varchar](5000) NULL,
		[elinkeinotoimintalopetettu_pvm] [date] NULL,
		[imp_created] [datetime] NULL,
		[source] [nvarchar](100) NULL,
		[username] [nvarchar](55) NULL,
		[elinkeino_toiminta] [varchar](256) NULL
	) ON [PRIMARY];


	ALTER TABLE [sa].[sa_ytj_yritystiedot] ADD  CONSTRAINT [DF__sa_ytj_yritystiedot_imp_created]  DEFAULT (getdate()) FOR [imp_created];
	ALTER TABLE [sa].[sa_ytj_yritystiedot] ADD  CONSTRAINT [DF__sa_ytj_yritystiedot_username]  DEFAULT (suser_sname()) FOR [username];
END

USE [ANTERO]
