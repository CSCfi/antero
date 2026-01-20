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
  AND name = 'Koul. järjestäjän PILKE-alue (kokeilu)'
)
BEGIN
	ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki]
	ADD [Koul. järjestäjän PILKE-alue (kokeilu)] nvarchar(24)
END
;

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_jarjestaja_linkki]') 
  AND name = 'jarjestys Koul. järjestäjän PILKE-alue (kokeilu)'
)
BEGIN
	ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki]
	ADD [jarjestys Koul. järjestäjän PILKE-alue (kokeilu)] int
END

GO
