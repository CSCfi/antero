USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_suoritteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_suoritteet] AS

BEGIN
  EXEC [dw].[p_lataa_api_suoritteet_esilataus]
END

IF (select count(*) from [dw].[api_suoritteet]) > 0

BEGIN
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
  FROM [dw].[api_suoritteet]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
