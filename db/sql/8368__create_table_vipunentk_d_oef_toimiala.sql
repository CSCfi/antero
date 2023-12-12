USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_oef_toimiala]    Script Date: 12.12.2023 15:59:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_oef_toimiala') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[d_oef_toimiala](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oef_toimiala_koodi] [nvarchar](10) NULL,
	[oef_toimiala] [nvarchar](250) NULL,
	[oef_toimiala_SV] [nvarchar](250) NULL,
	[oef_toimiala_EN] [nvarchar](250) NULL,
	[jarjestys_oef_toimiala] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_oef_toimiala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

GO


