USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_jtp_tieteenalat]    Script Date: 7.6.2023 12:07:23 ******/
DROP TABLE IF EXISTS [dw].[f_virta_jtp_tieteenalat]
GO

/****** Object:  Table [dw].[f_virta_jtp_tieteenalat]    Script Date: 7.6.2023 12:07:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_jtp_tieteenalat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[julkaisunTunnus] [varchar](50) NULL,
	[d_organisaatio_id] [int] NOT NULL,
	[d_virtajtpsektori_id] [int] NOT NULL,
	[d_julkaisufoorumitaso_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_rinnakkaistallennusKytkin_id] [int] NULL,
	[d_avoinSaatavuus_id] [int] NULL,
	[d_julkaisufoorumitaso_vanha_id] [int] NULL,
	[d_julkaisufoorumitaso_uusi_id] [int] NULL,
	[jufoid] [nvarchar](10) NULL,
	[d_tieteenala_1_id] [int] NULL,
	[d_tieteenala_2_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_virta_jtp_tieteenalat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_jtp_tieteenalat] ADD  CONSTRAINT [DF__f_virta_jtp_tieteenalat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_jtp_tieteenalat] ADD  CONSTRAINT [DF__f_virta_jtp_tieteenalat__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]