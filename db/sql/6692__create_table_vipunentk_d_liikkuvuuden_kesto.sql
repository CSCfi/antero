USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_liikkuvuuden_kesto]    Script Date: 25.11.2022 16:11:59 ******/
DROP TABLE IF EXISTS [dbo].[d_liikkuvuuden_kesto]
GO

/****** Object:  Table [dbo].[d_liikkuvuuden_kesto]    Script Date: 25.11.2022 16:11:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_liikkuvuuden_kesto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[liikkuvuuden_kesto_koodi] [nvarchar](2) NULL,
	[liikkuvuuden_kesto] [nvarchar](50) NULL,
	[liikkuvuuden_kesto_SV] [nvarchar](50) NULL,
	[liikkuvuuden_kesto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_liikkuvuuden_kesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

