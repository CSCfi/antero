USE  ANTERO

DROP TABLE IF EXISTS [sa].[sa_kouta_koulutus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_kouta_koulutus]
(
  [id] BIGINT  IDENTITY(0,1) NOT NULL,
  [koulutusOid] VARCHAR(100) NULL,
  [toteutusOid] VARCHAR(100) NULL,
  [koulutustyyppi] VARCHAR(100) NULL,
  [koulutuksetKoodi] VARCHAR(10) NULL,
  [opintojenLaajuusKoodi] VARCHAR(50) NULL,
  [koulutusalaKoodiUrit] VARCHAR(500) NULL,
  [organisaatioOid] VARCHAR(100) NULL,
  [nimi_fi] VARCHAR(500) NULL,
  [nimi_sv] VARCHAR(500) NULL,
  [nimi_en] VARCHAR(500) NULL,
  [alkamiskausiKoodiUri] VARCHAR(500) NULL,
  [alkamisvuosi] VARCHAR(100) NULL,
  [alkamiskausityyppi] VARCHAR(100) NULL,
  [johtaaTutkintoon] VARCHAR(100) NULL,
  [kielivalinta] VARCHAR(100) NULL,
  [metadata] VARCHAR(MAX) NULL,
  [ePerusteId] VARCHAR(100) NULL,
  [tila] VARCHAR(100) NULL,
  [modified] VARCHAR(100) NULL,
  [muokkaaja] VARCHAR(100) NULL,
  [source] VARCHAR(300) NULL,
  [loadtime] datetime NULL,
  [username] VARCHAR(100) NULL,
  CONSTRAINT [PK__sa_kouta_koulutus] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_kouta_koulutus] ADD  CONSTRAINT [DF_sa_kouta_koulutus_loadtime]  DEFAULT (getdate())  FOR [loadtime]
GO

ALTER TABLE [sa].[sa_kouta_koulutus] ADD  CONSTRAINT [DF_sa_kouta_koulutus_username]  DEFAULT (suser_sname()) FOR [username]
GO
