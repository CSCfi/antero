USE  ANTERO

DROP TABLE IF EXISTS [sa].[sa_kouta_hakukohteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_kouta_hakukohteet]
(
  [id] BIGINT  IDENTITY(0,1) NOT NULL,
  [hakukohdeOid] VARCHAR(100) NULL,
  [hakuOid] VARCHAR(100) NULL,
  [organisaatioOid] VARCHAR(100) NULL,
  [nimi_fi] VARCHAR(MAX) NULL,
  [nimi_sv] VARCHAR(MAX) NULL,
  [nimi_en] VARCHAR(MAX) NULL,
  [tarjoaja] VARCHAR(500) NULL,
  [toteutusOid] VARCHAR(100) NULL,
  [toinenAsteOnkoKaksoistutkinto] VARCHAR(100) NULL,
  [muuPohjakoulutusvaatimus] VARCHAR(100) NULL,
  [kielivalinta] VARCHAR(100) NULL,
  --[valintakokeet] VARCHAR(MAX) NULL,
  [valintaperusteId] VARCHAR(100) NULL,
  [metadata] VARCHAR(MAX) NULL,
  --[hakulomakeAtaruId] VARCHAR(100) NULL,
  --[hakulomakeKuvaus] VARCHAR(MAX) NULL,
  --[hakulomakeLinkki] VARCHAR(MAX) NULL,
  --[hakulomaketyyppi] VARCHAR(100) NULL,
  --[kaytetaanHaunAikataulua] VARCHAR(100) NULL,
  --[kaytetaanHaunHakulomaketta] VARCHAR(100) NULL,
  --[liitteet] VARCHAR(MAX) NULL,
  --[liitteetOnkoSamaToimitusaika] VARCHAR(100) NULL,
  --[liitteetOnkoSamaToimitusosoite] VARCHAR(100) NULL,
  --[liitteidenToimitusaika] VARCHAR(100) NULL,
  --[liitteidenToimitustapa] VARCHAR(100) NULL,
  --[liitteidenToimitusosoite] VARCHAR(1000) NULL,
  [pohjakoulutusvaatimusKoodiUrit] VARCHAR(1500) NULL,
  --[pohjakoulutusvaatimusTarkenne] VARCHAR(MAX) NULL,
  [alkamiskausityyppi] VARCHAR(100) NULL,
  [koulutuksenAlkamispaivamaara] VARCHAR(30) NULL,
  [koulutuksenPaattymispaivamaara] VARCHAR(30) NULL,
  [koulutuksenAlkamiskausiKoodiUri] VARCHAR(100) NULL,
  [koulutuksenAlkamisvuosi] VARCHAR(10) NULL,
  [aloituspaikatLukumaara] INT NULL,
  [aloituspaikatEnsikertalaisille] INT NULL,
  [externalId] VARCHAR(100) NULL,
  [tila] VARCHAR(100) NULL,
  [modified] VARCHAR(100) NULL,
  [muokkaaja] VARCHAR(100) NULL,
  [source] VARCHAR(500) NULL,
  [loadtime] datetime NULL,
  [username] VARCHAR(100) NULL,
  CONSTRAINT [PK__sa_kouta_hakukohteet] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_kouta_hakukohteet] ADD  CONSTRAINT [DF_sa_kouta_hakukohteet_loadtime]  DEFAULT (getdate())  FOR [loadtime]
GO

ALTER TABLE [sa].[sa_kouta_hakukohteet] ADD  CONSTRAINT [DF_sa_kouta_hakukohteet_username]  DEFAULT (suser_sname()) FOR [username]
GO
