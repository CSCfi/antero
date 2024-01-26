USE [ANTERO]
GO

ALTER TABLE [sa].[sa_virta_jtp_latausraportit_tilanne] DROP CONSTRAINT IF EXISTS [DF__sa_virta_jtp_latausraportit_tilanne__username]
GO

ALTER TABLE [sa].[sa_virta_jtp_latausraportit_tilanne] DROP CONSTRAINT IF EXISTS [DF__sa_virta_jtp_latausraportit_tilanne__loadtime]
GO

/****** Object:  Table [sa].[sa_virta_jtp_latausraportit_tilanne]    Script Date: 11.1.2023 13:44:47 ******/
DROP TABLE [sa].[sa_virta_jtp_latausraportit_tilanne]
GO

/****** Object:  Table [sa].[sa_virta_jtp_latausraportit_tilanne]    Script Date: 11.1.2023 13:44:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_jtp_latausraportit_tilanne](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[organisaatioNimi] [nvarchar](max) NULL,
	[organisaatioTunnus] [nvarchar](max) NULL,
	[julkaisunNimi] [nvarchar](max) NULL,
	[julkaisuTyyppi] [nvarchar](max) NULL,
	[julkaisunTunnus] [nvarchar](max) NULL,
	[organisaationJulkaisuTunnus] [nvarchar](max) NULL,
	[luontiPaivamaara] [varchar](50) NULL,
	[paivitysPaivamaara] [varchar](50) NULL,
	[tilanneraporttiID] [bigint] NULL,
	[julkaisuVuosi] [int] NULL,
	[ilmoitusVuosi] [int] NULL,
	[julkaisunTila] [int] NULL,
	[jufoTunnus] [nvarchar](10) NULL,
	[jufoLuokkaKoodi] [nvarchar](1) NULL,
	[AvoinSaatavuusJulkaisumaksu] [nvarchar](40) NULL,
	[AvoinSaatavuusJulkaisumaksuVuosi] [int] NULL,
	[JulkaisuKanavaOA] [nvarchar](1) NULL,
	[AvoinSaatavuusKytkin] [nvarchar](1) NULL,
	[LisenssiKoodi] [nvarchar](1) NULL,
	[MuotoKoodi] [nvarchar](1) NULL,
	[YleisoKoodi] [nvarchar](1) NULL,
	[EmojulkaisuntyyppiKoodi] [nvarchar](1) NULL,
	[ArtikkelityyppiKoodi] [nvarchar](1) NULL,
	[VertaisarvioituKytkin] [nvarchar](1) NULL,
	[RaporttiKytkin] [nvarchar](1) NULL,
	[OpinnayteKoodi] [nvarchar](1) NULL,
	[TaidetyyppiKoodi] [nvarchar](1) NULL,
	[AVSovellusTyyppiKoodi] [nvarchar](1) NULL,
 CONSTRAINT [PK__sa_virta_jtp_latausraportit_tilanne] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_jtp_latausraportit_tilanne] ADD  CONSTRAINT [DF__sa_virta_jtp_latausraportit_tilanne__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_jtp_latausraportit_tilanne] ADD  CONSTRAINT [DF__sa_virta_jtp_latausraportit_tilanne__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]

