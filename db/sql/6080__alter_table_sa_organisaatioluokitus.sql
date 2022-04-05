USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [ANTERO]
GO
ALTER TABLE [sa].[sa_organisaatioluokitus] ALTER COLUMN [nimi] [nvarchar](500) NULL
ALTER TABLE [sa].[sa_organisaatioluokitus] ALTER COLUMN [nimi_sv] [nvarchar](500) NULL
ALTER TABLE [sa].[sa_organisaatioluokitus] ALTER COLUMN [nimi_en] [nvarchar](500) NULL
ALTER TABLE [sa].[sa_organisaatioluokitus] ALTER COLUMN [osoite] [nvarchar](1000) NULL
