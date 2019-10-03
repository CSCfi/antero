USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus]     ******/
DROP TABLE IF EXISTS [dbo].[sa_3_2_Oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_2_Oppisopimuskoulutus]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[sa_3_2_Oppisopimuskoulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[iscfibroad2013] [nvarchar] (2) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[jopmast] [nvarchar](2) NULL,
	[jkaste_t2] [nvarchar] (2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[opmast] [nvarchar](2) NULL,
	[jopmala] [nvarchar](1) NULL,
	[kaste_t2] [nvarchar] (2) NULL,
	[jiscfibroad2013] [nvarchar] (2) NULL
) ON [PRIMARY]
END

GO

USE [ANTERO]
