USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset]    Script Date: 7.5.2021 4:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_koulutuksenkustannukset] AS

BEGIN
  EXEC [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]
END

IF (select count(*) from [dw].[api_koulutuksenkustannukset]) > 0
BEGIN
  TRUNCATE TABLE [api].[koulutuksenkustannukset]

  INSERT INTO [api].[koulutuksenkustannukset]
  SELECT [defaultorder]
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
      ,[Menolaji Koodi]
      ,[Menolaji]
      ,[Toiminto Koodi]
      ,[Toiminto]
      ,[Summa]
  FROM [ANTERO].[dw].[api_koulutuksenkustannukset]
END
ELSE RAISERROR('tabula rasa',11,1)
 
