USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_avoin_yliopisto]    Script Date: 31.1.2023 11:51:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_avoin_yliopisto] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_avoin_yliopisto_esilataus]
END

IF ((((	select count (*) from (
		select	[tilastovuosi], [sukupuoli], [yliopisto], [suorittaneiden_lkm], 
				[koodit_yliopisto], [koodit_sukupuoli]
		from [dw].[api_avoin_yliopisto] s
		except
		select	[tilastovuosi], [sukupuoli], [yliopisto], [suorittaneiden_lkm], 
				[koodit_yliopisto], [koodit_sukupuoli]
		from [api].[avoin_yliopisto]) s ) > 0)
		or
		((select count(*) from [api].[avoin_yliopisto]) <> (select count(*) from [dw].[api_avoin_yliopisto])))
		and
		(select count(*) from [dw].[api_avoin_yliopisto]) > 0)

BEGIN
  
  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[avoin_yliopisto]

  INSERT INTO [api].[avoin_yliopisto] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[koodit_yliopisto]
      ,[koodit_sukupuoli]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[koodit_yliopisto]
      ,[koodit_sukupuoli]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_avoin_yliopisto]

END

IF ((select count(*) from [dw].[api_avoin_yliopisto]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
 

GO

USE [ANTERO]