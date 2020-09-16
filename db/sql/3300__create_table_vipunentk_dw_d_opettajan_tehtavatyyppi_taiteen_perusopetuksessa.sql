USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:39:01 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]
GO

/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:39:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO


USE [ANTERO]