USE [ANTERO]
GO

DROP TABLE [dw].[d_horizon_maakoodit]
GO

/****** Object:  Table [dw].[d_horizon_maakoodit]    Script Date: 3.2.2020 15:34:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_maakoodit](
	[eu_koodi] [varchar](2) NULL,
	[iso_koodi] [varchar](4) NULL,
	[Maa] [varchar](44) NULL
) ON [PRIMARY]

GO


