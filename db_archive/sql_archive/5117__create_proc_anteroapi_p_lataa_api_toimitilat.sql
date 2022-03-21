USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_toimitilat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_toimitilat] AS

BEGIN
  EXEC [dw].[p_lataa_api_toimitilat_esilataus]
END

IF (select count(*) from [dw].[api_toimitilat]) > 0

BEGIN
	  TRUNCATE TABLE [api].[toimitilat]

  INSERT INTO [api].[toimitilat] (
     [defaultorder]
     ,[Tilastovuosi]
     ,[Yliopisto]
     ,[Ammattikorkeakoulu]
     ,[Toimipiste]
     ,[Toimipaikka]
     ,[harjoittelukoulujen_tilat]
     ,[muut_vuokratilat]
     ,[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy]
     ,[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy]
     ,[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy]
     ,[toimipaikan_henkilokunnan_henkilotyovuodet]
     ,[tutkimusaseman_henkilokunnan_maksimimäärä]
     ,[tutkimusaseman_henkilokunnan_minimäärä]
     ,[tutkimusaseman_yopymisvuorokaudet]
     ,[Koodit Yliopisto]
     ,[Koodit Ammattikorkeakoulu])

 SELECT
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Ammattikorkeakoulu]
    ,[Toimipiste]
    ,[Toimipaikka]
    ,[harjoittelukoulujen_tilat]
    ,[muut_vuokratilat]
    ,[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy]
    ,[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy]
    ,[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy]
    ,[toimipaikan_henkilokunnan_henkilotyovuodet]
    ,[tutkimusaseman_henkilokunnan_maksimimäärä]
    ,[tutkimusaseman_henkilokunnan_minimäärä]
    ,[tutkimusaseman_yopymisvuorokaudet]
    ,[Koodit Yliopisto]
    ,[Koodit Ammattikorkeakoulu]
  FROM [dw].[api_toimitilat]


END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
