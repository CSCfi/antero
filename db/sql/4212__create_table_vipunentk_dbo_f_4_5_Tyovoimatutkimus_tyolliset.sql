USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_4_5_Tyovoimatutkimus_tyolliset]    Script Date: 8.1.2021 10:34:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_5_Tyovoimatutkimus_tyolliset]') AND type in (N'U'))

BEGIN

CREATE TABLE [dbo].[f_4_5_Tyovoimatutkimus_tyolliset](
	[tilastovuosi] [nvarchar](4) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[ammattiluokitus_2001_id] [int] NULL,
	[ammattiluokitus_2001] [nvarchar](10) NULL,
	[ammattiluokitus_2010_id] [int] NULL,
	[ammattiluokitus_2010] [nvarchar](10) NULL,
	[toimiala_2008_id] [int] NULL,
	[toimiala_2008] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](14) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]