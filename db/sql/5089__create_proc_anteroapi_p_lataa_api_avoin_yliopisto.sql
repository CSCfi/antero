USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_avoin_yliopisto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_avoin_yliopisto] AS

BEGIN
  EXEC [dw].[p_lataa_api_avoin_yliopisto_esilataus]
END

IF (select count(*) from [dw].[api_avoin_yliopisto]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[avoin_yliopisto]

  INSERT INTO [api].[avoin_yliopisto] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[koodit_yliopisto]
      ,[koodit_sukupuoli]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[koodit_yliopisto]
      ,[koodit_sukupuoli]
  FROM [dw].[api_avoin_yliopisto]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO

USE [ANTERO]


