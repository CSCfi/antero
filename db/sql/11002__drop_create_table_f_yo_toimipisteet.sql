USE [ANTERO]
GO

ALTER TABLE [dw].[f_yo_toimipisteet] DROP CONSTRAINT [DF_f_yo_toimipisteet_username]
GO

ALTER TABLE [dw].[f_yo_toimipisteet] DROP CONSTRAINT [DF_f_yo_toimipisteet_loadtime]
GO

/****** Object:  Table [dw].[f_yo_toimipisteet]    Script Date: 5.8.2025 8.10.03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_yo_toimipisteet]') AND type in (N'U'))
DROP TABLE [dw].[f_yo_toimipisteet]
GO

/****** Object:  Table [dw].[f_yo_toimipisteet]    Script Date: 5.8.2025 8.10.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_yo_toimipisteet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_toimipiste_id] [int] NOT NULL,
	[d_toimipaikka_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [float] NOT NULL,
	[tutkimusaseman_henkilokunnan_maksimimäärä] [int] NOT NULL,
	[tutkimusaseman_henkilokunnan_minimäärä] [int] NOT NULL,
	[tutkimusaseman_yopymisvuorokaudet] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_toi__3213E83F42C5136C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_yo_toimipisteet] ADD  CONSTRAINT [DF_f_yo_toimipisteet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_toimipisteet] ADD  CONSTRAINT [DF_f_yo_toimipisteet_username]  DEFAULT (suser_sname()) FOR [username]
GO


