USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[vst_mittari_map_taide]    Script Date: 20.4.2026 14.35.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vst_mittari_map_taide]') AND type in (N'U'))

CREATE TABLE [dbo].[vst_mittari_map_taide](
	[tkmittari_koodi] [nvarchar](10) NULL,
	[luotu] [date] NULL,
	[mittari_koodi] [nvarchar](10) NULL,
	[sisalto_koodi] [nvarchar](10) NULL,
	[oppimaara_koodi] [nvarchar](2) NULL,
	[sukupuoli_koodi] [nvarchar](2) NULL,
	[ika_koodi] [nvarchar](10) NULL,
	[kieli_koodi] [nvarchar](2) NULL,
	[aineiston_osa] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL
) ON [PRIMARY]
GO


