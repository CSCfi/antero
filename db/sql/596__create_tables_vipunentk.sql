USE [VipunenTK]
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio1]    Script Date: 12.6.2017 13:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_aidinkieli_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_aidinkieli_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](50) NULL,
	[aidinkieli_versio1_SV] [nvarchar](50) NULL,
	[aidinkieli_versio1_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_aidinkieli_versio1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END