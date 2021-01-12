USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]    Script Date: 12.1.2021 14:00:19 ******/
DROP TABLE [dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]
GO

/****** Object:  Table [dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]    Script Date: 12.1.2021 14:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat](
	[tilv] [varchar](4) NULL,
	[tyovoima] [varchar](15) NULL,
	[sp] [varchar](2) NULL,
	[ikar3] [varchar](5) NULL,
	[opmast] [varchar](5) NULL,
	[opmopa] [varchar](5) NULL,
	[kaste_t2] [varchar](5) NULL,
	[iscfinarrow2013] [varchar](5) NULL,
	[amm2010] [varchar](5) NULL,
	[amm2001] [varchar](5) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]
