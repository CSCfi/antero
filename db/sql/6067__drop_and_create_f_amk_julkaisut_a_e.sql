USE [ANTERO]
GO

ALTER TABLE [dw].[f_amk_julkaisut_a_e] DROP CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_ae_username]
GO

ALTER TABLE [dw].[f_amk_julkaisut_a_e] DROP CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_ae_loadtime]
GO

/****** Object:  Table [dw].[f_amk_julkaisut_a_e]    Script Date: 30.3.2022 20:20:02 ******/
DROP TABLE [dw].[f_amk_julkaisut_a_e]
GO

/****** Object:  Table [dw].[f_amk_julkaisut_a_e]    Script Date: 30.3.2022 20:20:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amk_julkaisut_a_e](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_koulutusala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[tieteenala_koodi] [varchar](5) NOT NULL,
	[d_julkaisufoorumitaso_id] [int] NOT NULL,
	[d_kansainvalinen_yhteisjulkaisu_id] [int] NOT NULL,
	[d_yhteisjulkaisuSHPKytkin_id] [int] NOT NULL,
	[d_yhteisjulkaisuTutkimuslaitosKytkin_id] [int] NOT NULL,
	[d_yhteisjulkaisuMuuKytkin_id] [int] NOT NULL,
	[d_avoinSaatavuus_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[julkaisujen_maara] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_ko] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_amk_julkaisut_a_e] ADD  CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_ae_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_julkaisut_a_e] ADD  CONSTRAINT [DF_f_amk_kotimaiset_julkaisut_ae_username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]