USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__tietolahde]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__paattyy]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__alkaa]
GO
/****** Object:  Table [dbo].[koulutustyyppi]    Script Date: 30.1.2019 10:31:14 ******/
DROP TABLE [dbo].[koulutustyyppi]
GO
/****** Object:  Table [dbo].[koulutustyyppi]    Script Date: 30.1.2019 10:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[koulutustyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutustyyppi_koodi] [nvarchar](2) NULL,
	[koulutustyyppi] [nvarchar](50) NULL,
	[koulutustyyppi_SV] [nvarchar](50) NULL,
	[koulutustyyppi_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
USE [ANTERO]