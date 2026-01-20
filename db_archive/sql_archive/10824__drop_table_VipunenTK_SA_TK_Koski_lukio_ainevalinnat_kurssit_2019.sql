USE [VipunenTK_SA]
GO

IF @@SERVERNAME like '%pvipu%' 
BEGIN 
	DROP TABLE  [dbo].[TK_Koski_lukio_ainevalinnat_kurssit_2019]
END
