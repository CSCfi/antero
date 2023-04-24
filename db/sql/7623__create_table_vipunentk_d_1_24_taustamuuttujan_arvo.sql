USE [VipunenTK]
GO

DROP TABLE IF EXISTS  [dbo].[d_1_24_taustamuuttujan_arvo]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_1_24_taustamuuttujan_arvo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[perusjoukko] [nvarchar](100) NULL,
	[perusjoukko_FI] [nvarchar](100) NULL,
	[perusjoukko_SV] [nvarchar](100) NULL,
	[perusjoukko_EN] [nvarchar](100) NULL,
	[taustamuuttuja] [nvarchar](100) NULL,
	[taustamuuttuja_FI] [nvarchar](100) NULL,
	[taustamuuttuja_SV] [nvarchar](100) NULL,
	[taustamuuttuja_EN] [nvarchar](100) NULL,
	[taustamuuttujan_arvo] [nvarchar](100) NULL,
	[taustamuuttujan_arvo_FI] [nvarchar](100) NULL,
	[taustamuuttujan_arvo_SV] [nvarchar](100) NULL,
	[taustamuuttujan_arvo_EN] [nvarchar](100) NULL,
	[taustamuuttuja_2] [nvarchar](100) NULL,
	[taustamuuttuja_2_FI] [nvarchar](100) NULL,
	[taustamuuttuja_2_SV] [nvarchar](100) NULL,
	[taustamuuttuja_2_EN] [nvarchar](100) NULL,
	[taustamuuttujan_2_arvo] [nvarchar](100) NULL,
	[taustamuuttujan_2_arvo_FI] [nvarchar](100) NULL,
	[taustamuuttujan_2_arvo_SV] [nvarchar](100) NULL,
	[taustamuuttujan_2_arvo_EN] [nvarchar](100) NULL,
	[jarjestys] [int] NULL,
	[jarjestys2] [int] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](100) NULL,
	[kommentti] [nvarchar](50) NULL,
 CONSTRAINT [PK__d_1_24_taustamuuttujan_arvo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[d_1_24_taustamuuttujan_arvo] ADD  CONSTRAINT [DF__d_1_24_taustamuuttujan_arvo__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]

ALTER TABLE [dbo].[d_1_24_taustamuuttujan_arvo] ADD  CONSTRAINT [DF__d_1_24_taustamuuttujan_arvo__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]

ALTER TABLE [dbo].[d_1_24_taustamuuttujan_arvo] ADD  CONSTRAINT [DF__d_1_24_taustamuuttujan_arvo__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
