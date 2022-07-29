USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_allfields_codes]    Script Date: 27.4.2022 10:50:43 ******/
DROP TABLE [dw].[f_eter_allfields_codes]
GO

/****** Object:  Table [dw].[f_eter_allfields_codes]    Script Date: 27.4.2022 10:50:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_allfields_codes](
	[ID] [int] NOT NULL,
	[name] [varchar](40) NULL,
	[code] [varchar](2) NULL,
	[value] [varchar](86) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]