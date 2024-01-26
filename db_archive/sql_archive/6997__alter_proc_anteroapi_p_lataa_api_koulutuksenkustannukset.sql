USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset]    Script Date: 31.1.2023 11:57:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_koulutuksenkustannukset] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Sektori Koodi],[Sektori],[Koulutuksen järjestäjä Koodi],[Koulutuksen järjestäjä],[Rahoituksen koulutusala Koodi],
				[Rahoituksen koulutusala],[Koulutusmuoto Koodi],[Koulutusmuoto],[Omistajatyyppi Koodi],[Omistajatyyppi],[Koulutuksen kunta Koodi],
				[Koulutuksen kunta],[Koulutuksen maakunta Koodi],[Koulutuksen maakunta],[Koulutuksen järjestäjän kunta Koodi],[Koulutuksen järjestäjän kunta],
				[Koulutuksen järjestäjän maakunta Koodi],[Koulutuksen järjestäjän maakunta],[Menolaji Koodi],[Menolaji],[Toiminto Koodi],[Toiminto],[Summa]
		from [dw].[api_koulutuksenkustannukset] s
		except
		select	[Tilastovuosi],[Sektori Koodi],[Sektori],[Koulutuksen järjestäjä Koodi],[Koulutuksen järjestäjä],[Rahoituksen koulutusala Koodi],
				[Rahoituksen koulutusala],[Koulutusmuoto Koodi],[Koulutusmuoto],[Omistajatyyppi Koodi],[Omistajatyyppi],[Koulutuksen kunta Koodi],
				[Koulutuksen kunta],[Koulutuksen maakunta Koodi],[Koulutuksen maakunta],[Koulutuksen järjestäjän kunta Koodi],[Koulutuksen järjestäjän kunta],
				[Koulutuksen järjestäjän maakunta Koodi],[Koulutuksen järjestäjän maakunta],[Menolaji Koodi],[Menolaji],[Toiminto Koodi],[Toiminto],[Summa]
		from [api].[koulutuksenkustannukset]) s ) > 0)
		or
		((select count(*) from [api].[koulutuksenkustannukset]) <> (select count(*) from [dw].[api_koulutuksenkustannukset])))
		and
		(select count(*) from [dw].[api_koulutuksenkustannukset]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[koulutuksenkustannukset]

  INSERT INTO [api].[koulutuksenkustannukset] (
      [Tilastovuosi]
      ,[Sektori Koodi]
      ,[Sektori]
      ,[Koulutuksen järjestäjä Koodi]
      ,[Koulutuksen järjestäjä]
      ,[Rahoituksen koulutusala Koodi]
      ,[Rahoituksen koulutusala]
      ,[Koulutusmuoto Koodi]
      ,[Koulutusmuoto]
      ,[Omistajatyyppi Koodi]
      ,[Omistajatyyppi]
      ,[Koulutuksen kunta Koodi]
      ,[Koulutuksen kunta]
      ,[Koulutuksen maakunta Koodi]
      ,[Koulutuksen maakunta]
      ,[Koulutuksen järjestäjän kunta Koodi]
      ,[Koulutuksen järjestäjän kunta]
      ,[Koulutuksen järjestäjän maakunta Koodi]
      ,[Koulutuksen järjestäjän maakunta]
      ,[Menolaji Koodi]
      ,[Menolaji]
      ,[Toiminto Koodi]
      ,[Toiminto]
      ,[Summa]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [Tilastovuosi]
      ,[Sektori Koodi]
      ,[Sektori]
      ,[Koulutuksen järjestäjä Koodi]
      ,[Koulutuksen järjestäjä]
      ,[Rahoituksen koulutusala Koodi]
      ,[Rahoituksen koulutusala]
      ,[Koulutusmuoto Koodi]
      ,[Koulutusmuoto]
      ,[Omistajatyyppi Koodi]
      ,[Omistajatyyppi]
      ,[Koulutuksen kunta Koodi]
      ,[Koulutuksen kunta]
      ,[Koulutuksen maakunta Koodi]
      ,[Koulutuksen maakunta]
      ,[Koulutuksen järjestäjän kunta Koodi]
      ,[Koulutuksen järjestäjän kunta]
      ,[Koulutuksen järjestäjän maakunta Koodi]
      ,[Koulutuksen järjestäjän maakunta]
      ,[Menolaji Koodi]
      ,[Menolaji]
      ,[Toiminto Koodi]
      ,[Toiminto]
      ,[Summa]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_koulutuksenkustannukset]

END

IF ((select count(*) from [dw].[api_koulutuksenkustannukset]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
 
GO

USE [ANTERO]