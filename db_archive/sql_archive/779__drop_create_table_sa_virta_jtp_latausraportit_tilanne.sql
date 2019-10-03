USE [ANTERO]
GO

DROP TABLE [sa].[sa_virta_jtp_latausraportit_tilanne]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_virta_jtp_latausraportit_tilanne](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_virta_jtp_latausraportit_tilanne__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_virta_jtp_latausraportit_tilanne__username]  DEFAULT (suser_name()),
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
	[jufoLuokkaKoodi] [nvarchar](1) NULL
 CONSTRAINT [PK__sa_virta_jtp_latausraportit_tilanne] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
