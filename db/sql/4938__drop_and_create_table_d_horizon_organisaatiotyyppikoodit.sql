USE [ANTERO]
GO

/****** Object:  Table [dw].[d_horizon_organisaatiotyyppikoodit]    Script Date: 25.10.2021 8:37:18 ******/
DROP TABLE [dw].[d_horizon_organisaatiotyyppikoodit]
GO

/****** Object:  Table [dw].[d_horizon_organisaatiotyyppikoodit]    Script Date: 25.10.2021 8:37:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_organisaatiotyyppikoodit](
	[organisaatiotyyppi_koodi] [varchar](3) NULL,
	[Organisaatiotyyppi] [varchar](97) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
