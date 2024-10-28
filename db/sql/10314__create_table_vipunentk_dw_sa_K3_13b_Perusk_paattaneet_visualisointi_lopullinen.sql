USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen]    Script Date: 25.10.2024 12:53:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen](
	[tilv] [int] NULL,
	[lahde] [nvarchar](3) NULL,
	[kohde] [nvarchar](3) NULL,
	[tilanne_0] [int] NULL,
	[tilanne_1] [int] NULL,
	[tilanne_2] [int] NULL,
	[tilanne_3] [int] NULL,
	[tilanne_4] [int] NULL,
	[tilanne_5] [int] NULL,
	[tilanne_6] [int] NULL,
	[tilanne_7] [int] NULL,
	[lkm] [int] NULL,
	[sp] [nvarchar](5) NULL,
	[tutkaskun] [nvarchar](5) NULL,
	[jaksot] [int] NULL
) ON [PRIMARY]
END
GO


