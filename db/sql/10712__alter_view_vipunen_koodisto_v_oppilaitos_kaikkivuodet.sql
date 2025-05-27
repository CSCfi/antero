USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[v_oppilaitos_kaikkivuodet]    Script Date: 26.3.2025 16.28.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_oppilaitos_kaikkivuodet] AS

SELECT 
       [oppilaitoskoodi] = KaikkiVuodet.koodi
      ,[korvaavakoodi] = KaikkiVuodet.korvaavakoodi
      ,[alkaa] = CAST (tilv+'-01-01' AS datetime2(7))
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[tilv] = CAST (tilv AS nvarchar(4))
      ,[oppilaitosselite_FI] = KaikkiVuodet.selite_FI
      ,[oppilaitosselite_SV] = isnull(kk.oppilaitos_SV,KaikkiVuodet.selite_SV)
      ,[oppilaitosselite_EN] = isnull(kk.oppilaitos_EN,KaikkiVuodet.selite_EN)
      ,[sairaalakoulukoodi] = KaikkiVuodet.sair
      ,[sairaalakouluselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),'Tuntematon')
      ,[sairaalakouluselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),'Information saknas')
      ,[sairaalakouluselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),'Missing data')
      ,[oppilaitostyyppikoodi] = KaikkiVuodet.oltyp
      ,[oppilaitostyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),'Tuntematon')
      ,[oppilaitostyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),'Information saknas')
      ,[oppilaitostyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),'Missing data')
      ,[peruskoulujen_ryhmityskoodi] = KaikkiVuodet.pkryhma
      ,[peruskoulujen_ryhmitysselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),'Tuntematon')
      ,[peruskoulujen_ryhmitysselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),'Information saknas')
      ,[peruskoulujen_ryhmitysselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),'Missing data')
      ,[peruskoulujen_vuosilkskoodi] = KaikkiVuodet.vuosilks
      ,[peruskoulujen_vuosilksselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),'Tuntematon')
      ,[peruskoulujen_vuosilksselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),'Information saknas')
      ,[peruskoulujen_vuosilksselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),'Missing data')
      ,[omistajatyyppikoodi] = KaikkiVuodet.omist
      ,[omistajatyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),'Tuntematon')
      ,[omistajatyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),'Information saknas')
      ,[omistajatyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),'Missing data')
      ,[opetuskielikoodi] = KaikkiVuodet.okieli
      ,[opetuskieliselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),'Tuntematon')
      ,[opetuskieliselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),'Information saknas')
      ,[opetuskieliselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),'Missing data')
      ,[koulutuksen_jarjestajakoodi] = KaikkiVuodet.jarj
      ,[koulutuksen_jarjestajaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),'Tuntematon')
      ,[koulutuksen_jarjestajaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),'Information saknas')
      ,[koulutuksen_jarjestajaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),'Missing data')
      ,[sijaintikuntakoodi] = KaikkiVuodet.okun
      ,[sijaintikuntaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),'Tuntematon') 
      ,[sijaintikuntaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),'Information saknas')
      ,[sijaintikuntaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),'Missing data')
      ,[koordinaatti_itakoodi] = KaikkiVuodet.oikoord
      ,[koordinaatti_pohjoiskoodi] = KaikkiVuodet.opkoord
      ,[postinumerokoodi] = KaikkiVuodet.psnro
	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),'Manuaalinen') 
      --,[jarjestys]
      --,[jarjestys_sairaalakoulu]
      --,[jarjestys_oppilaitostyyppi]
      --,[jarjestys_peruskoulujen_ryhmitys]
      --,[jarjestys_peruskoulujen_vuosilks]
      --,[jarjestys_omistajatyyppi]
      --,[jarjestys_opetuskieli]
      --,[jarjestys_koulutuksen_jarjestaja]
      --,[jarjestys_sijaintikunta]
      --,[jarjestys_koordinaatti_ita]
      --,[jarjestys_koordinaatti_pohjois]
      --,[jarjestys_postinumero]

