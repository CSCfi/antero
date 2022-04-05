USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [ANTERO]
GO
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisaatio_fi] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisaatio_sv] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisatio_en] [nvarchar](500) NULL
