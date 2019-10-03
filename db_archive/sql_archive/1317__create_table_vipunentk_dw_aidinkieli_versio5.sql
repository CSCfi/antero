USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio5]    Script Date: 9.3.2018 9:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aidinkieli_versio5]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aidinkieli_versio5](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aidinkieli_versio5_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio5] [nvarchar](50) NULL,
	[aidinkieli_versio5_SV] [nvarchar](50) NULL,
	[aidinkieli_versio5_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]