USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_toimitilat]    Script Date: 31.1.2023 12:12:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_toimitilat] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_toimitilat_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Yliopisto],[Ammattikorkeakoulu],[Toimipiste],[Toimipaikka],[harjoittelukoulujen_tilat],[muut_vuokratilat],
				[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy],[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy],
				[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy],[toimipaikan_henkilokunnan_henkilotyovuodet],
				[tutkimusaseman_henkilokunnan_maksimimäärä],[tutkimusaseman_henkilokunnan_minimäärä],[tutkimusaseman_yopymisvuorokaudet],
				[Koodit Yliopisto],[Koodit Ammattikorkeakoulu]
		from [dw].[api_toimitilat] s
		except
		select	[Tilastovuosi],[Yliopisto],[Ammattikorkeakoulu],[Toimipiste],[Toimipaikka],[harjoittelukoulujen_tilat],[muut_vuokratilat],
				[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy],[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy],
				[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy],[toimipaikan_henkilokunnan_henkilotyovuodet],
				[tutkimusaseman_henkilokunnan_maksimimäärä],[tutkimusaseman_henkilokunnan_minimäärä],[tutkimusaseman_yopymisvuorokaudet],
				[Koodit Yliopisto],[Koodit Ammattikorkeakoulu]
		from [api].[toimitilat]) s ) > 0)
		or
		((select count(*) from [api].[toimitilat]) <> (select count(*) from [dw].[api_toimitilat])))
		and
		(select count(*) from [dw].[api_toimitilat]) > 0)

BEGIN
	  
  SET @pvm = dbo.api_update_time(getdate())
	  
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
     ,[Koodit Ammattikorkeakoulu]
	 ,[tietojoukko_paivitetty_pvm])

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
	,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_toimitilat]

END

IF ((select count(*) from [dw].[api_toimitilat]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]