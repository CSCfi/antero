USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisaatio_vanha_fi] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisaatio_vanha_sv] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organisaatio_vanha_en] [nvarchar](500) NULL
