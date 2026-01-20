USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN [selite_fi] [varchar](500) NOT NULL;

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN 	[selite_sv] [varchar](500) NULL;

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN 	[selite_en] [varchar](500) NULL;

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN 	[selite2_fi] [varchar](500) NULL;

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN 	[selite2_sv] [varchar](500) NULL;

ALTER TABLE [dw].[d_opetustehtava] ALTER COLUMN 	[selite2_en] [varchar](500) NULL;
GO
