USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_hakeneet_kk_hakutoiveet]    Script Date: 22.1.2019 18:51:24 ******/
DROP TABLE [sa].[sa_hakeneet_kk_hakutoiveet]
GO

/****** Object:  Table [sa].[sa_hakeneet_kk_hakutoiveet]    Script Date: 22.1.2019 18:51:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_hakeneet_kk_hakutoiveet](
	[hakemusoid] [varchar](255) NULL,
	[hakukohdeOID1] [varchar](255) NULL,
	[organisaatioOID1] [varchar](255) NULL,
	[hakukohdeOID2] [varchar](255) NULL,
	[organisaatioOID2] [varchar](255) NULL,
	[hakukohdeOID3] [varchar](255) NULL,
	[organisaatioOID3] [varchar](255) NULL,
	[hakukohdeOID4] [varchar](255) NULL,
	[organisaatioOID4] [varchar](255) NULL,
	[hakukohdeOID5] [varchar](255) NULL,
	[organisaatioOID5] [varchar](255) NULL,
	[hakukohdeOID6] [varchar](255) NULL,
	[organisaatioOID6] [varchar](255) NULL
) ON [PRIMARY]

