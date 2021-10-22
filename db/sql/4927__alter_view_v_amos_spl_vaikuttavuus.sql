USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_vaikuttavuus]    Script Date: 22.10.2021 12:55:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dw].[v_amos_spl_vaikuttavuus] AS
SELECT
-- AIKAMUUTTUJAT
	 [Koulutuksen suoritusvuosi] = [Tutkinnon suoritusvuosi]
      ,[Koulutuksen aloitusvuosi] = [Tutkinnon aloitusvuosi]
      ,[Koulutuksen aloituslukukausi] = [Tutkinnon aloituslukukausi]
      ,[Tilastovuosi]

-- ORGANISAATIOMUUTTUJAT
      ,[nimi_amos_spl] AS [Koulutuksen järjestäjä]
	  ,Suoritepäätös
 --     ,[Koulutuksen järjestäjä (opiskelun aikainen)]
      ,[Koulutuksen järjestäjä (tutkinnon)]

-- KOULUTUSMUUTTUJAT

      ,[Koulutuksen tavoite]
      ,[Työvoimapoliittinen koulutus] AS [Työvoimakoulutus]
      ,[Kuntakoodi_tutkinnon]
      ,[Koulutusaste, taso 2]
      ,[Koulutusala, taso 1]
      ,[Oppisopimuskoulutus]

-- KOODIMUUTTUJAT
      ,[paa_asiallinen_toiminta_maakunta_koodi] AS [Koodi Maakunta]
      ,[Kuntakoodi_opiskelunaikainen]

-- LÄHTÖTILANNEMUUTTUJAT

      ,[Koulutusaste, taso 2, pohjakoulutus]
      ,COALESCE([Pääasiallinen toiminta, ennen koulutusta, vuoden lopussa], 'Muu tai tuntematon') 
		AS [Pääasiallinen toiminta, ennen koulutusta, vuoden lopussa]
      ,[Koulutusaste, taso 2, ennen koulutusta, vuoden lopussa]
      ,[Ammattiasema, ennen koulutusta, vuoden lopussa]
      ,COALESCE([Pääasiallinen toiminta, ennen koulutusta, heinäkuun lopussa], 'Muu tai tuntematon')
		AS [Pääasiallinen toiminta, ennen koulutusta, heinäkuun lopussa]
      ,[Koulutusaste, taso 2, ennen koulutusta, heinäkuun lopussa]
      ,[Ammattiasema, ennen koulutusta, heinäkuun lopussa]

-- LOPPUTILANNEMUUTTUJAT

      ,COALESCE([Sijoittuminen], 'Muu tai tuntematon')
		AS Sijoittuminen
      ,[Maassaolo, koulutuksen jälkeen]
      ,[Ammattiasema, koulutuksen jälkeen]
      ,[Koulutusaste, taso 2, koulutuksen jälkeen]
      ,[Koulutusala, taso 1, koulutuksen jälkeen]

-- LUKUMÄÄRÄMUUTTUJAT
      ,[v Suoritetut tutkinnot]
      ,[v Suoritetut tutkinnon osat]
      ,[v Työllinen, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
      ,[v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
      ,[v Työtön, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
      ,[v Muu (kuin jatko-opiskelija, työllinen tai työtön), koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
      ,[v Työllinen, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
      ,[v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
      ,[v Työtön, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
      ,[v Muu (kuin jatko-opiskelija, työllinen tai työtön), tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
      ,[v Työllinen, koko tutkinnon suorittanut, ennen koulutusta työllinen]
      ,[v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta työllinen]
      ,[v Työtön, koko tutkinnon suorittanut, ennen koulutusta työllinen]
      ,[v Muu (kuin jatko-opiskelija, työllinen tai työtön), koko tutkinnon suorittanut, ennen koulutusta työllinen]
      ,[v Työllinen, tutkinnon osia suorittanut, ennen koulutusta työllinen]
      ,[v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta työllinen]
      ,[v Työtön, tutkinnon osia suorittanut, ennen koulutusta työllinen]
      ,[v Muu (kuin jatko-opiskelija, työllinen tai työtön), tutkinnon osia suorittanut, ennen koulutusta työllinen]
      ,[v Työlliset ja opiskelijat]
      ,[v Työlliset]
      ,[v Opiskelijat]
      ,[v Työlliset, opiskelijat ja työttömät]
      ,[v statuskerroin]
      ,[v Työllistyneet, ei työllisenä ennen koul.]
      ,[v Työllistyneet, työllisenä ennen koul.]
      ,[v Jatko-opiskelijat, ei työllisenä ennen koul.]
      ,[v Jatko-opiskelijat, työllisenä ennen koul.]
      ,[v Työtön]
      ,[v Muu tai tuntematon]
      ,[v Aluekerroin]
      ,[v Järjestäjäkerroin]
      ,[v Työllisten painotetut pisteet]
      ,[v Opiskelijoiden painotetut pisteet]
      ,[v lkm]
  FROM [ANTERO].[dw].[f_amos_spl_vaikuttavuus]
  WHERE [Koulutuksen tavoite] = 'Koko tutkinto' OR [Tutkinnon suoritusvuosi] >= 2018 
  --Tilastovuosi = 2019








GO


use antero
