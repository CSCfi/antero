USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_oef_ammatti]    Script Date: 1.11.2023 17:00:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[d_oef_ammatti]
GO

CREATE TABLE [dbo].[d_oef_ammatti](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oef_ammattiryhma1_koodi] [nvarchar](20) NULL,
	[oef_ammattiryhma1] [nvarchar](250) NULL,
	[oef_ammattiryhma1_SV] [nvarchar](250) NULL,
	[oef_ammattiryhma1_EN] [nvarchar](250) NULL,
	[oef_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[oef_ammattiryhma2] [nvarchar](250) NULL,
	[oef_ammattiryhma2_SV] [nvarchar](250) NULL,
	[oef_ammattiryhma2_EN] [nvarchar](250) NULL,
	[oef_ammatti_koodi] [nvarchar](20) NULL,
	[oef_ammatti] [nvarchar](250) NULL,
	[oef_ammatti_SV] [nvarchar](250) NULL,
	[oef_ammatti_EN] [nvarchar](250) NULL,
	[jarjestys_ammattiryhma1] [nvarchar](50) NULL,
	[jarjestys_ammattiryhma2] [nvarchar](50) NULL,
	[jarjestys_ammatti] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]


GO


