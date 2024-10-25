USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne]    Script Date: 25.10.2024 12:52:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne](
	[tilv] [varchar](4) NULL,
	[tutkaskun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[tilanne_0] [int] NULL,
	[tilanne_1] [int] NULL,
	[tilanne_2] [int] NULL,
	[tilanne_3] [int] NULL,
	[tilanne_4] [int] NULL,
	[tilanne_5] [int] NULL,
	[tilanne_6] [int] NULL,
	[tilanne_7] [int] NULL,
	[luopiskkoulk_1] [varchar](6) NULL,
	[ammopiskkoulk_1] [varchar](6) NULL,
	[amkopiskkoulk_1] [varchar](6) NULL,
	[yoopiskkoulk_1] [varchar](6) NULL,
	[luopiskkoulk_2] [varchar](6) NULL,
	[ammopiskkoulk_2] [varchar](6) NULL,
	[amkopiskkoulk_2] [varchar](6) NULL,
	[yoopiskkoulk_2] [varchar](6) NULL,
	[luopiskkoulk_3] [varchar](6) NULL,
	[ammopiskkoulk_3] [varchar](6) NULL,
	[amkopiskkoulk_3] [varchar](6) NULL,
	[yoopiskkoulk_3] [varchar](6) NULL,
	[luopiskkoulk_4] [varchar](6) NULL,
	[ammopiskkoulk_4] [varchar](6) NULL,
	[amkopiskkoulk_4] [varchar](6) NULL,
	[yoopiskkoulk_4] [varchar](6) NULL,
	[luopiskkoulk_5] [varchar](6) NULL,
	[ammopiskkoulk_5] [varchar](6) NULL,
	[amkopiskkoulk_5] [varchar](6) NULL,
	[yoopiskkoulk_5] [varchar](6) NULL,
	[luopiskkoulk_6] [varchar](6) NULL,
	[ammopiskkoulk_6] [varchar](6) NULL,
	[amkopiskkoulk_6] [varchar](6) NULL,
	[yoopiskkoulk_6] [varchar](6) NULL,
	[luopiskkoulk_7] [varchar](6) NULL,
	[ammopiskkoulk_7] [varchar](6) NULL,
	[amkopiskkoulk_7] [varchar](6) NULL,
	[yoopiskkoulk_7] [varchar](6) NULL,
	[luopiskkoulk_8] [varchar](6) NULL,
	[ammopiskkoulk_8] [varchar](6) NULL,
	[amkopiskkoulk_8] [varchar](6) NULL,
	[yoopiskkoulk_8] [varchar](6) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
END
GO


