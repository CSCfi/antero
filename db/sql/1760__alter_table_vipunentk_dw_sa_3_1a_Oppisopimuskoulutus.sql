USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[sa_3_1a_Oppisopimuskoulutus]    Script Date: 6.7.2018 15:40:37 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_1a_Oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[sa_3_1a_Oppisopimuskoulutus]    Script Date: 6.7.2018 15:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_1a_Oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_3_1a_Oppisopimuskoulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[ikar2] [nvarchar](2) NULL,
	[opmala] [nvarchar](1) NULL,
	[opmast] [nvarchar](2) NULL,
	[iscfibroad2013] [nvarchar](2) NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[kmaak] [nvarchar](2) NULL,
	[ptoim1r3] [nvarchar](2) NULL,
	[amas] [nvarchar](1) NULL,
	[tyansek] [nvarchar](1) NULL,
	[tol2002] [nvarchar](1) NULL,
	[tol2008] [nvarchar](1) NULL,
	[koko] [nvarchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]



