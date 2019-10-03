USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:39:40 ******/
DROP TABLE IF EXISTS [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:39:40 ******/
DROP TABLE IF EXISTS [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilv] [varchar](4) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunsama] [varchar](1) NULL,
	[oleskelux] [varchar](1) NULL,
	[muuttov] [varchar](4) NULL,
	[aikielir4] [varchar](2) NULL,
	[kansalr3] [varchar](3) NULL,
	[svaltr3] [varchar](3) NULL,
	[svaltr3_aiti] [varchar](3) NULL,
	[svaltr3_isa] [varchar](3) NULL,
	[htok] [varchar](1) NULL,
	[klajir1] [varchar](2) NULL,
	[ophal] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[iscfinarrow2013] [varchar](5) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[alvv] [varchar](4) NULL,
	[olosyys] [varchar](1) NULL,
	[maassaolo] [varchar](1) NULL,
	[osatutk] [varchar](1) NULL,
	[uusi] [int] NULL,
	[opisk] [int] NULL,
	[tutk] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilv] [varchar](4) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunsama] [varchar](1) NULL,
	[oleskelux] [varchar](1) NULL,
	[muuttov] [varchar](4) NULL,
	[aikielir4] [varchar](2) NULL,
	[kansalr3] [varchar](3) NULL,
	[svaltr3] [varchar](3) NULL,
	[svaltr3_aiti] [varchar](3) NULL,
	[svaltr3_isa] [varchar](3) NULL,
	[htok] [varchar](1) NULL,
	[klajir1] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[opmopa] [varchar](3) NULL,
	[iscfinarrow2013] [varchar](5) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[alvv] [varchar](4) NULL,
	[olosyys] [varchar](1) NULL,
	[maassaolo] [varchar](1) NULL,
	[osatutk] [varchar](1) NULL,
	[uusi] [int] NULL,
	[opisk] [int] NULL,
	[tutk] [int] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]