USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_toimipisteet]    Script Date: 31.1.2023 12:11:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_toimipisteet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_toimipisteet_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Yliopisto],[Ammattikorkeakoulu],[Toimipiste],[Toimipaikka],[Toiminta: tutkintoon johtava koulutus],
				[Toiminta: tutkimustoiminta],[Toiminta: muu],[Toiminta: TKI],[Toiminta: palvelutoiminta],[Toiminta: nuorten koulutus],
				[Toiminta: aikuiskoulutus],[Toiminta: ylempään amk-tutkintoon johtava koulutus],[toimipaikan_henkilokunnan_henkilotyovuodet],
				[tutkimusaseman_henkilokunnan_maksimimäärä],[tutkimusaseman_henkilokunnan_minimäärä],[tutkimusaseman_yopymisvuorokaudet],
				[Koodit Yliopisto],[Koodit Ammattikorkeakoulu]
		from [dw].[api_toimipisteet] s
		except
		select	[Tilastovuosi],[Yliopisto],[Ammattikorkeakoulu],[Toimipiste],[Toimipaikka],[Toiminta: tutkintoon johtava koulutus],
				[Toiminta: tutkimustoiminta],[Toiminta: muu],[Toiminta: TKI],[Toiminta: palvelutoiminta],[Toiminta: nuorten koulutus],
				[Toiminta: aikuiskoulutus],[Toiminta: ylempään amk-tutkintoon johtava koulutus],[toimipaikan_henkilokunnan_henkilotyovuodet],
				[tutkimusaseman_henkilokunnan_maksimimäärä],[tutkimusaseman_henkilokunnan_minimäärä],[tutkimusaseman_yopymisvuorokaudet],
				[Koodit Yliopisto],[Koodit Ammattikorkeakoulu]
		from [api].[toimipisteet]) s ) > 0)
		or
		((select count(*) from [api].[toimipisteet]) <> (select count(*) from [dw].[api_toimipisteet])))
		and
		(select count(*) from [dw].[api_toimipisteet]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[toimipisteet]

  INSERT INTO [api].[toimipisteet] (
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Ammattikorkeakoulu]
    ,[Toimipiste]
    ,[Toimipaikka]
    ,[Toiminta: tutkintoon johtava koulutus]
    ,[Toiminta: tutkimustoiminta]
    ,[Toiminta: muu]
    ,[Toiminta: TKI]
    ,[Toiminta: palvelutoiminta]
    ,[Toiminta: nuorten koulutus]
    ,[Toiminta: aikuiskoulutus]
    ,[Toiminta: ylempään amk-tutkintoon johtava koulutus]
    ,[toimipaikan_henkilokunnan_henkilotyovuodet]
    ,[tutkimusaseman_henkilokunnan_maksimimäärä]
    ,[tutkimusaseman_henkilokunnan_minimäärä]
    ,[tutkimusaseman_yopymisvuorokaudet]
    ,[Koodit Yliopisto]
    ,[Koodit Ammattikorkeakoulu]
	,[tietojoukko_paivitetty_pvm]
     )
  SELECT
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Ammattikorkeakoulu]
    ,[Toimipiste]
    ,[Toimipaikka]
    ,[Toiminta: tutkintoon johtava koulutus]
    ,[Toiminta: tutkimustoiminta]
    ,[Toiminta: muu]
    ,[Toiminta: TKI]
    ,[Toiminta: palvelutoiminta]
    ,[Toiminta: nuorten koulutus]
    ,[Toiminta: aikuiskoulutus]
    ,[Toiminta: ylempään amk-tutkintoon johtava koulutus]
    ,[toimipaikan_henkilokunnan_henkilotyovuodet]
    ,[tutkimusaseman_henkilokunnan_maksimimäärä]
    ,[tutkimusaseman_henkilokunnan_minimäärä]
    ,[tutkimusaseman_yopymisvuorokaudet]
    ,[Koodit Yliopisto]
    ,[Koodit Ammattikorkeakoulu]
	,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_toimipisteet]

END

IF ((select count(*) from [dw].[api_toimipisteet]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

USE [ANTERO]