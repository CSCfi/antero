USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_talous]    Script Date: 31.1.2023 11:44:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_amk_talous] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_amk_talous_esilataus]
END

IF ((((	select count (*) from (
		select	[Ammattikorkeakoulun tunnus],[Ammattikorkeakoulu],[Tilikausi],[Ohjauksenala],[Yrkeshögskolas beteckning],[Yrkeshögskola],
				[Finansår],[Utbildningsområde],[Identifier of the university of applied science],[University of applied science],[Financial year],
				[Field of education],[Ohjauksenalakoodi],[Ohjauksenala koodilla],[tili_taso0_fi],[tili_taso1_fi],[tili_taso2_fi],[tili_taso3_fi],
				[tili_taso4_fi],[tili_taso5_fi],[tili_taso0_sv],[tili_taso1_sv],[tili_taso2_sv],[tili_taso3_sv],[tili_taso4_sv],[tili_taso5_sv],
				[tili_taso0_en],[tili_taso1_en],[tili_taso2_en],[tili_taso3_en],[tili_taso4_en],[tili_taso5_en],[toiminto_nimi_fi],[erittely_nimi_fi],[arvo]
		from [dw].[api_amk_talous]
		except
		select [Ammattikorkeakoulun tunnus],[Ammattikorkeakoulu],[Tilikausi],[Ohjauksenala],[Yrkeshögskolas beteckning],[Yrkeshögskola],
				[Finansår],[Utbildningsområde],[Identifier of the university of applied science],[University of applied science],[Financial year],
				[Field of education],[Ohjauksenalakoodi],[Ohjauksenala koodilla],[tili_taso0_fi],[tili_taso1_fi],[tili_taso2_fi],[tili_taso3_fi],
				[tili_taso4_fi],[tili_taso5_fi],[tili_taso0_sv],[tili_taso1_sv],[tili_taso2_sv],[tili_taso3_sv],[tili_taso4_sv],[tili_taso5_sv],
				[tili_taso0_en],[tili_taso1_en],[tili_taso2_en],[tili_taso3_en],[tili_taso4_en],[tili_taso5_en],[toiminto_nimi_fi],[erittely_nimi_fi],[arvo]
		from [api].[amk_talous]) s ) > 0)
		or
		((select count(*) from [api].[amk_talous]) <> (select count(*) from [dw].[api_amk_talous])))
		and
		(select count(*) from [dw].[api_amk_talous]) > 0)

BEGIN
	  
  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[amk_talous]

  INSERT INTO [api].[amk_talous] (
      [defaultorder]
      ,[Ammattikorkeakoulun tunnus]
      ,[Ammattikorkeakoulu]
      ,[Tilikausi]
      ,[Ohjauksenala]
      ,[Yrkeshögskolas beteckning]
      ,[Yrkeshögskola]
      ,[Finansår]
      ,[Utbildningsområde]
      ,[Identifier of the university of applied science]
      ,[University of applied science]
      ,[Financial year]
      ,[Field of education]
      ,[Ohjauksenalakoodi]
      ,[Ohjauksenala koodilla]
      ,[tili_taso0_fi]
      ,[tili_taso1_fi]
      ,[tili_taso2_fi]
      ,[tili_taso3_fi]
      ,[tili_taso4_fi]
      ,[tili_taso5_fi]
      ,[tili_taso0_sv]
      ,[tili_taso1_sv]
      ,[tili_taso2_sv]
      ,[tili_taso3_sv]
      ,[tili_taso4_sv]
      ,[tili_taso5_sv]
      ,[tili_taso0_en]
      ,[tili_taso1_en]
      ,[tili_taso2_en]
      ,[tili_taso3_en]
      ,[tili_taso4_en]
      ,[tili_taso5_en]
      ,[toiminto_nimi_fi]
      ,[erittely_nimi_fi]
      ,[arvo]
	  ,[tietojoukko_paivitetty_pvm])

  SELECT
	     [defaultorder]
      ,[Ammattikorkeakoulun tunnus]
      ,[Ammattikorkeakoulu]
      ,[Tilikausi]
      ,[Ohjauksenala]
      ,[Yrkeshögskolas beteckning]
      ,[Yrkeshögskola]
      ,[Finansår]
      ,[Utbildningsområde]
      ,[Identifier of the university of applied science]
      ,[University of applied science]
      ,[Financial year]
      ,[Field of education]
      ,[Ohjauksenalakoodi]
      ,[Ohjauksenala koodilla]
      ,[tili_taso0_fi]
      ,[tili_taso1_fi]
      ,[tili_taso2_fi]
      ,[tili_taso3_fi]
      ,[tili_taso4_fi]
      ,[tili_taso5_fi]
      ,[tili_taso0_sv]
      ,[tili_taso1_sv]
      ,[tili_taso2_sv]
      ,[tili_taso3_sv]
      ,[tili_taso4_sv]
      ,[tili_taso5_sv]
      ,[tili_taso0_en]
      ,[tili_taso1_en]
      ,[tili_taso2_en]
      ,[tili_taso3_en]
      ,[tili_taso4_en]
      ,[tili_taso5_en]
      ,[toiminto_nimi_fi]
      ,[erittely_nimi_fi]
      ,[arvo]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_amk_talous]


END

IF ((select count(*) from [dw].[api_amk_talous]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]