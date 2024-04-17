USE [ANTERO]
GO

/****** Object:  Table [dw].[f_indikaattorit_kk_4v]    Script Date: 17.4.2024 12:08:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_indikaattorit_kk_4v]') AND type in (N'U'))
DROP TABLE [dw].[f_indikaattorit_kk_4v]
GO

/****** Object:  Table [dw].[f_indikaattorit_kk_4v]    Script Date: 17.4.2024 12:08:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_indikaattorit_kk_4v](
	[tilastovuosi] [int] NOT NULL,
	[organisaatio_koodi] [varchar](10) NOT NULL,
	[arvo] [float] NOT NULL,
	[arvo_sektori] [float] NOT NULL,
	[indikaattori] [varchar](max) NOT NULL,
	[nelivuotiskausi] [varchar](9) NOT NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [ANTERO]
