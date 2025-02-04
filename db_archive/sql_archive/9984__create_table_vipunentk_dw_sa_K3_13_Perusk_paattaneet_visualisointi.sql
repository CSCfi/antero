USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_K3_13_Perusk_paattaneet_visualisointi]    Script Date: 13.8.2024 15:10:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K3_13_Perusk_paattaneet_visualisointi]') AND type in (N'U'))
DROP TABLE [dbo].[sa_K3_13_Perusk_paattaneet_visualisointi]
GO

/****** Object:  Table [dbo].[sa_K3_13_Perusk_paattaneet_visualisointi]    Script Date: 13.8.2024 15:10:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_K3_13_Perusk_paattaneet_visualisointi](
	[tilv] [int] NULL,
	[lahde] [nvarchar](3) NULL,
	[kohde] [nvarchar](3) NULL,
	[tilanne_0] [int] NULL,
	[tilanne_1] [int] NULL,
	[tilanne_2] [int] NULL,
	[tilanne_3] [int] NULL,
	[tilanne_4] [int] NULL,
	[tilanne_5] [int] NULL,
	[lkm] [int] NULL,
	[sp] [nvarchar](5) NULL,
	[tutkaskun] [nvarchar](5) NULL,
	[jaksot] [int] NULL
) ON [PRIMARY]

GO
