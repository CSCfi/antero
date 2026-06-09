USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[katsomusaine]    Script Date: 16.1.2026 16.01.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[katsomusaine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[katsomusaine](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[katsomusaine_koodi] [nvarchar](2) NULL,
	[katsomusaine] [nvarchar](250) NULL,
	[katsomusaine_SV] [nvarchar](250) NULL,
	[katsomusaine_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[katsomusaine] ADD  CONSTRAINT [DF__katsomusaine__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]

ALTER TABLE [dbo].[katsomusaine] ADD  CONSTRAINT [DF__katsomusaine__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]

ALTER TABLE [dbo].[katsomusaine] ADD  CONSTRAINT [DF__katsomusaine__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END
GO


