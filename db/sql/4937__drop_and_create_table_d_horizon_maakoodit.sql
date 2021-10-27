USE [ANTERO]
GO

/****** Object:  Table [dw].[d_horizon_maakoodit]    Script Date: 25.10.2021 8:35:36 ******/
DROP TABLE [dw].[d_horizon_maakoodit]
GO

/****** Object:  Table [dw].[d_horizon_maakoodit]    Script Date: 25.10.2021 8:35:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_maakoodit](
	[eu_koodi] [varchar](2) NULL,
	[iso_koodi] [varchar](4) NULL,
	[Maa] [varchar](44) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

GO


