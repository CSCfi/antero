USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[v_alueluokitus]    Script Date: 8.5.2023 19:33:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_alueluokitus] AS

-- Palauta alueluokituksen kunnat, maakunnat, elyt ja avit samalla
-- alueluokitus_avain sisältää
--  kuntakoodi = kolme numeroa
--  maakuntakoodi = MAAK+maakuntakoodi
--  elykoodi = ELY+elykoodi
--  avikoodi = AVI+avikoodi

-- Muutettu kielisuhde käyttämään lähtödatan selitettä, jos se on tarjolla. /7.1.2015 JN

-- 10.5.2023: Lisätty hyvinvointialueet. JS


--Palautetaan rivit
SELECT [tilv]
      ,[alueluokitus_avain]
      ,[kuntakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskuntakoodi]
      ,[kuntaselite]
      ,[kuntaselite_SV]
      ,[kuntaselite_EN] = case when kuntaselite = 'Ulkomaat' then 'Abroad' else kuntaselite_EN end
      ,[maakuntakoodi]
      ,[maakuntaselite]
      ,[maakuntaselite_SV]
      ,[maakuntaselite_EN]
	  ,[hyvinvointialuekoodi]
	  ,[hyvinvointialueselite]
	  ,[hyvinvointialueselite_SV]
	  ,[hyvinvointialueselite_EN]
      ,[avikoodi]
      ,[aviselite]
      ,[aviselite_SV]
      ,[aviselite_EN]
      ,[elykoodi]
      ,[elyselite]
      ,[elyselite_SV]
      ,[elyselite_EN]
      ,[seutukuntakoodi]
      ,[seutukuntaselite]
      ,[seutukuntaselite_SV]
      ,[seutukuntaselite_EN]
      ,[suuraluekoodi]
      ,[suuralueselite]
      ,[suuralueselite_SV]
      ,[suuralueselite_EN]
      ,[kuntaryhmakoodi]
      ,[kuntaryhmaselite]
      ,[kuntaryhmaselite_SV]
      ,[kuntaryhmaselite_EN]
      ,[laanikoodi]
      ,[laaniselite]
      ,[laaniselite_SV]
      ,[laaniselite_EN]
      ,[tyov_elink_keskkoodi]
      ,[tyov_elink_keskselite]
      ,[tyov_elink_keskselite_SV]
      ,[tyov_elink_keskselite_EN]
      ,[kielisuhdekoodi]
      ,[kielisuhdeselite]
      ,[kielisuhdeselite_SV]
      ,[kielisuhdeselite_EN]
      ,[mannersu_ahvenakoodi]
      ,[mannersu_ahvenaselite]
      ,[mannersu_ahvenaselite_SV]
      ,[mannersu_ahvenaselite_EN]
      ,[tietolahde]
	--Yhtenäistetään tuntemattomien lajittelu, vain kunta lajitellaan nimen mukaan
      ,[jarjestys] = Cast(Left(Isnull(Nullif([kuntaselite],'Tuntematon'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_maakunta] = Cast(Left(Isnull(Nullif([maakuntakoodi],'-1'),'ööö'),10) as nvarchar(10))
	  ,[jarjestys_hyvinvointialue] = Cast(Left(Isnull(Nullif([hyvinvointialuekoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_avi] = Cast(Left(Isnull(Nullif([avikoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_ely] = Cast(Left(Isnull(Nullif([elykoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_seutukunta] = Cast(Left(Case when [seutukuntaselite]='Tuntematon' then 'ööö' else Isnull(Nullif([seutukuntakoodi],'-1'),'ööö') end,10) as nvarchar(10))
      ,[jarjestys_suuralue] = Cast(Left(Case when [suuralueselite]='Tuntematon' then 'ööö' else Isnull(Nullif([suuraluekoodi],'-1'),'ööö') end,10) as nvarchar(10))
      ,[jarjestys_kuntaryhma] = Cast(Left(Isnull(Nullif([kuntaryhmakoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_laani] = Cast(Left(Isnull(Nullif([laanikoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_tyov_elink_kesk] = Cast(Left(Isnull(Nullif([tyov_elink_keskkoodi],'-1'),'ööö'),10) as nvarchar(10))
      ,[jarjestys_kielisuhde] = Cast(Left(Case when [kielisuhdeselite]='Tuntematon' then 'ööö' else Isnull(Nullif([kielisuhdekoodi],'-1'),'ööö') end,10) as nvarchar(10))
      ,[jarjestys_mannersu_ahvena] = Cast(Left(Isnull(Nullif([mannersu_ahvenakoodi],'-1'),'ööö'),10) as nvarchar(10))

      --,[jarjestys] = Isnull(Nullif([jarjestys],'Tuntematon'),'ööö')
      --,[jarjestys_maakunta] = Isnull(Nullif([jarjestys_maakunta],'Tuntematon'),'ööö')
      --,[jarjestys_avi] = Isnull(Nullif([jarjestys_avi],'Tuntematon'),'ööö')
      --,[jarjestys_ely] = Isnull(Nullif([jarjestys_ely],'Tuntematon'),'ööö')
      --,[jarjestys_seutukunta] = Isnull(Nullif([jarjestys_seutukunta],'Tuntematon'),'ööö')
      --,[jarjestys_suuralue] = Isnull(Nullif([jarjestys_suuralue],'Tuntematon'),'ööö')
      --,[jarjestys_kuntaryhma] = Isnull(Nullif([jarjestys_kuntaryhma],'Tuntematon'),'ööö')
      --,[jarjestys_laani] = Isnull(Nullif([jarjestys_laani],'Tuntematon'),'ööö')
      --,[jarjestys_tyov_elink_kesk] = Isnull(Nullif([jarjestys_tyov_elink_kesk],'Tuntematon'),'ööö')
      --,[jarjestys_kielisuhde] = Isnull(Nullif([jarjestys_kielisuhde],'Tuntematon'),'ööö')
      --,[jarjestys_mannersu_ahvena] = Isnull(Nullif([jarjestys_mannersu_ahvena],'Tuntematon'),'ööö')

from ( --kaikki

	--Kunnat
	SELECT DISTINCT
	   tilv
      ,[alueluokitus_avain] = CAST (kunta AS nvarchar (10))
      ,[kuntakoodi] = CAST (kunta AS nvarchar (3))
      ,[alkaa] = case
	  when alkaa<=tilv+'-01-01' then tilv+'-01-01'
	  else alkaa
	  end
      ,[paattyy] = NULL
      ,[liitoskuntakoodi] = CAST (liitoskunta AS nvarchar (3))
      ,[kuntaselite] = selite_FI
      ,[kuntaselite_SV] = selite_SV
      ,[kuntaselite_EN] = selite_EN
      
      ,[maakuntakoodi] = CAST (maakunta AS nvarchar (2))
      ,[maakuntaselite] =  ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),'Tuntematon')
      ,[maakuntaselite_SV] =  ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),'Ökand')
      ,[maakuntaselite_EN] =  ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),'Unknown')
      
	  ,[hyvinvointialuekoodi] = CAST (hyvinvointialue AS nvarchar (2))
	  ,[hyvinvointialueselite] = ISNULL (CAST ((select top 1 k.hyvinvointialue from VipunenTK_lisatiedot.dbo.hyvinvointialue k where k.hyvinvointialue_koodi=Kaikkivuodet.hyvinvointialue) AS nvarchar (255)),'Tuntematon')
	  ,[hyvinvointialueselite_SV] = ISNULL (CAST ((select top 1 k.hyvinvointialue_SV from VipunenTK_lisatiedot.dbo.hyvinvointialue k where k.hyvinvointialue_koodi=Kaikkivuodet.hyvinvointialue) AS nvarchar (255)),'Ökand')
	  ,[hyvinvointialueselite_EN] = ISNULL (CAST ((select top 1 k.hyvinvointialue_EN from VipunenTK_lisatiedot.dbo.hyvinvointialue k where k.hyvinvointialue_koodi=Kaikkivuodet.hyvinvointialue) AS nvarchar (255)),'Ökand')

      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] =(select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then Kaikkivuodet.avi else '-1' end)
      ,[aviselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then Kaikkivuodet.avi else '-1' end)
      ,[aviselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then Kaikkivuodet.avi else '-1' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then Kaikkivuodet.ely else '-1' end) AS nvarchar (255)),'Tuntematon') 
      ,[elyselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then Kaikkivuodet.ely else '-1' end) AS nvarchar (255)),'Ökand')
      ,[elyselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then Kaikkivuodet.ely else '-1' end) AS nvarchar (255)),'Unknown')
            
      ,[seutukuntakoodi] = CAST (seutukunta AS nvarchar (3))
      ,[seutukuntaselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),'Tuntematon')
      ,[seutukuntaselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),'Ökand')
      ,[seutukuntaselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),'Unknown')
      
      ,[suuraluekoodi] = CAST (suuralue AS nvarchar (2))
      ,[suuralueselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),'Tuntematon')
      ,[suuralueselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),'Ökand')
      ,[suuralueselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),'Unknown')
            
      ,[kuntaryhmakoodi] = CAST (kuntaryhma AS nvarchar (2))
      ,[kuntaryhmaselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      ,[kuntaryhmaselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      ,[kuntaryhmaselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      
      ,[laanikoodi] = CAST (laani AS nvarchar (2))
      ,[laaniselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then Kaikkivuodet.laani else '-1' end)
      ,[laaniselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then Kaikkivuodet.laani else '-1' end)
      ,[laaniselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then Kaikkivuodet.laani else '-1' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then Kaikkivuodet.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then Kaikkivuodet.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then Kaikkivuodet.tyov_elink_kesk else '-1' end)
      
      ,[kielisuhdekoodi] = Cast(Case when kielisuhde='D' then ISNULL((select top 1 [kielisuhde_koodi] from [VipunenTK_lisatiedot].[dbo].[kielisuhde] where [koodinselite]=[kielisuhdenim_s]),'-1') else CAST (kielisuhde AS nvarchar (2)) end as nvarchar(2))
      ,[kielisuhdeselite] = Case when kielisuhde='D' then ISNULL(kielisuhdenim_s, 'Tuntematon') else ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),'Tuntematon') end
      ,[kielisuhdeselite_SV] = Case when kielisuhde='D' then ISNULL(kielisuhdenim_r, 'Okänd') else ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),'Ökand') end
      ,[kielisuhdeselite_EN] = Case when kielisuhde='D' then ISNULL(kielisuhdenim_e, 'Unknown') else ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),'Unknown') end
      
      ,[mannersu_ahvenakoodi] = CAST (mannersu_ahvena AS nvarchar (2))
      ,[mannersu_ahvenaselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)
      ,[mannersu_ahvenaselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)
      ,[mannersu_ahvenaselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)

	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),'Manuaalinen') 
      
      ,[jarjestys] = selite_FI
      ,[jarjestys_maakunta] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta),50)
      ,[jarjestys_avi] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then Kaikkivuodet.avi else '-1' end),50)
      ,[jarjestys_ely] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then Kaikkivuodet.ely else '-1' end),50)
      ,[jarjestys_seutukunta] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta),50)
      ,[jarjestys_suuralue] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue),50)
      ,[jarjestys_kuntaryhma] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma),50)
      ,[jarjestys_laani] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then Kaikkivuodet.laani else '-1' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then Kaikkivuodet.tyov_elink_kesk else '-1' end),50)
      ,[jarjestys_kielisuhde] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde),50)
      ,[jarjestys_mannersu_ahvena] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena),50)
     
	FROM dbo._v_alueluokitus_kaikkivuodet Kaikkivuodet
	where [kunta]  ! = '-1' and [kunta] != '-2'


	-- Lisätään maakunnat
	UNION ALL 

	SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST ('MAAK' + maakunnat.maakunta AS nvarchar (10))
      ,[kuntakoodi] = '-1'
      ,[alkaa] = case
	  when alkaa<=tilv+'-01-01' then tilv+'-01-01'
	  else alkaa
	  end
      ,[paattyy] = case
	  when paattyy>=tilv+'-12-31' then tilv+'-12-31'
	  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = 'Tuntematon'
      ,[kuntaselite_SV] = 'Information saknas'
      ,[kuntaselite_EN] = 'Missing data'
      
      ,[maakuntakoodi] = CAST (maakunta AS nvarchar (2))
      ,[maakuntaselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),'Tuntematon')
      ,[maakuntaselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),'Ökand')
      ,[maakuntaselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),'Unknown')
      
	  ,[hyvinvointialuekoodi] = '-1'
	  ,[hyvinvointialueselite] = 'Tuntematon'
      ,[hyvinvointialueselite_SV] = 'Okänd'
      ,[hyvinvointialueselite_EN] = 'Unknown'

      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then maakunnat.avi else '-1' end)
      ,[aviselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then maakunnat.avi else '-1' end)
      ,[aviselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then maakunnat.avi else '-1' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then maakunnat.ely else '-1' end) AS nvarchar (255)),'Tuntematon')
      ,[elyselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then maakunnat.ely else '-1' end) AS nvarchar (255)),'Ökand')
      ,[elyselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then maakunnat.ely else '-1' end) AS nvarchar (255)),'Unknown')
      
      ,[seutukuntakoodi] = '-1'
      ,[seutukuntaselite] = 'Tuntematon'
      ,[seutukuntaselite_SV] = 'Okänd'
      ,[seutukuntaselite_EN] = 'Unknown'
          
      ,[suuraluekoodi] = CAST (suuralue AS nvarchar (2))
      ,[suuralueselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),'Tuntematon')
      ,[suuralueselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),'Ökand')
      ,[suuralueselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),'Unknown')
      
      ,[kuntaryhmakoodi] = '-1'
      ,[kuntaryhmaselite] = 'Tuntematon'
      ,[kuntaryhmaselite_SV] = 'Okänd'
      ,[kuntaryhmaselite_EN] = 'Unknown'
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then maakunnat.laani else '-1' end)
      ,[laaniselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then maakunnat.laani else '-1' end)
      ,[laaniselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then maakunnat.laani else '-1' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then maakunnat.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then maakunnat.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then maakunnat.tyov_elink_kesk else '-1' end)
      
      ,[kielisuhdekoodi] = '-1'
      ,[kielisuhdeselite] = 'Tuntematon'
      ,[kielisuhdeselite_SV] = 'Okänd'
      ,[kielisuhdeselite_EN] = 'Unknown'
           
      ,[mannersu_ahvenakoodi] = CAST (mannersu_ahvena AS nvarchar (2))
      ,[mannersu_ahvenaselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)
      ,[mannersu_ahvenaselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)
      ,[mannersu_ahvenaselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)

      ,[tietolahde] = CAST('Manuaalinen' as nvarchar(50))
      
      ,[jarjestys] = 'ööö'
      ,[jarjestys_maakunta] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta),50)
      ,[jarjestys_avi] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then maakunnat.avi else '-1' end),50)
      ,[jarjestys_ely] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then maakunnat.ely else '-1' end),50)
      ,[jarjestys_seutukunta] = 'ööö'
      ,[jarjestys_suuralue] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue),50)
      ,[jarjestys_kuntaryhma] = 'ööö'
      ,[jarjestys_laani] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then maakunnat.laani else '-1' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then maakunnat.tyov_elink_kesk else '-1' end),50)
      ,[jarjestys_kielisuhde] = 'ööö'
      ,[jarjestys_mannersu_ahvena] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena),50)

	FROM (
	
	  SELECT DISTINCT
		--[kunta]
		[alkaa]
		,[paattyy]
		--,[liitoskunta]
		--,[selite_FI]
		--,[selite_SV]
		--,[selite_EN]
		,[maakunta]
		,[avi]
		,[ely]
		--,[seutukunta]
		,[suuralue]
		--,[kuntaryhma]
		,[laani]
		,[tyov_elink_kesk]
		--,[kielisuhde]
		,[mannersu_ahvena]
		--,[tietolahde]
		,[kommentti]
		,[tilv]
	  FROM [Vipunen_koodisto].[dbo]._v_alueluokitus_kaikkivuodet
	  where [kunta]  ! = '-1' and [kunta] != '-2' and maakunta >= 0
	
	) maakunnat
 

	-- Lisätään elyt
	UNION ALL 
	
	SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST ('ELY' +elyt.ely AS nvarchar (10))
      ,[kuntakoodi] = '-1'
      ,[alkaa] = case
		  when alkaa<=tilv+'-01-01' then tilv+'-01-01'
		  else alkaa
	  end
      ,[paattyy] = case
		  when paattyy>=tilv+'-12-31' then tilv+'-12-31'
		  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = 'Tuntematon'
      ,[kuntaselite_SV] = 'Information saknas'
      ,[kuntaselite_EN] = 'Missing data'
      
      ,[maakuntakoodi] = '-1'
      ,[maakuntaselite] = 'Tuntematon'
      ,[maakuntaselite_SV] = 'Okänd'
      ,[maakuntaselite_EN] = 'Unknown'
      
	  ,[hyvinvointialuekoodi] = '-1'
	  ,[hyvinvointialueselite] = 'Tuntematon'
      ,[hyvinvointialueselite_SV] = 'Okänd'
      ,[hyvinvointialueselite_EN] = 'Unknown'

      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then elyt.avi else '-1' end)
      ,[aviselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then elyt.avi else '-1' end)
      ,[aviselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then elyt.avi else '-1' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then elyt.ely else '-1' end) AS nvarchar (255)),'Tuntematon')
      ,[elyselite_SV] = ISNULL (CAST ((select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then elyt.ely else '-1' end) AS nvarchar (255)),'Ökand')
      ,[elyselite_EN] = ISNULL (CAST ((select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then elyt.ely else '-1' end) AS nvarchar (255)),'Unknown')
      
      ,[seutukuntakoodi] = '-1'
      ,[seutukuntaselite] = 'Tuntematon'
      ,[seutukuntaselite_SV] = 'Okänd'
      ,[seutukuntaselite_EN] = 'Unknown'
 
      ,[suuraluekoodi] = '-1'
      ,[suuralueselite] = 'Tuntematon'
      ,[suuralueselite_SV] = 'Okänd'
      ,[suuralueselite_EN] = 'Unknown'
          
      ,[kuntaryhmakoodi] = '-1'
      ,[kuntaryhmaselite] = 'Tuntematon'
      ,[kuntaryhmaselite_SV] = 'Okänd'
      ,[kuntaryhmaselite_EN] = 'Unknown'
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then elyt.laani else '-1' end)
      ,[laaniselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then elyt.laani else '-1' end)
      ,[laaniselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then elyt.laani else '-1' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then elyt.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then elyt.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then elyt.tyov_elink_kesk else '-1' end)
      
      ,[kielisuhdekoodi] = '-1'
      ,[kielisuhdeselite] = 'Tuntematon'
      ,[kielisuhdeselite_SV] = 'Okänd'
      ,[kielisuhdeselite_EN] = 'Unknown'
           
      ,[mannersu_ahvenakoodi] = '-1'
      ,[mannersu_ahvenaselite] = 'Tuntematon'
      ,[mannersu_ahvenaselite_SV] = 'Okänd'
      ,[mannersu_ahvenaselite_EN] = 'Unknown'

      ,[tietolahde] = CAST('Manuaalinen' as nvarchar(50))
      
      ,[jarjestys] = 'ööö'
      ,[jarjestys_maakunta] = 'ööö'
      ,[jarjestys_avi] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then elyt.avi else '-1' end),50)
      ,[jarjestys_ely] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= '2010' then elyt.ely else '-1' end),50)
      ,[jarjestys_seutukunta] = 'ööö'
      ,[jarjestys_suuralue] = 'ööö'
      ,[jarjestys_kuntaryhma] = 'ööö'
      ,[jarjestys_laani] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then elyt.laani else '-1' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then elyt.tyov_elink_kesk else '-1' end),50)
      ,[jarjestys_kielisuhde] = 'ööö'
      ,[jarjestys_mannersu_ahvena] = 'ööö'

	FROM (
	  SELECT DISTINCT
		--[kunta]
		[alkaa]
		,[paattyy]
		--,[liitoskunta]
		--,[selite_FI]
		--,[selite_SV]
		--,[selite_EN]
		--,[maakunta]
		,[avi]
		,[ely]
		--,[seutukunta]
		--,[suuralue]
		--,[kuntaryhma]
		,[laani]
		,[tyov_elink_kesk]
		--,[kielisuhde]
		--,[mannersu_ahvena]
		--,[tietolahde]
		,[kommentti]
		,[tilv]
	  FROM [Vipunen_koodisto].[dbo]._v_alueluokitus_kaikkivuodet
	  where [kunta]  ! = '-1' and [kunta] != '-2' and ely not in ('-1', '-2')
	) elyt
  

	-- Lisätään avit
	UNION ALL 
	
	SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST ('AVI' +avit.avi AS nvarchar (10))
      ,[kuntakoodi] = '-1'
      ,[alkaa] = case
	  when alkaa<=tilv+'-01-01' then tilv+'-01-01'
	  else alkaa
	  end
      ,[paattyy] = case
	  when paattyy>=tilv+'-12-31' then tilv+'-12-31'
	  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = 'Tuntematon'
      ,[kuntaselite_SV] = 'Information saknas'
      ,[kuntaselite_EN] = 'Missing data'
      
      ,[maakuntakoodi] = '-1'
      ,[maakuntaselite] = 'Tuntematon'
      ,[maakuntaselite_SV] = 'Okänd'
      ,[maakuntaselite_EN] = 'Unknown'
      
	  ,[hyvinvointialuekoodi] = '-1'
	  ,[hyvinvointialueselite] = 'Tuntematon'
      ,[hyvinvointialueselite_SV] = 'Okänd'
      ,[hyvinvointialueselite_EN] = 'Unknown'

      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then avit.avi else '-1' end)
      ,[aviselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then avit.avi else '-1' end)
      ,[aviselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then avit.avi else '-1' end)
      
      ,[elykoodi] = '-1'
      ,[elyselite] = 'Tuntematon'
      ,[elyselite_SV] = 'Okänd'
      ,[elyselite_EN] = 'Unknown'
      
      ,[seutukuntakoodi] = '-1'
      ,[seutukuntaselite] = 'Tuntematon'
      ,[seutukuntaselite_SV] = 'Okänd'
      ,[seutukuntaselite_EN] = 'Unknown'
 
      ,[suuraluekoodi] = '-1'
      ,[suuralueselite] = 'Tuntematon'
      ,[suuralueselite_SV] = 'Okänd'
      ,[suuralueselite_EN] = 'Unknown'
          
      ,[kuntaryhmakoodi] = '-1'
      ,[kuntaryhmaselite] = 'Tuntematon'
      ,[kuntaryhmaselite_SV] = 'Okänd'
      ,[kuntaryhmaselite_EN] = 'Unknown'
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then avit.laani else '-1' end)
      ,[laaniselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then avit.laani else '-1' end)
      ,[laaniselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then avit.laani else '-1' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then avit.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_SV] = (select top 1 k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then avit.tyov_elink_kesk else '-1' end)
      ,[tyov_elink_keskselite_EN] = (select top 1 k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then avit.tyov_elink_kesk else '-1' end)
      
      ,[kielisuhdekoodi] = '-1'
      ,[kielisuhdeselite] = 'Tuntematon'
      ,[kielisuhdeselite_SV] = 'Okänd'
      ,[kielisuhdeselite_EN] = 'Unknown'
           
      ,[mannersu_ahvenakoodi] = '-1'
      ,[mannersu_ahvenaselite] = 'Tuntematon'
      ,[mannersu_ahvenaselite_SV] = 'Okänd'
      ,[mannersu_ahvenaselite_EN] = 'Unknown'

      ,[tietolahde] = CAST('Manuaalinen' as nvarchar(50))
      
      ,[jarjestys] = 'ööö'
      ,[jarjestys_maakunta] = 'ööö'
      ,[jarjestys_avi] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= '2010' then avit.avi else '-1' end),50)
      ,[jarjestys_ely] = 'ööö'
      ,[jarjestys_seutukunta] = 'ööö'
      ,[jarjestys_suuralue] = 'ööö'
      ,[jarjestys_kuntaryhma] = 'ööö'
      ,[jarjestys_laani] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= '2009' then avit.laani else '-1' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select top 1 k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= '2009' then avit.tyov_elink_kesk else '-1' end),50)
      ,[jarjestys_kielisuhde] = 'ööö'
      ,[jarjestys_mannersu_ahvena] = 'ööö'

	FROM (

	  SELECT DISTINCT
		--[kunta]
		[alkaa]
		,[paattyy]
		--,[liitoskunta]
		--,[selite_FI]
		--,[selite_SV]
		--,[selite_EN]
		--,[maakunta]
		,[avi]
		--,[ely]
		--,[seutukunta]
		--,[suuralue]
		--,[kuntaryhma]
		,[laani]
		,[tyov_elink_kesk]
		--,[kielisuhde]
		--,[mannersu_ahvena]
		--,[tietolahde]
		,[kommentti]
		,[tilv]
	  FROM [Vipunen_koodisto].[dbo]._v_alueluokitus_kaikkivuodet
	  where [kunta]  ! = '-1' and [kunta] != '-2' and avi not in ('-1', '-2')
	
	) avit
  
) kaikki  

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013

GO
