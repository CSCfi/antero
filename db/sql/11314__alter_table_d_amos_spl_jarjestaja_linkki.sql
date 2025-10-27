USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_jarjestaja_linkki]') 
  AND name = 'Toiminnanohjauksen kokeilu'
)
BEGIN
	ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki]
	ADD [Toiminnanohjauksen kokeilu] nvarchar(50)
END
;

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_jarjestaja_linkki]') 
  AND name = 'jarjestys Toiminnanohjauksen kokeilu'
)
BEGIN
	ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki]
	ADD [jarjestys Toiminnanohjauksen kokeilu] int
END

GO
