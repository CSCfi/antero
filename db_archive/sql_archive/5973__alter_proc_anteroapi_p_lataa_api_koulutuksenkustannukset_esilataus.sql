USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]    Script Date: 1.3.2022 16:12:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_koulutuksenkustannukset_esilataus] AS

TRUNCATE TABLE [dw].[api_koulutuksenkustannukset]

INSERT INTO [dw].[api_koulutuksenkustannukset]

--oletusjärjestys generoituu apitaulussa
SELECT 
	[Tilastovuosi],
	[Sektori Koodi],
	[Sektori],
	[Koulutuksen järjestäjä Koodi],
	[Koulutuksen järjestäjä],
	[Rahoituksen koulutusala Koodi],
	[Rahoituksen koulutusala],
	[Koulutusmuoto Koodi],
	[Koulutusmuoto],
	[Omistajatyyppi Koodi],
	[Omistajatyyppi],
	[Koulutuksen kunta Koodi],
	[Koulutuksen kunta],
	[Koulutuksen maakunta Koodi],
	[Koulutuksen maakunta],
	[Koulutuksen järjestäjän kunta Koodi],
	[Koulutuksen järjestäjän kunta],
	[Koulutuksen järjestäjän maakunta Koodi],
	[Koulutuksen järjestäjän maakunta],
	[Menolaji Koodi],
	[Menolaji],
	[Toiminto Koodi],
	[Toiminto],
	[Summa]

FROM [ANTERO].[dw].[v_valos_koulutuksenkustannukset]
