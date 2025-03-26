USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[_v_alueluokitus_kaikkivuodet]    Script Date: 26.3.2025 16.27.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER VIEW [dbo].[_v_alueluokitus_kaikkivuodet] AS

-- Palauta alueluokituksen eri tilastovuosien kunnat yhdessä taulussa
-- Jarmo 14.3.2014
-- Lisätty taulut suoraan TK_H9098_CSC-kannasta /CSC Jarmo 28.1.2015
--  mukaan tuli poistuneita kuntia, poistetaan ne, jotta historiajatkumo ei katkea

SELECT [kunta] = Case when kunta='999' then '-1' else kunta end
      ,[alkaa] = CAST (tilv+'-01-01' AS datetime2(7))
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN] = case when selite_FI='Ulkomaat' then 'Abroad' else selite_EN end
      ,[maakunta] = Case when nullif(maakunta, '') is null then '-1' else maakunta end
	  ,[hyvinvointialue] = coalesce(nullif(hyvinvointialue, ''), '-1')
      ,[avi] = Case when nullif(avi, '') is null then '-1' else avi end
      ,[ely] = Case when nullif(ely, '') is null then '-1' else ely end
      ,[seutukunta] = Case when nullif(seutukunta, '') is null then '-1' else seutukunta end
      ,[suuralue] = Case when nullif(suuralue, '') is null then '-1' else suuralue end
      ,[kuntaryhma] = Case when nullif(kuntaryhma, '') is null then '-1' else kuntaryhma end
      ,[laani] = Case when nullif(laani, '') is null then '-1' else laani end
      ,[tyov_elink_kesk] = Case when nullif(tyov_elink_kesk, '') is null then '-1' else tyov_elink_kesk end
      ,[kielisuhde] = Case when nullif(kielisuhde, '') is null then '-1' else kielisuhde end
	  ,[kielisuhdenim_s] = Cast([kielisuhdenim_s] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = Cast([kielisuhdenim_r] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = Cast([kielisuhdenim_e] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena] = Case when nullif(mannersu_ahvena, '') is null then '-1' else mannersu_ahvena end
      ,[liitoskunta]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]
--INTO dbo._alueluokitus_vainkunnat
FROM (

SELECT [kunta]
    ,[alkaa]
    ,[paattyy] = NULL
    ,[liitoskunta]
    ,[selite_FI]
    ,[selite_SV]
    ,[selite_EN]
    ,[maakunta]
	,[hyvinvointialue] = NULL
    ,[avi]
    ,[ely]
    ,[seutukunta]
    ,[suuralue]
    ,[kuntaryhma]
    ,[laani]
    ,[tyov_elink_kesk]
    ,[kielisuhde]
	,[kielisuhdenim_s] = Cast(NULL as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	,[kielisuhdenim_r] = Cast(NULL as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	,[kielisuhdenim_e] = Cast(NULL as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
    ,[mannersu_ahvena]
    ,[tietolahde]
    ,[kommentti]
    ,[tilv]= '2000'
  --INTO dbo._alueluokitus_vainkunnat
  FROM [Vipunen_koodisto].[koodisto_2000].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2001'
  FROM [Vipunen_koodisto].[koodisto_2001].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2002'
  FROM [Vipunen_koodisto].[koodisto_2002].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2003'
  FROM [Vipunen_koodisto].[koodisto_2003].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2004'
  FROM [Vipunen_koodisto].[koodisto_2004].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2005'
  FROM [Vipunen_koodisto].[koodisto_2005].[alueluokitus]

UNION ALL
 
SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2006'
  FROM [Vipunen_koodisto].[koodisto_2006].[alueluokitus]

UNION ALL
  
SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2007'
  FROM [Vipunen_koodisto].[koodisto_2007].[alueluokitus]

UNION ALL
  
SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2008'
  FROM [Vipunen_koodisto].[koodisto_2008].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2009'
  FROM [Vipunen_koodisto].[koodisto_2009].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2010'
  FROM [Vipunen_koodisto].[koodisto_2010].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2011'
  FROM [Vipunen_koodisto].[koodisto_2011].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskunta]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryhma]
      ,[laani]
      ,[tyov_elink_kesk]
      ,[kielisuhde]
	  ,[kielisuhdenim_s] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = NULL --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[mannersu_ahvena] = '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2012'
  FROM [Vipunen_koodisto].[koodisto_2012].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_13'
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_13]

UNION ALL

SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_14'
      ,[kommentti] = NULL
      ,[tilv] --2014
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_14]

UNION ALL

SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_15'
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_15]

UNION ALL

SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_16'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_16]


UNION ALL

SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_17'
      ,[kommentti] = NULL
      ,[tilv]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_17]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_18'
      ,[kommentti] = NULL
      ,[tilv]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_18]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_19'
      ,[kommentti] = NULL
      ,[tilv]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_19]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_20'
      ,[kommentti] = NULL
      ,[tilv]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_20]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_21'
      ,[kommentti] = NULL
      ,[tilv] --[N]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_21]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue] = NULL
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_22'
      ,[kommentti] = NULL
      ,[tilv] --[N]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_22]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_23'
      ,[kommentti] = NULL
      ,[tilv] --[N]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_23]

UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_24'
      ,[kommentti] = NULL
      ,[tilv] --[N]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_24]

  UNION ALL

  SELECT [kunta]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
	  ,[hyvinvointialue]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = 'D' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = '-1'
      ,[tietolahde] = 'TK_6_7_sopv_25'
      ,[kommentti] = NULL
      ,[tilv] --[N]
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_25]

) KaikkiVuodet  

--where nullif(kaikkivuodet.liitoskunta,'') is null


GO


