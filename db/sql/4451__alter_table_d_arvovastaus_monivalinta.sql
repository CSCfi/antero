USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 23.2.2021 19:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dw' AND TABLE_NAME='d_arvovastaus_monivalinta' AND COLUMN_NAME='jarjestys')
BEGIN
	ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD [jarjestys] [int] NULL
END
