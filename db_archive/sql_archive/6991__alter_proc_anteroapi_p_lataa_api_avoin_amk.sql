USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_avoin_amk]    Script Date: 31.1.2023 11:50:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_avoin_amk] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_avoin_amk_esilataus]
END

IF ((((	select count (*) from (
		select	[tilastovuosi], [sukupuoli], [okm_ohjauksen_ala], [koulutusala], [ammattikorkeakoulu], [osallistuneet],
				[opintopisteet_yht], [opintopisteet_amk], [opintopisteet_kansalaisopistot], [opintopisteet_kansanopistot], 
				[opintopisteet_kesayo], [opintopisteet_muut], [opintopisteet_yo], [sektori], [koodit_ammattikorkeakoulu], 
				[koodit_sukupuoli], [koodit_okm_ohjauksen ala], [koodit_koulutusala]
		from [dw].[api_avoin_amk] s
		except
		select	[tilastovuosi], [sukupuoli], [okm_ohjauksen_ala], [koulutusala], [ammattikorkeakoulu], [osallistuneet],
				[opintopisteet_yht], [opintopisteet_amk], [opintopisteet_kansalaisopistot], [opintopisteet_kansanopistot], 
				[opintopisteet_kesayo], [opintopisteet_muut], [opintopisteet_yo], [sektori], [koodit_ammattikorkeakoulu], 
				[koodit_sukupuoli], [koodit_okm_ohjauksen ala], [koodit_koulutusala]
		from [api].[avoin_amk]) s ) > 0)
		or
		((select count(*) from [api].[avoin_amk]) <> (select count(*) from [dw].[api_avoin_amk])))
		and
		(select count(*) from [dw].[api_avoin_amk]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
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
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_avoin_amk]

END

IF ((select count(*) from [dw].[api_avoin_amk]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
 
GO

USE [ANTERO]