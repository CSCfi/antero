USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_suoritteet_esilataus]    Script Date: 1.3.2022 16:23:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_suoritteet_esilataus] AS

TRUNCATE TABLE [dw].[api_suoritteet]

INSERT INTO [dw].[api_suoritteet]

SELECT
    ROW_NUMBER() OVER(ORDER BY [Tilastovuosi], [Koulutuksen järjestäjä Koodi], [Rahoituksen koulutusala Koodi], [Koulutusmuoto Koodi], [Koulutuksen kunta Koodi]) AS defaultorder,
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
	[Suorite],
	[Summa]

FROM [ANTERO].[dw].[v_valos_suoritteet]