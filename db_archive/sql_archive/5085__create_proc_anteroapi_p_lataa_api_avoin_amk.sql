USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_avoin_amk]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_avoin_amk] AS

BEGIN
  EXEC [dw].[p_lataa_api_avoin_amk_esilataus]
END

IF (select count(*) from [dw].[api_avoin_amk]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[avoin_amk]

  INSERT INTO [api].[avoin_amk] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[okm_ohjauksen_ala]
      ,[koulutusala]
      ,[ammattikorkeakoulu]
      ,[osallistuneet]
      ,[opintopisteet_yht]
      ,[opintopisteet_amk]
      ,[opintopisteet_kansalaisopistot]
      ,[opintopisteet_kansanopistot]
      ,[opintopisteet_kesayo]
      ,[opintopisteet_muut]
      ,[opintopisteet_yo]
      ,[sektori]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_sukupuoli]
      ,[koodit_okm_ohjauksen ala]
      ,[koodit_koulutusala]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[okm_ohjauksen_ala]
      ,[koulutusala]
      ,[ammattikorkeakoulu]
      ,[osallistuneet]
      ,[opintopisteet_yht]
      ,[opintopisteet_amk]
      ,[opintopisteet_kansalaisopistot]
      ,[opintopisteet_kansanopistot]
      ,[opintopisteet_kesayo]
      ,[opintopisteet_muut]
      ,[opintopisteet_yo]
      ,[sektori]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_sukupuoli]
      ,[koodit_okm_ohjauksen ala]
      ,[koodit_koulutusala]
  FROM [dw].[api_avoin_amk]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO

USE [ANTERO]