FROM(

--vanhat
SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2000'
  FROM [Vipunen_koodisto].[koodisto_2000].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'

UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2001'
  FROM [Vipunen_koodisto].[koodisto_2001].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2002'
  FROM [Vipunen_koodisto].[koodisto_2002].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2003'
  FROM [Vipunen_koodisto].[koodisto_2003].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2004'
  FROM [Vipunen_koodisto].[koodisto_2004].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2005'
  FROM [Vipunen_koodisto].[koodisto_2005].[oppilaitos]   
   where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL
 
SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2006'
  FROM [Vipunen_koodisto].[koodisto_2006].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL
  
SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2007'
  FROM [Vipunen_koodisto].[koodisto_2007].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL
  
SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2008'
  FROM [Vipunen_koodisto].[koodisto_2008].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2009'
  FROM [Vipunen_koodisto].[koodisto_2009].[oppilaitos]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2010'
  FROM [Vipunen_koodisto].[koodisto_2010].[oppilaitos]  
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2011'
  FROM [Vipunen_koodisto].[koodisto_2011].[oppilaitos]
  where [koodi]  ! = '-1' and
  [koodi] != '-2'
  

UNION ALL

SELECT [koodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2012'
  FROM [Vipunen_koodisto].[koodisto_2012].[oppilaitos]
  where [koodi]  ! = '-1' and
  [koodi] != '-2'
   
  UNION ALL

--vanhat näyttötutk
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2002'
  FROM [Vipunen_koodisto].[koodisto_2002].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2003'
  FROM [Vipunen_koodisto].[koodisto_2003] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2004'
  FROM [Vipunen_koodisto].[koodisto_2004] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'

 UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2005'
  FROM [Vipunen_koodisto].[koodisto_2005].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2006'
  FROM [Vipunen_koodisto].[koodisto_2006].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2007'
  FROM [Vipunen_koodisto].[koodisto_2007].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2008'
  FROM [Vipunen_koodisto].[koodisto_2008].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2009'
  FROM [Vipunen_koodisto].[koodisto_2009].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2010'
  FROM [Vipunen_koodisto].[koodisto_2010].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2011'
  FROM [Vipunen_koodisto].[koodisto_2011].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = ' '
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2012'
  FROM [Vipunen_koodisto].[koodisto_2012].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = '-1' and
  [koodi] != '-2'
  
   UNION ALL

--6.4 näyttötutk, poistunut
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_14'
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_14
      where tunn  ! = '-1' and
  tunn != '-2' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_15'
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_15
      where tunn  ! = '-1' and
  tunn != '-2' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_16'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_16
      where tunn  ! = '-1' and
  tunn != '-2'

   UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_17'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_17
      where tunn  ! = '-1' and
  tunn != '-2'

UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_18'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_18
      where tunn  ! = '-1' and
  tunn != '-2'

UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = ' '
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= '-1'
      ,[oltyp]= '-1'
      ,[pkryhma]= '-1'
      ,[vuosilks]= '-1'
      ,[omist]= '-1'
      ,[okieli]
      ,[jarj]= '-1'
      ,[okun]
      ,[oikoord]= '-1'
      ,[opkoord]='-1'
      ,[psnro]= '-1'
     ,[tietolahde] = 'TK_6_4_sopv_19'
      ,[kommentti] = NULL
      ,[tilv] 
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_19
      where tunn  ! = '-1' and
  tunn != '-2'


UNION ALL

--uudet
SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_14'
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_14
  where tunn  ! = '-1' and
  tunn != '-2'
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_15'
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_15
  where tunn  ! = '-1' and
  tunn != '-2'
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_16'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_16
  where tunn  ! = '-1' and
  tunn != '-2'
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_17'
      ,[kommentti] = NULL
      ,[tilv] --2017
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_17
  where tunn  ! = '-1' and
  tunn != '-2'

   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case when tunn = '10118' then 'Kaakkois-Suomen ammattikorkeakoulu' else onimi end  --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_18'
      ,[kommentti] = NULL
      ,[tilv] --2017
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_18
  where tunn  ! = '-1' and
  tunn != '-2'
   
 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case when tunn ='10118' then 'Kaakkois-Suomen ammattikorkeakoulu' else onimi end  --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord]
      ,[opkoord]
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_19'
      ,[kommentti] = NULL
      ,[tilv] --2018
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_19
  where tunn  ! = '-1' and
  tunn != '-2'

 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_20'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_20
  where tunn  ! = '-1' and
  tunn != '-2'

 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = case when tunn in ('02470','02609') then '10126' else utunn end --saimaa&lahti -> lab "yhdistyminen"
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn --hassu lyhennys tai kirjoitusasu, päivitä/poista jos korkeakoulun koodia vastaava nimi muuttuu; historiatietoja varten ei nykydimensiosta
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					when '10126' then 'LAB-ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj] = case when tunn = '02609' then '2177546-2' else jarj end --saimaa ennen labia; aineistossa laitettu jo labille
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_21'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_21
  where tunn  ! = '-1' and
  tunn != '-2'

 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn --hassu lyhennys tai kirjoitusasu, päivitä/poista jos korkeakoulun koodia vastaava nimi muuttuu
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					when '10126' then 'LAB-ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_22'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_22
  where tunn  ! = '-1' and
  tunn != '-2'

 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn --hassu lyhennys tai kirjoitusasu, päivitä/poista jos korkeakoulun koodia vastaava nimi muuttuu
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					when '10126' then 'LAB-ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_23'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_23
  where tunn  ! = '-1' and
  tunn != '-2'

 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn --hassu lyhennys tai kirjoitusasu, päivitä/poista jos korkeakoulun koodia vastaava nimi muuttuu
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					when '10126' then 'LAB-ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      ,[sair]
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_24'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_24
  where tunn  ! = '-1' and
  tunn != '-2'
 
 UNION ALL

  SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[onimi] = case tunn --hassu lyhennys tai kirjoitusasu, päivitä/poista jos korkeakoulun koodia vastaava nimi muuttuu
					when '01914' then 'Lappeenrannan–Lahden teknillinen yliopisto'
					when '10118' then 'Kaakkois-Suomen ammattikorkeakoulu'
					when '10126' then 'LAB-ammattikorkeakoulu'
					else onimi
				 end --[selite_FI]
      ,[onimi]  --[selite_SV]
      ,[onimi]  --[selite_EN]
      --,[sair]
	  ,isnull([sair], 0) as sair
      ,[oltyp]
      ,[pkryhma]
      ,[vuosilks]
      ,[omist]
      ,[okieli]
      ,[jarj]
      ,[okun]
      ,[oikoord] = coalesce([oikoord], '9999999.99')
      ,[opkoord] = coalesce([oikoord], '9999999.99')
      ,[psnro]
      ,[tietolahde] = 'TK_6_1_sopv_25'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_R6_1_sopv_25
  where tunn  ! = '-1' and
  tunn != '-2'
   
) KaikkiVuodet

--haetaan kk-käännökset nykytilanteen mukaan (manuaalisesti ylläpidettävä)
left join VipunenTK_lisatiedot.dbo.korkeakoulut kk on kk.oppilaitoskoodi=KaikkiVuodet.koodi


GO


