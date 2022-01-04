USE  ANTERO

DROP TABLE IF EXISTS [sa].[sa_kouta_haku]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_kouta_haku]
(
 [id] BIGINT  IDENTITY(0,1) NOT NULL,
 [hakuOid] VARCHAR(100) NULL,
 [organisaatioOid] VARCHAR(100) NULL,
 [nimi_fi] VARCHAR(500) NULL,
 [nimi_sv] VARCHAR(500) NULL,
 [nimi_en] VARCHAR(500) NULL,
 [hakuaika_alku] datetime NULL,
 [hakuaika_loppu] datetime NULL,
 [hakutapaKoodiUri] VARCHAR(100) NULL,
 [hakulomaketyyppi] VARCHAR(100) NULL,
 [ataru] VARCHAR(100) NULL,
 [hakulomakeAtaruId] VARCHAR(100) NULL,
 [kohdejoukkoKoodiUri] VARCHAR(100) NULL,
 [kohdejoukonTarkenneKoodiUri] VARCHAR(100) NULL,
 [metadata] VARCHAR(MAX) NULL,
 [alkamiskausiKoodiUri] VARCHAR(100) NULL,
 [alkamisvuosi] VARCHAR(100) NULL,
 [alkamiskausityyppi] VARCHAR(100) NULL,
 [ajastettuJulkaisu] VARCHAR(100) NULL,
 [kielivalinta_fi] VARCHAR(100) NULL,
 [modified] VARCHAR(100) NULL,
 [muokkaaja] VARCHAR(100) NULL,
 [tila] VARCHAR(100) NULL,
 [hakukohteenLiittamisenTakaraja] VARCHAR(100) NULL,
 [source] VARCHAR(100) NULL,
 [loadtime] datetime NULL,
 [username]VARCHAR(100) NULL,
 CONSTRAINT [PK__sa_kouta_haku] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_kouta_haku] ADD  CONSTRAINT [DF_sa_kouta_haku_loadtime]  DEFAULT (getdate())  FOR [loadtime]
GO

ALTER TABLE [sa].[sa_kouta_haku] ADD  CONSTRAINT [DF_sa_kouta_haku_username]  DEFAULT (suser_sname()) FOR [username]
GO
