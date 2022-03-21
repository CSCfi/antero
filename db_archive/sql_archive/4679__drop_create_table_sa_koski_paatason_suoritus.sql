USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_paatason_suoritus]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[sa_koski_paatason_suoritus]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_paatason_suoritus]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_paatason_suoritus](
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koulutustyyppi] [varchar](max) NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_yksikko] [varchar](max) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[arviointi_arvosana_koodiarvo] [varchar](max) NULL,
	[arviointi_arvosana_koodisto] [varchar](max) NULL,
	[arviointi_hyvaksytty] [bit] NULL,
	[arviointi_paiva] [datetime] NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[toimipiste_nimi] [varchar](256) NULL,
	[data] [varchar](max) NULL,
	[tutkinto_koodiarvo] [varchar](max) NULL,
	[osaamisala_koodiarvo] [varchar](max) NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[koulutussopimusjaksojen_paivat] [int] NULL,
	[oppisopimusjaksojen_paivat] [int] NULL,
	[suorituksen_alkamispaiva] [date] NULL,
	[oppimaara] [varchar](255) NULL,
	[perusteenDiaarinumero] [varchar](255) NULL,
	[suoritustapa_koodi] [varchar](255) NULL,
	[kielikylpykieli_koodi] [varchar](255) NULL,
	[muut_suorituskielet_koodi] [varchar](255) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


END
GO

ALTER TABLE [sa].[sa_koski_paatason_suoritus] ADD  CONSTRAINT [DF__sa_koski_paatason_suoritus_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_paatason_suoritus] ADD  CONSTRAINT [DF__sa_koski_paatason_suoritus_username]  DEFAULT (suser_sname()) FOR [username]
GO


USE ANTERO
