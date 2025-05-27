USE [ANTERO]
GO

/****** Object:  Table [dw].[f_indikaattorit_kk]    Script Date: 17.4.2024 12:07:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_indikaattorit_kk]') AND type in (N'U'))
DROP TABLE [dw].[f_indikaattorit_kk]
GO

/****** Object:  Table [dw].[f_indikaattorit_kk]    Script Date: 17.4.2024 12:07:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_indikaattorit_kk](
	[tilastovuosi] [int] NOT NULL,
	[organisaatio_koodi] [varchar](10) NOT NULL,
	[arvo] [float] NOT NULL,
	[arvo_sektori] [float] NOT NULL,
	[indikaattori] [varchar](max) NOT NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [ANTERO]
