USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[v_koulutuksen_jarjestaja]    Script Date: 28.3.2025 12.45.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dbo].[v_koulutuksen_jarjestaja] AS

--kuntaselitteet ei ehkä käytössä, mutta päivitetään viite niihinkin. JS 5.3.2020

SELECT [koulutuksen_jarjestajakoodi] = CAST (koodi AS varchar (10))
      ,[alkaa] = case
	  when alkaa<=tilv+'-01-01' then tilv+'-01-01'
	  else alkaa
	  end
      ,[paattyy] = NULL
      --case
	  --when paattyy>=tilv+'-12-31' then tilv+'-12-31'
	  --else paattyy
	  --end
      ,[tilv] = CAST (KaikkiVuodet.tilv AS nvarchar(4)) 
      ,[korvaavakoodi] = CAST (korvaavakoodi AS varchar (10))
      ,[koulutuksen_jarjestajaselite] = selite_FI
      ,[koulutuksen_jarjestajaselite_SV] = selite_SV
      ,[koulutuksen_jarjestajaselite_EN] = selite_EN
      ,[omistajatyyppikoodi] = CAST (yomist AS varchar (2))
	  ,[omistajatyyppiselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.omist k where k.omist_koodi=KaikkiVuodet.yomist)
	  ,[omistajatyyppiselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.omist k where k.omist_koodi=KaikkiVuodet.yomist)
	  ,[omistajatyyppiselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.omist k where k.omist_koodi=KaikkiVuodet.yomist)
      ,[koulutuksen_jarjestajan_kielikoodi] = CAST (ykieli AS varchar (2))
      ,[koulutuksen_jarjestajan_kieliselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.ykieli k where k.ykieli_koodi=KaikkiVuodet.ykieli)
      ,[koulutuksen_jarjestajan_kieliselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ykieli k where k.ykieli_koodi=KaikkiVuodet.ykieli)
      ,[koulutuksen_jarjestajan_kieliselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ykieli k where k.ykieli_koodi=KaikkiVuodet.ykieli)
      ,[sijaintikuntakoodi] = CAST (ykunta AS varchar (3))
      ,[sijaintikuntaselite] = COALESCE([ykuntaselite],'Tuntematon')
      ,[sijaintikuntaselite_SV] = COALESCE([ykuntaselite_SV],'Ökand')
      ,[sijaintikuntaselite_EN] = COALESCE([ykuntaselite_EN],'Unknown')
	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),'Manuaalinen') 
      ,[jarjestys] = selite_FI
      ,[jarjestys_omistajatyyppi] = yomist
      ,[jarjestys_koulutuksen_jarjestajan_kieli] = ykieli
      ,[jarjestys_sijaintikunta] = ykunta

FROM(

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2000.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2000.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2000.alueluokitus k where k.kunta=ykunta) end   
	--,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2000'
  FROM [Vipunen_koodisto].[koodisto_2000].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
	--,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2001'
  FROM [Vipunen_koodisto].[koodisto_2001].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2002.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2002.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2002.alueluokitus k where k.kunta=ykunta) end   
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2002'
  FROM [Vipunen_koodisto].[koodisto_2002].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2003.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2003.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2003.alueluokitus k where k.kunta=ykunta) end  
   --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2003'
  FROM [Vipunen_koodisto].[koodisto_2003].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2004.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2004.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2004.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2004'
  FROM [Vipunen_koodisto].[koodisto_2004].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2005.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2005.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2005.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2005'
  FROM [Vipunen_koodisto].[koodisto_2005].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2006.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2006.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2006.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2006'
  FROM [Vipunen_koodisto].[koodisto_2006].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2007.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2007.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2007.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2007'
  FROM [Vipunen_koodisto].[koodisto_2007].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2008.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2008.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2008.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2008'
  FROM [Vipunen_koodisto].[koodisto_2008].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2009.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2009.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2009.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2009'
  FROM [Vipunen_koodisto].[koodisto_2009].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2010.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2010.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in ('322','445','508','710','790','791')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2010.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2010'
  FROM [Vipunen_koodisto].[koodisto_2010].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'


UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
      ,[ykuntaselite_SV] = (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
      ,[ykuntaselite_EN] = (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2011'
  FROM [Vipunen_koodisto].[koodisto_2011].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'

UNION ALL

SELECT [koodi]
      ,[alkaa]
      ,[paattyy]
      ,[korvaavakoodi]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select k.selite_FI from koodisto_2012.alueluokitus k where k.kunta=ykunta)
      ,[ykuntaselite_SV] = (select k.selite_SV from koodisto_2012.alueluokitus k where k.kunta=ykunta)
      ,[ykuntaselite_EN] = (select k.selite_EN from koodisto_2012.alueluokitus k where k.kunta=ykunta)
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= '2012'
  FROM [Vipunen_koodisto].[koodisto_2012].[koulutuksen_jarjestaja]
      where [koodi]  ! = '-1' and
  [koodi] != '-2'

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_13 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_13 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_13 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_14'
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_14
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_14 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_14 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_14 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_15'
      ,[kommentti] = NULL
      ,[tilv] --2014
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_15
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_15 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_15 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_15 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_16'
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_16
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_16 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_16 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_16 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_17'
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_17
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_17 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_17 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_17 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_18'
      ,[kommentti] = NULL
      ,[tilv] --2017
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_18
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_18 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_18 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_18 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_19'
      ,[kommentti] = NULL
      ,[tilv] --2018
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_19
      where jarj  ! = '-1' and
  jarj != '-2'
  and luontipvm is not null --sopv20 data pois sopv19 aineistosta

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_19 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_19 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_19 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_20'
      ,[kommentti] = NULL
      ,[tilv] --2019
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_20
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_20 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_20 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_20 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_21'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_21
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_21 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_21 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_21 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_22'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_22
      where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_22 where kunta=ykunta) -- korjattu sopv21 -> sopv22
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_22 where kunta=ykunta) -- korjattu sopv21 -> sopv22
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_22 where kunta=ykunta) -- korjattu sopv21 -> sopv22
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_23'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_23
  where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_24'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_24
  where jarj  ! = '-1' and
  jarj != '-2'

UNION ALL

  SELECT distinct jarj --[koodi]
      ,[alkaa] = '1999-01-01'
      ,[paattyy] = '9999-01-01'
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta) --[N]
      ,[ykuntaselite_SV] = (select nimi_ruot from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta)
      ,[ykuntaselite_EN] = (select nimi_suom from [TK_H9098_CSC].dbo.TK_6_7_sopv_23 where kunta=ykunta)
      --,[tilv]
      ,[tietolahde] = 'TK_6_2_sopv_25'
      ,[kommentti] = NULL
      ,[tilv] --[N-1]
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_25
  where jarj  ! = '-1' and
  jarj != '-2' and [ylnimi] is not null
                
) KaikkiVuodet




GO


