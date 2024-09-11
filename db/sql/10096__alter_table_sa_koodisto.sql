USE [ANTERO]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  TABLE [sa].[sa_koodistot] ALTER COLUMN   [nimi] [nvarchar](1000) NULL;
ALTER  TABLE [sa].[sa_koodistot] ALTER COLUMN 	[nimi_sv] [nvarchar](1000) NULL;
ALTER  TABLE [sa].[sa_koodistot] ALTER COLUMN 	[nimi_en] [nvarchar](1000) NULL;

GO
