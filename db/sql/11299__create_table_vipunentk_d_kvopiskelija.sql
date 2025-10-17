USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_kvopiskelija]    Script Date: 17.10.2025 16.48.49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kvopiskelija]') AND type in (N'U'))
  DROP TABLE [dbo].[d_kvopiskelija]
GO

CREATE TABLE [dbo].[d_kvopiskelija](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kvopiskelija_koodi] [nvarchar](10) NULL,
	[kvopiskelija] [nvarchar](250) NULL,
	[kvopiskelija_SV] [nvarchar](250) NULL,
	[kvopiskelija_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[tietolahde] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_kvopiskelija] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


