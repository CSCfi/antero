USE [ANTERO]
GO

/****** Object:  Table [dw].[f_ytl_arvosanat]    Script Date: 27.9.2023 8:18:45 ******/
DROP TABLE [dw].[f_ytl_arvosanat]
GO

/****** Object:  Table [dw].[f_ytl_arvosanat]    Script Date: 27.9.2023 8:18:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_ytl_arvosanat](
	[opiskelijaID] [bigint] NOT NULL,
	[vuosi] [varchar](max) NULL,
	[d_kausi_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ytl_aine_id] [int] NULL,
	[d_ytl_aine_laajuus_id] [int] NULL,
	[arvosana_kirjain] [varchar](1) NULL,
	[arvosana_numero] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


USE [ANTERO]