USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_suoritteet]    Script Date: 31.1.2023 12:08:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_suoritteet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_suoritteet_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Sektori Koodi],[Sektori],[Koulutuksen järjestäjä Koodi],[Koulutuksen järjestäjä],[Rahoituksen koulutusala Koodi],
				[Rahoituksen koulutusala],[Koulutusmuoto Koodi],[Koulutusmuoto],[Omistajatyyppi Koodi],[Omistajatyyppi],[Koulutuksen kunta Koodi],
				[Koulutuksen kunta],[Koulutuksen maakunta Koodi],[Koulutuksen maakunta],[Koulutuksen järjestäjän kunta Koodi],[Koulutuksen järjestäjän kunta],
				[Koulutuksen järjestäjän maakunta Koodi],[Koulutuksen järjestäjän maakunta],[Suorite],[Summa]
		from [dw].[api_suoritteet] s
		except
		select	[Tilastovuosi],[Sektori Koodi],[Sektori],[Koulutuksen järjestäjä Koodi],[Koulutuksen järjestäjä],[Rahoituksen koulutusala Koodi],
				[Rahoituksen koulutusala],[Koulutusmuoto Koodi],[Koulutusmuoto],[Omistajatyyppi Koodi],[Omistajatyyppi],[Koulutuksen kunta Koodi],
				[Koulutuksen kunta],[Koulutuksen maakunta Koodi],[Koulutuksen maakunta],[Koulutuksen järjestäjän kunta Koodi],[Koulutuksen järjestäjän kunta],
				[Koulutuksen järjestäjän maakunta Koodi],[Koulutuksen järjestäjän maakunta],[Suorite],[Summa]
		from [api].[suoritteet]) s ) > 0)
		or
		((select count(*) from [api].[suoritteet]) <> (select count(*) from [dw].[api_suoritteet])))
		and
		(select count(*) from [dw].[api_suoritteet]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[suoritteet]

  INSERT INTO [api].[suoritteet] (
    [defaultorder]
    ,[Tilastovuosi]
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
    ,[Suorite]
    ,[Summa]
	,[tietojoukko_paivitetty_pvm]
     )
  SELECT
    [defaultorder]
    ,[Tilastovuosi]
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
    ,[Suorite]
    ,[Summa]
	,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_suoritteet]

END

IF ((select count(*) from [dw].[api_suoritteet]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]