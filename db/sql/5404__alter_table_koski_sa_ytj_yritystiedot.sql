USE [KOSKI_SA]
GO

/****** Object:  Table [dw].[d_kausi]    Script Date: 7.5.2021 2:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(
  SELECT * FROM sys.columns
  WHERE Name = N'elinkeino_toiminta' AND Object_ID = Object_ID(N'sa.sa_ytj_yritystiedot')
)
BEGIN
  ALTER TABLE [sa].[sa_ytj_yritystiedot]
  ADD [elinkeino_toiminta] VARCHAR(256) NULL
END

USE [ANTERO]
