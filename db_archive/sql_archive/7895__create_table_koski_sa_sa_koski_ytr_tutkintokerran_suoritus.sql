USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_koski_ytr_tutkintokerran_suoritus]    Script Date: 20.7.2023 12:18:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_ytr_tutkintokerran_suoritus]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_ytr_tutkintokerran_suoritus](
	[ytr_tutkintokerran_suoritus_id] [int] NULL,
	[ytr_tutkintokokonaisuuden_suoritus_id] [int] NULL,
	[paatason_suoritus_id] [int] NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tutkintokerta_koodiarvo] [varchar](20) NULL,
	[vuosi] [int] NULL,
	[vuodenaika_koodiarvo] [varchar](20) NULL,
	[koulutustausta_koodiarvo] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](150) NULL,
	[oppilaitos_kotipaikka] [varchar](150) NULL,
	[oppilaitosnumero] [varchar](50) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]


ALTER TABLE [sa].[sa_koski_ytr_tutkintokerran_suoritus] ADD  CONSTRAINT [DF__sa_koski_ytr_tutkintokerran_suoritus_imp_created]  DEFAULT (getdate()) FOR [imp_created]

ALTER TABLE [sa].[sa_koski_ytr_tutkintokerran_suoritus] ADD  CONSTRAINT [DF__sa_koski_ytr_tutkintokerran_suoritus_username]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]

