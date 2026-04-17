USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_koulutusala_vst]    Script Date: 17.4.2026 16.43.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_koulutusala_vst]') AND type in (N'U'))

CREATE TABLE [dbo].[d_koulutusala_vst](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusala_koodi] [nvarchar](10) NULL,
	[koulutusala_taso1] [nvarchar](250) NULL,
	[koulutusala_taso1_SV] [nvarchar](250) NULL,
	[koulutusala_taso1_EN] [nvarchar](250) NULL,
	[koulutusala_taso2] [nvarchar](250) NULL,
	[koulutusala_taso2_SV] [nvarchar](250) NULL,
	[koulutusala_taso2_EN] [nvarchar](250) NULL,
	[taso1_jarjestys] [nvarchar](50) NULL,
	[taso2_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


