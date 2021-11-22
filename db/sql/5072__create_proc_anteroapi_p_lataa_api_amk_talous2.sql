USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_amk_talous2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_amk_talous2] AS

BEGIN
  EXEC [dw].[p_lataa_api_amk_talous2_esilataus]
END

IF (select count(*) from [dw].[api_amk_talous2]) > 0

BEGIN
	  TRUNCATE TABLE [api].[amk_talous2]

  INSERT INTO [api].[amk_talous2] (
    [defaultorder]
    ,[Ammattikorkeakoulun tunnus]
    ,[Ammattikorkeakoulu]
    ,[Konserni]
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
    ,[tili_koodi])

  SELECT
  [defaultorder]
 ,[Ammattikorkeakoulun tunnus]
 ,[Ammattikorkeakoulu]
 ,[Konserni]
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
 ,[tili_koodi]

  FROM [dw].[api_amk_talous2]


END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
