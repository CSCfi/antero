USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_taydennyskoulutukset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_taydennyskoulutukset] AS

BEGIN
  EXEC [dw].[p_lataa_api_taydennyskoulutukset_esilataus]
END

IF (select count(*) from [dw].[api_taydennyskoulutukset]) > 0

BEGIN
	  TRUNCATE TABLE [api].[taydennyskoulutukset]

  INSERT INTO [api].[taydennyskoulutukset] (
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Sukupuoli]
    ,[koulutukset]
    ,[osallistuneet]
    ,[Koodit Yliopisto]
    ,[sukupuoli_jarjestys]

     )
  SELECT
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Sukupuoli]
    ,[koulutukset]
    ,[osallistuneet]
    ,[Koodit Yliopisto]
    ,[sukupuoli_jarjestys]

  FROM [dw].[api_taydennyskoulutukset]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
