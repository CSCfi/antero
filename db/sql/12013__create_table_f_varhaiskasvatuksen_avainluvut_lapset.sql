USE [ANTERO]
GO

/****** Object:  Table [dw].[f_varhaiskasvatuksen_avainluvut_lapset]    Script Date: 24.4.2026 13.36.18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varhaiskasvatuksen_avainluvut_lapset]') AND type in (N'U'))
DROP TABLE [dw].[f_varhaiskasvatuksen_avainluvut_lapset]
GO

/****** Object:  Table [dw].[f_varhaiskasvatuksen_avainluvut_lapset]    Script Date: 24.4.2026 13.36.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varhaiskasvatuksen_avainluvut_lapset](
	[tilastovuosi] [int] NULL,
	[ika] [int] NULL,
	[sukupuoli_koodi] [varchar](5) NULL,
	[jarjestamismuotoavain] [varchar](max) NULL,
	[lapset] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]