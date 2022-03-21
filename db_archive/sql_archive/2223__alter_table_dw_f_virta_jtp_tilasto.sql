USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_jtp_tilasto] DROP CONSTRAINT [DF__f_virta_jtp_tilasto__username]
GO

ALTER TABLE [dw].[f_virta_jtp_tilasto] DROP CONSTRAINT [DF__f_virta_jtp_tilasto__loadtime]
GO

/****** Object:  Table [dw].[f_virta_jtp_tilasto]    Script Date: 6.5.2019 14:59:35 ******/
DROP TABLE [dw].[f_virta_jtp_tilasto]
GO

/****** Object:  Table [dw].[f_virta_jtp_tilasto]    Script Date: 6.5.2019 14:59:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_jtp_tilasto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[julkaisunTunnus] [varchar](50) NULL,
	[yhteisjulkaisunTunnus] [varchar](50) NULL,
	[yhteisjulkaisuId] [varchar](50) NULL,
	[d_virtajtpsektori_id] [int] NOT NULL,
	[d_organisaatio_id] [int] NOT NULL,
	[d_julkaisufoorumitaso_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_kansainvalinen_yhteisjulkaisu_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[d_taiteenala_id] [int] NOT NULL,
	[d_taidealantyyppikategoria_id] [int] NOT NULL,
	[lkm] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_koulutusala95_id] [int] NOT NULL,
	[d_koulutusala02_id] [int] NOT NULL,
	[d_yhteisjulkaisuSHPKytkin_id] [int] NULL,
	[d_yhteisjulkaisuTutkimuslaitosKytkin_id] [int] NULL,
	[d_yhteisjulkaisuMuuKytkin_id] [int] NULL,
	[d_yhteisjulkaisuYritysKytkin_id] [int] NULL,
	[d_rinnakkaistallennusKytkin_id] [int] NULL,
	[d_avoinSaatavuus_id] [int] NULL,
	[lukumaara] [decimal](6, 5) NOT NULL,
	[d_julkaisufoorumitaso_vanha_id] [int] NULL,
	[d_julkaisufoorumitaso_uusi_id] [int] NULL,
	[jufoid] [nvarchar](10) NULL,
 CONSTRAINT [PK__f_virta_jtp_tilasto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_jtp_tilasto] ADD  CONSTRAINT [DF__f_virta_jtp_tilasto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_jtp_tilasto] ADD  CONSTRAINT [DF__f_virta_jtp_tilasto__username]  DEFAULT (suser_sname()) FOR [username]



