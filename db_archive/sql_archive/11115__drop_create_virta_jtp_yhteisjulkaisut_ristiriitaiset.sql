USE [ANTERO]
GO

ALTER TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset] DROP CONSTRAINT [DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__username]
GO

ALTER TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset] DROP CONSTRAINT [DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__loadtime]
GO

/****** Object:  Table [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset]    Script Date: 11.2.2020 17:41:53 ******/
DROP TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset]
GO

/****** Object:  Table [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset]    Script Date: 11.2.2020 17:41:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[rrID] [bigint] NULL,
	[yhteisjulkaisunTunnus] [nvarchar](max) NULL,
	[julkaisunTunnus] [nvarchar](max) NULL,
	[organisaatioNimi] [nvarchar](max) NULL,
	[organisaatioTunnus] [nvarchar](max) NULL,
	[julkaisuVuosi] [int] NULL,
	[ilmoitusVuosi] [int] NULL,
	[julkaisunNimi] [nvarchar](max) NULL,
	[ristiriitainenTieto] [nvarchar](max) NULL,
	[julkaisunOrgTunnus] [nvarchar](max) NULL,
	[liittyvaJulkaisunOrgTunnus] [nvarchar](max) NULL,
	[kuvaus] [nvarchar](max) NULL,
	[luontipaivamaara] [datetime2](0) NULL,
	[tila] [int] NULL,
 CONSTRAINT [PK__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset] ADD  CONSTRAINT [DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset] ADD  CONSTRAINT [DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__username]  DEFAULT (suser_name()) FOR [username]
GO
