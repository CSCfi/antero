USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_jtp_tkjulkaisut]    Script Date: 16.4.2018 16:55:20 ******/
DROP TABLE [sa].[sa_virta_jtp_tkjulkaisut]
GO

/****** Object:  Table [sa].[sa_virta_jtp_tkjulkaisut]    Script Date: 16.4.2018 16:55:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_jtp_tkjulkaisut](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[organisaatioTunnus] [nvarchar](50) NULL,
	[ilmoitusVuosi] [int] NULL,
	[julkaisunTunnus] [nvarchar](30) NULL,
	[julkaisunTilakoodi] [int] NULL,
	[julkaisunOrgTunnus] [nvarchar](50) NULL,
	[julkaisuVuosi] [int] NULL,
	[julkaisunNimi] [nvarchar](max) NULL,
	[tekijatiedotTeksti] [nvarchar](max) NULL,
	[tekijoidenLkm] [int] NULL,
	[sivunumeroTeksti] [varchar](100) NULL,
	[artikkelinumero] [varchar](100) NULL,
	[isbn] [varchar](100) NULL,
	[jufoTunnus] [varchar](10) NULL,
	[jufoLuokkaKoodi] [varchar](2) NULL,
	[julkaisumaaKoodi] [varchar](3) NULL,
	[lehdenNimi] [nvarchar](max) NULL,
	[issn] [varchar](100) NULL,
	[volyymiTeksti] [varchar](200) NULL,
	[lehdenNumeroTeksti] [varchar](100) NULL,
	[konferenssinNimi] [nvarchar](max) NULL,
	[kustantajanNimi] [nvarchar](max) NULL,
	[kustannuspaikkaTeksti] [nvarchar](max) NULL,
	[emojulkaisunNimi] [nvarchar](max) NULL,
	[emojulkaisunToimittajatTeksti] [nvarchar](max) NULL,
	[julkaisutyyppiKoodi] [nvarchar](10) NULL,
	[yhteisjulkaisuKVKytkin] [varchar](2) NULL,
	[yhteisjulkaisuSHPKytkin] [varchar](2) NULL,
	[yhteisjulkaisuTutkimuslaitosKytkin] [varchar](2) NULL,
	[yhteisjulkaisuMuuKytkin] [varchar](2) NULL,
	[julkaisunKansainvalisyysKytkin] [varchar](2) NULL,
	[julkaisunKieliKoodi] [varchar](2) NULL,
	[avoinSaatavuusKoodi] [varchar](2) NULL,
	[evoJulkaisunKytkin] [varchar](2) NULL,
	[doi] [nvarchar](max) NULL,
	[pysyvaOsoiteTeksti] [nvarchar](max) NULL,
	[lahdetietokannanTunnus] [nvarchar](max) NULL,
	[latausId] [varchar](30) NULL,
	[yhteisjulkaisuId] [varchar](30) NULL,
	[rinnakkaistallennusKytkin] [varchar](2) NULL,
	[yhteisjulkaisunTunnus] [nvarchar](20) NULL,
	[juuliOsoiteTeksti] [nvarchar](max) NULL,
	[yhteisjulkaisuYritysKytkin] [varchar](2) NULL,
	[jufoId] [varchar](30) NULL,
	[hankeTKs] [nvarchar](max) NULL,
	[avainsanaTKs] [nvarchar](max) NULL,
	[isbnTKs] [nvarchar](max) NULL,
	[issnTKs] [nvarchar](max) NULL,
	[koulutusalaTKs] [nvarchar](max) NULL,
	[orgYksikkoTKs] [nvarchar](max) NULL,
	[tekijaTKs] [nvarchar](max) NULL,
	[tieteenalaTKs] [nvarchar](max) NULL,
	[taiteenalaTKs] [nvarchar](max) NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_jtp_tkjulkaisut__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_jtp_tkjulkaisut__username]  DEFAULT (suser_name()),
	[orgSektori] [int] NULL,
	[kasvatusalat_1] [varchar](20) NULL,
	[taiteet_ja_kulttuurialat_2] [varchar](20) NULL,
	[humanistiset_alat_3] [varchar](20) NULL,
	[yhteiskunnalliset_alat_4] [varchar](20) NULL,
	[kauppa_hallinto_ja_oikeustieteet_5] [varchar](20) NULL,
	[luonnontieteet_6] [varchar](20) NULL,
	[tietojenkasittely_ja_tietoliikenne_7] [varchar](20) NULL,
	[tekniikan_alat_8] [varchar](20) NULL,
	[maa_ja_metsatalousalat_9] [varchar](20) NULL,
	[laaketieteet_10] [varchar](20) NULL,
	[terveys_ja_hyvinvointialat_11] [varchar](20) NULL,
	[palvelualat_12] [varchar](20) NULL,
	[jufoLuokkaVanha] [nvarchar](5) NULL,
	[jufoLuokkaUusi] [nvarchar](5) NULL,
	[alayksikko] [nvarchar](500) NULL,
 CONSTRAINT [PK__sa_virta_jtp_tkjulkaisut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


