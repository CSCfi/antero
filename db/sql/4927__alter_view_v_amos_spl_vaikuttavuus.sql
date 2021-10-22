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
      ,[nimi_amos_spl] AS [Koulutuksen j�rjest�j�]
	  ,Suoritep��t�s
 --     ,[Koulutuksen j�rjest�j� (opiskelun aikainen)]
      ,[Koulutuksen j�rjest�j� (tutkinnon)]

-- KOULUTUSMUUTTUJAT

      ,[Koulutuksen tavoite]
      ,[Ty�voimapoliittinen koulutus] AS [Ty�voimakoulutus]
      ,[Kuntakoodi_tutkinnon]
      ,[Koulutusaste, taso 2]
      ,[Koulutusala, taso 1]
      ,[Oppisopimuskoulutus]

-- KOODIMUUTTUJAT
      ,[paa_asiallinen_toiminta_maakunta_koodi] AS [Koodi Maakunta]
      ,[Kuntakoodi_opiskelunaikainen]

-- L�HT�TILANNEMUUTTUJAT

      ,[Koulutusaste, taso 2, pohjakoulutus]
      ,COALESCE([P��asiallinen toiminta, ennen koulutusta, vuoden lopussa], 'Muu tai tuntematon') 
		AS [P��asiallinen toiminta, ennen koulutusta, vuoden lopussa]
      ,[Koulutusaste, taso 2, ennen koulutusta, vuoden lopussa]
      ,[Ammattiasema, ennen koulutusta, vuoden lopussa]
      ,COALESCE([P��asiallinen toiminta, ennen koulutusta, hein�kuun lopussa], 'Muu tai tuntematon')
		AS [P��asiallinen toiminta, ennen koulutusta, hein�kuun lopussa]
      ,[Koulutusaste, taso 2, ennen koulutusta, hein�kuun lopussa]
      ,[Ammattiasema, ennen koulutusta, hein�kuun lopussa]

-- LOPPUTILANNEMUUTTUJAT

      ,COALESCE([Sijoittuminen], 'Muu tai tuntematon')
		AS Sijoittuminen
      ,[Maassaolo, koulutuksen j�lkeen]
      ,[Ammattiasema, koulutuksen j�lkeen]
      ,[Koulutusaste, taso 2, koulutuksen j�lkeen]
      ,[Koulutusala, taso 1, koulutuksen j�lkeen]

-- LUKUM��R�MUUTTUJAT
      ,[v Suoritetut tutkinnot]
      ,[v Suoritetut tutkinnon osat]
      ,[v Ty�llinen, koko tutkinnon suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Ty�t�n, koko tutkinnon suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Muu (kuin jatko-opiskelija, ty�llinen tai ty�t�n), koko tutkinnon suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Ty�llinen, tutkinnon osia suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Ty�t�n, tutkinnon osia suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Muu (kuin jatko-opiskelija, ty�llinen tai ty�t�n), tutkinnon osia suorittanut, ennen koulutusta ei-ty�llinen]
      ,[v Ty�llinen, koko tutkinnon suorittanut, ennen koulutusta ty�llinen]
      ,[v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta ty�llinen]
      ,[v Ty�t�n, koko tutkinnon suorittanut, ennen koulutusta ty�llinen]
      ,[v Muu (kuin jatko-opiskelija, ty�llinen tai ty�t�n), koko tutkinnon suorittanut, ennen koulutusta ty�llinen]
      ,[v Ty�llinen, tutkinnon osia suorittanut, ennen koulutusta ty�llinen]
      ,[v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta ty�llinen]
      ,[v Ty�t�n, tutkinnon osia suorittanut, ennen koulutusta ty�llinen]
      ,[v Muu (kuin jatko-opiskelija, ty�llinen tai ty�t�n), tutkinnon osia suorittanut, ennen koulutusta ty�llinen]
      ,[v Ty�lliset ja opiskelijat]
      ,[v Ty�lliset]
      ,[v Opiskelijat]
      ,[v Ty�lliset, opiskelijat ja ty�tt�m�t]
      ,[v statuskerroin]
      ,[v Ty�llistyneet, ei ty�llisen� ennen koul.]
      ,[v Ty�llistyneet, ty�llisen� ennen koul.]
      ,[v Jatko-opiskelijat, ei ty�llisen� ennen koul.]
      ,[v Jatko-opiskelijat, ty�llisen� ennen koul.]
      ,[v Ty�t�n]
      ,[v Muu tai tuntematon]
      ,[v Aluekerroin]
      ,[v J�rjest�j�kerroin]
      ,[v Ty�llisten painotetut pisteet]
      ,[v Opiskelijoiden painotetut pisteet]
      ,[v lkm]
  FROM [ANTERO].[dw].[f_amos_spl_vaikuttavuus]
  WHERE [Koulutuksen tavoite] = 'Koko tutkinto' OR [Tutkinnon suoritusvuosi] >= 2018 
  --Tilastovuosi = 2019








GO


use antero
go
