
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_yo_julkaisut_a_e]') AND type in (N'U'))
ALTER TABLE [dw].[f_yo_julkaisut_a_e] DROP CONSTRAINT IF EXISTS [DF_f_yo_kotimaiset_julkaisut_ae_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_yo_julkaisut_a_e]') AND type in (N'U'))
ALTER TABLE [dw].[f_yo_julkaisut_a_e] DROP CONSTRAINT IF EXISTS [DF_f_yo_kotimaiset_julkaisut_ae_loadtime]
GO
/****** Object:  Table [dw].[f_yo_julkaisut_a_e]    Script Date: 28.7.2017 14:48:57 ******/
DROP TABLE IF EXISTS [dw].[f_yo_julkaisut_a_e]
GO
/****** Object:  Table [dw].[f_yo_julkaisut_a_e]    Script Date: 28.7.2017 14:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_yo_julkaisut_a_e]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_yo_julkaisut_a_e](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
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
 CONSTRAINT [PK__f_yo_kot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_f_yo_kotimaiset_julkaisut_ae_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_yo_julkaisut_a_e] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_ae_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_f_yo_kotimaiset_julkaisut_ae_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_yo_julkaisut_a_e] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_ae_username]  DEFAULT (suser_sname()) FOR [username]
END

