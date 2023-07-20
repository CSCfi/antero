USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus]    Script Date: 20.7.2023 12:20:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus](
	[ytr_tutkintokokonaisuuden_suoritus_id] [int] NULL,
	[ytr_kokeen_suoritus_id] [int] NULL,
	[ytr_tutkintokerran_suoritus_id] [int] NULL,
	[sisallytetty] [int] NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]


ALTER TABLE [sa].[sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus] ADD  CONSTRAINT [DF__sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus_imp_created]  DEFAULT (getdate()) FOR [imp_created]


ALTER TABLE [sa].[sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus] ADD  CONSTRAINT [DF__sa_koski_ytr_tutkintokokonaisuuden_kokeen_suoritus_username]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]

