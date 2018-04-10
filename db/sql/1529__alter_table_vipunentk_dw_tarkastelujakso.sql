USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[d_tarkastelujakso]    Script Date: 10.4.2018 14:34:15 ******/
DROP TABLE IF EXISTS [dbo].[d_tarkastelujakso]
GO
/****** Object:  Table [dbo].[d_tarkastelujakso]    Script Date: 10.4.2018 14:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tarkastelujakso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tarkastelujakso](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso] [nvarchar](100) NULL,
	[tarkastelujakso_SV] [nvarchar](100) NULL,
	[tarkastelujakso_EN] [nvarchar](100) NULL,
	[tarkastelujakso2] [nvarchar](100) NULL,
	[tarkastelujakso2_SV] [nvarchar](100) NULL,
	[tarkastelujakso2_EN] [nvarchar](100) NULL,
	[jaksovuosi] [int] NULL,
	[jaksokausi] [int] NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[sijoittuminen 0_5 - 5_0 vuotta] [nvarchar](100) NULL,
	[sijoittuminen 1_0 - 5_5 vuotta] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]