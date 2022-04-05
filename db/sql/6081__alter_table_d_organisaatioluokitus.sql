USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [ANTERO]
GO
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organidwatio] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organidwatio_sv] [nvarchar](500) NULL
ALTER TABLE [dw].[d_organisaatioluokitus] ALTER COLUMN [organidwatio_en] [nvarchar](500) NULL
