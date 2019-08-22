USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_odw_hakeneet]    Script Date: 22.8.2019 14:46:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

ALTER TABLE [sa].[sa_odw_hakeneet] 
ADD 
YlinLaskettuValintapistemaara [decimal](18, 2) NULL 

SET ANSI_PADDING OFF
GO