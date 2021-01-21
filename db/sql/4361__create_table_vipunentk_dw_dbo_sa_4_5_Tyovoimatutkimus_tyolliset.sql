USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_5_Tyovoimatutkimus_tyolliset]    Script Date: 12.1.2021 12:26:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_5_Tyovoimatutkimus_tyolliset]') AND type in (N'U'))

BEGIN

CREATE TABLE [dbo].[sa_4_5_Tyovoimatutkimus_tyolliset](
	[tilv] [varchar](4) NULL,
	[amm2001] [varchar](5) NULL,
	[amm2010] [varchar](5) NULL,
	[tol2008] [varchar](5) NULL,
	[sp] [varchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]