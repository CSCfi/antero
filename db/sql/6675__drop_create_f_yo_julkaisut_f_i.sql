USE [ANTERO]
GO

ALTER TABLE [dw].[f_yo_julkaisut_f_i] DROP CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_username]
GO

ALTER TABLE [dw].[f_yo_julkaisut_f_i] DROP CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_loadtime]
GO

/****** Object:  Table [dw].[f_yo_julkaisut_f_i]    Script Date: 24.11.2022 11:09:59 ******/
DROP TABLE [dw].[f_yo_julkaisut_f_i]
GO

/****** Object:  Table [dw].[f_yo_julkaisut_f_i]    Script Date: 24.11.2022 11:09:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_yo_julkaisut_f_i](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_koulutusala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[tieteenala_lkm] [int] NULL,
	[paatieteenala_lkm] [int] NULL,
	[vuosi] [int] NOT NULL,
	[julkaisujen_maara] [float] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_kot__3213E83F02841AF9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_yo_julkaisut_f_i] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_julkaisut_f_i] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]

