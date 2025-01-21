USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_perusaste_keskiarvot]    Script Date: 21.1.2025 8.52.58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_perusaste_keskiarvot]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_perusaste_keskiarvot]
GO

/****** Object:  Table [dw].[f_koski_perusaste_keskiarvot]    Script Date: 21.1.2025 8.52.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_perusaste_keskiarvot](
	[oppija_oid] [varchar](150) NOT NULL,
	[vuosi] [int] NOT NULL,
	[keskiarvo] [decimal](10, 5) NULL,
	[keskiarvo_lukuaineet] [decimal](10, 5) NULL
) ON [PRIMARY]

GO


USE [ANTERO]