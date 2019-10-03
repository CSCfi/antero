USE [Vipunen_koodisto]
GO
/****** Object:  View [dbo].[v_oppilaitos_kaikkivuodet]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppilaitos_kaikkivuodet]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[v_oppilaitos_kaikkivuodet] AS

SELECT 
       [oppilaitoskoodi] = KaikkiVuodet.koodi
      ,[korvaavakoodi] = KaikkiVuodet.korvaavakoodi
      ,[alkaa] = CAST (tilv+''-01-01'' AS datetime2(7))
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[tilv] = CAST (tilv AS nvarchar(4))
      ,[oppilaitosselite_FI] = KaikkiVuodet.selite_FI
      ,[oppilaitosselite_SV] = isnull(kk.oppilaitos_SV,KaikkiVuodet.selite_SV)
      ,[oppilaitosselite_EN] = isnull(kk.oppilaitos_EN,KaikkiVuodet.selite_EN)
      ,[sairaalakoulukoodi] = KaikkiVuodet.sair
      ,[sairaalakouluselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Tuntematon'')
      ,[sairaalakouluselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Information saknas'')
      ,[sairaalakouluselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Missing data'')
      ,[oppilaitostyyppikoodi] = KaikkiVuodet.oltyp
      ,[oppilaitostyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Tuntematon'')
      ,[oppilaitostyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Information saknas'')
      ,[oppilaitostyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Missing data'')
      ,[peruskoulujen_ryhmityskoodi] = KaikkiVuodet.pkryhma
      ,[peruskoulujen_ryhmitysselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Tuntematon'')
      ,[peruskoulujen_ryhmitysselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Information saknas'')
      ,[peruskoulujen_ryhmitysselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Missing data'')
      ,[peruskoulujen_vuosilkskoodi] = KaikkiVuodet.vuosilks
      ,[peruskoulujen_vuosilksselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Tuntematon'')
      ,[peruskoulujen_vuosilksselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Information saknas'')
      ,[peruskoulujen_vuosilksselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Missing data'')
      ,[omistajatyyppikoodi] = KaikkiVuodet.omist
      ,[omistajatyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Tuntematon'')
      ,[omistajatyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Information saknas'')
      ,[omistajatyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Missing data'')
      ,[opetuskielikoodi] = KaikkiVuodet.okieli
      ,[opetuskieliselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Tuntematon'')
      ,[opetuskieliselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Information saknas'')
      ,[opetuskieliselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Missing data'')
      ,[koulutuksen_jarjestajakoodi] = KaikkiVuodet.jarj
      ,[koulutuksen_jarjestajaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Tuntematon'')
      ,[koulutuksen_jarjestajaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Information saknas'')
      ,[koulutuksen_jarjestajaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Missing data'')
      ,[sijaintikuntakoodi] = KaikkiVuodet.okun
      ,[sijaintikuntaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Tuntematon'') 
      ,[sijaintikuntaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Information saknas'')
      ,[sijaintikuntaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Missing data'')
      ,[koordinaatti_itakoodi] = KaikkiVuodet.oikoord
      ,[koordinaatti_pohjoiskoodi] = KaikkiVuodet.opkoord
      ,[postinumerokoodi] = KaikkiVuodet.psnro
	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),''Manuaalinen'') 
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
      ,[tilv]= ''2000''
  FROM [Vipunen_koodisto].[koodisto_2000].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

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
      ,[tilv]= ''2001''
  FROM [Vipunen_koodisto].[koodisto_2001].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[oppilaitos]   
   where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[oppilaitos]  
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[oppilaitos]
  where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  

  
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
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[oppilaitos]
  where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
   
  UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_14
  where tunn  ! = ''-1'' and
  tunn != ''-2''
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_15
  where tunn  ! = ''-1'' and
  tunn != ''-2''
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_16
  where tunn  ! = ''-1'' and
  tunn != ''-2''

  UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

 UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_14
      where tunn  ! = ''-1'' and
  tunn != ''-2'' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_15
      where tunn  ! = ''-1'' and
  tunn != ''-2'' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_16
      where tunn  ! = ''-1'' and
  tunn != ''-2''
   
) KaikkiVuodet
left join VipunenTK_lisatiedot.dbo.korkeakoulut kk on kk.oppilaitoskoodi=KaikkiVuodet.koodi

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013








' 
GO
/****** Object:  View [dbo].[v_oppilaitos]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppilaitos]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[v_oppilaitos] AS

SELECT DISTINCT
       [oppilaitos_avain] = CAST (oppilaitoskoodi AS nvarchar (10))
      ,[oppilaitoskoodi]
      ,[korvaavakoodi]
      ,[alkaa] 
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[tilv] 
      ,[oppilaitosselite_FI] 
      ,[oppilaitosselite_SV] 
      ,[oppilaitosselite_EN] 
      ,[sairaalakoulukoodi] 
      ,[sairaalakouluselite_FI] 
      ,[sairaalakouluselite_SV] 
      ,[sairaalakouluselite_EN] 
      ,[oppilaitostyyppikoodi]
      ,[oppilaitostyyppiselite_FI] 
      ,[oppilaitostyyppiselite_SV] 
      ,[oppilaitostyyppiselite_EN] 
      ,[peruskoulujen_ryhmityskoodi] 
      ,[peruskoulujen_ryhmitysselite_FI] 
      ,[peruskoulujen_ryhmitysselite_SV] 
      ,[peruskoulujen_ryhmitysselite_EN] 
      ,[peruskoulujen_vuosilkskoodi] 
      ,[peruskoulujen_vuosilksselite_FI] 
      ,[peruskoulujen_vuosilksselite_SV]
      ,[peruskoulujen_vuosilksselite_EN] 
      ,[omistajatyyppikoodi] 
      ,[omistajatyyppiselite_FI] 
      ,[omistajatyyppiselite_SV]
      ,[omistajatyyppiselite_EN] 
      ,[opetuskielikoodi] 
      ,[opetuskieliselite_FI] 
      ,[opetuskieliselite_SV] 
      ,[opetuskieliselite_EN]
      ,[koulutuksen_jarjestajakoodi] 
      ,[koulutuksen_jarjestajaselite_FI] 
      ,[koulutuksen_jarjestajaselite_SV]
      ,[koulutuksen_jarjestajaselite_EN] 
      ,[sijaintikuntakoodi] 
      ,[sijaintikuntaselite_FI] 
      ,[sijaintikuntaselite_SV] 
      ,[sijaintikuntaselite_EN] 
      ,[koordinaatti_itakoodi]
      ,[koordinaatti_pohjoiskoodi] 
      ,[postinumerokoodi] 
	  ,[tietolahde] 
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
      FROM (
      
      SELECT
      [oppilaitoskoodi]
      ,[korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[oppilaitosselite_FI]
      ,[oppilaitosselite_SV]
      ,[oppilaitosselite_EN]
      ,[sairaalakoulukoodi]
      ,[sairaalakouluselite_FI]
      ,[sairaalakouluselite_SV]
      ,[sairaalakouluselite_EN]
      ,[oppilaitostyyppikoodi]
      ,[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppiselite_SV]
      ,[oppilaitostyyppiselite_EN]
      ,[peruskoulujen_ryhmityskoodi]
      ,[peruskoulujen_ryhmitysselite_FI]
      ,[peruskoulujen_ryhmitysselite_SV]
      ,[peruskoulujen_ryhmitysselite_EN]
      ,[peruskoulujen_vuosilkskoodi]
      ,[peruskoulujen_vuosilksselite_FI]
      ,[peruskoulujen_vuosilksselite_SV]
      ,[peruskoulujen_vuosilksselite_EN]
      ,[omistajatyyppikoodi]
      ,[omistajatyyppiselite_FI]
      ,[omistajatyyppiselite_SV]
      ,[omistajatyyppiselite_EN]
      ,[opetuskielikoodi]
      ,[opetuskieliselite_FI]
      ,[opetuskieliselite_SV]
      ,[opetuskieliselite_EN]
      ,[koulutuksen_jarjestajakoodi]
      ,[koulutuksen_jarjestajaselite_FI]
      ,[koulutuksen_jarjestajaselite_SV]
      ,[koulutuksen_jarjestajaselite_EN]
      ,[sijaintikuntakoodi]
      ,[sijaintikuntaselite_FI]
      ,[sijaintikuntaselite_SV]
      ,[sijaintikuntaselite_EN]
      ,[koordinaatti_itakoodi]
      ,[koordinaatti_pohjoiskoodi]
      ,ISNULL([postinumerokoodi], -1) [postinumerokoodi]
      ,[tietolahde]
  FROM dbo.v_oppilaitos_kaikkivuodet Kaikkivuodet
  where [oppilaitoskoodi]  ! = ''-1'' and
  [oppilaitoskoodi] != ''-2''
  )oppilaitokset

UNION ALL
SELECT DISTINCT --[id]
       [oppilaitos_avain]= CAST (''OLTYP'' +oppilaitostyyppikoodi AS nvarchar (20))
	  ,[oppilaitoskoodi] = ''-1''
      ,[korvaavakoodi]='''' 
      ,[alkaa]= case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy]= case
	  when paattyy>=tilv+''-12-31'' then tilv+''-12-31''
	  else paattyy
	  end 
      ,[tilv] 
      ,[oppilaitosselite_FI] = ''Tuntematon''
      ,[oppilaitosselite_SV] =  ''Okänd''
      ,[oppilaitosselite_EN] = ''Unknown''
      ,[sairaalakoulukoodi] = ''-1''
      ,[sairaalakouluselite_FI] =''Tuntematon''
      ,[sairaalakouluselite_SV] =  ''Okänd''
      ,[sairaalakouluselite_EN] = ''Unknown''
      ,[oppilaitostyyppikoodi] 
      ,[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppiselite_SV] 
      ,[oppilaitostyyppiselite_EN] 
      ,[peruskoulujen_ryhmityskoodi]= ''-1''
      ,[peruskoulujen_ryhmitysselite_FI] =''Tuntematon''
      ,[peruskoulujen_ryhmitysselite_SV] =  ''Okänd''
      ,[peruskoulujen_ryhmitysselite_EN] = ''Unknown''
      ,[peruskoulujen_vuosilkskoodi] = ''-1''
      ,[peruskoulujen_vuosilksselite_FI] =''Tuntematon''
      ,[peruskoulujen_vuosilksselite_SV] =  ''Okänd''
      ,[peruskoulujen_vuosilksselite_EN] = ''Unknown''
      ,[omistajatyyppikoodi] = ''-1''
      ,[omistajatyyppiselite_FI] = ''Tuntematon''
      ,[omistajatyyppiselite_SV] =  ''Okänd''
      ,[omistajatyyppiselite_EN] = ''Unknown''
      ,[opetuskielikoodi] = ''-1''
      ,[opetuskieliselite_FI] = ''Tuntematon''
      ,[opetuskieliselite_SV] =  ''Okänd''
      ,[opetuskieliselite_EN] = ''Unknown''
      ,[koulutuksen_jarjestajakoodi] = ''-1''
      ,[koulutuksen_jarjestajaselite_FI]= ''Tuntematon''
      ,[koulutuksen_jarjestajaselite_SV] =  ''Okänd''
      ,[koulutuksen_jarjestajaselite_EN] = ''Unknown''
      ,[sijaintikuntakoodi] = ''-1''
      ,[sijaintikuntaselite_FI] = ''Tuntematon''
      ,[sijaintikuntaselite_SV] =  ''Okänd''
      ,[sijaintikuntaselite_EN] = ''Unknown''
      ,[koordinaatti_itakoodi] = ''-1''
      ,[koordinaatti_pohjoiskoodi] = ''-1''
      ,[postinumerokoodi] = ''-1''
	  ,[tietolahde] =''CSC SQL OLTYP''
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

FROM (
SELECT DISTINCT
       --[oppilaitoskoodi]
       --[korvaavakoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[oppilaitosselite_FI]
      --,[oppilaitosselite_SV]
      --,[oppilaitosselite_EN]
      --,[sairaalakoulukoodi]
      --,[sairaalakouluselite_FI]
      --,[sairaalakouluselite_SV]
      --,[sairaalakouluselite[EN]
      ,[oppilaitostyyppikoodi]
      ,[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppiselite_SV]
      ,[oppilaitostyyppiselite_EN]
      --,[peruskoulujen_ryhmityskoodi]
      --,[peruskoulujen_ryhmitysselite_FI]
      --,[peruskoulujen_ryhmitysselite_SV]
      --,[peruskoulujen_ryhmitysselite_EN]
      --,[omistajatyyppikoodi]
      --,[omistajatyyppiselite_FI]
      --,[omistajatyyppiselite_SV]
      --,[omistajatyyppiselite_EN]
      --,[opetuskielikoodi]
      --,[opetuskieliselite_FI]
      --,[opetuskieliselite_SV]
      --,[opetuskieliselite_EN]
      --,[koulutuksen_jarjestajakoodi]
      --,[koulutuksen_jarjestajaselite_FI]
      --,[koulutuksen_jarjestajaselite_SV]
      --,[koulutuksen_jarjestajaselite_EN]
      --,[sijaintikuntakoodi]
      --,[sijaintikuntaselite_FI]
      --,[sijaintikuntaselite_SV]
      --,[sijaintikuntaselite_EN]
      --,[koordinaatti_itakoodi]
      --,[koordinaatti_pohjoiskoodi]
      --,[postinumerokoodi]
      --,[tietolahde]
      
  FROM [Vipunen_koodisto].[dbo].v_oppilaitos_kaikkivuodet 
  where [oppilaitostyyppikoodi]   ! = ''-1'' and
  [oppilaitostyyppikoodi]  != ''-2'' and oppilaitostyyppikoodi>= 0
 ) oppilaitostyypit
  








' 
GO
/****** Object:  View [dbo].[_v_alueluokitus_kaikkivuodet]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[_v_alueluokitus_kaikkivuodet]'))
EXEC dbo.sp_executesql @statement = N'














CREATE VIEW [dbo].[_v_alueluokitus_kaikkivuodet] AS

-- Palauta alueluokituksen eri tilastovuosien kunnat yhdessä taulussa
-- Jarmo 14.3.2014
-- Lisätty taulut suoraan TK_H9098_CSC-kannasta /CSC Jarmo 28.1.2015
--  mukaan tuli poistuneita kuntia, poistetaan ne, jotta historiajatkumo ei katkea

SELECT [kunta] = Case when kunta=''999'' then ''-1'' else kunta end
      ,[alkaa] = CAST (tilv+''-01-01'' AS datetime2(7))
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN] = case when selite_FI=''Ulkomaat'' then ''Abroad'' else selite_EN end
      ,[maakunta] = Case when nullif(maakunta, '''') is null then ''-1'' else maakunta end
      ,[avi] = Case when nullif(avi, '''') is null then ''-1'' else avi end
      ,[ely] = Case when nullif(ely, '''') is null then ''-1'' else ely end
      ,[seutukunta] = Case when nullif(seutukunta, '''') is null then ''-1'' else seutukunta end
      ,[suuralue] = Case when nullif(suuralue, '''') is null then ''-1'' else suuralue end
      ,[kuntaryhma] = Case when nullif(kuntaryhma, '''') is null then ''-1'' else kuntaryhma end
      ,[laani] = Case when nullif(laani, '''') is null then ''-1'' else laani end
      ,[tyov_elink_kesk] = Case when nullif(tyov_elink_kesk, '''') is null then ''-1'' else tyov_elink_kesk end
      ,[kielisuhde] = Case when nullif(kielisuhde, '''') is null then ''-1'' else kielisuhde end
	  ,[kielisuhdenim_s] = Cast([kielisuhdenim_s] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r] = Cast([kielisuhdenim_r] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_e] = Cast([kielisuhdenim_e] as nvarchar(250)) --Vuodesta 2013 alkaen koodin sijasta teksti
      ,[mannersu_ahvena] = Case when nullif(mannersu_ahvena, '''') is null then ''-1'' else mannersu_ahvena end
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
      ,[tilv]= ''2000''
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
      ,[tilv]= ''2001''
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
      ,[tilv]= ''2002''
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
      ,[tilv]= ''2003''
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
      ,[tilv]= ''2004''
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
      ,[tilv]= ''2005''
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
      ,[tilv]= ''2006''
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
      ,[tilv]= ''2007''
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
      ,[tilv]= ''2008''
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
      ,[tilv]= ''2009''
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
      ,[tilv]= ''2010''
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
      ,[mannersu_ahvena] = ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2011''
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
	  ,[mannersu_ahvena] = ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[alueluokitus]

UNION ALL

SELECT [kunta]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = ''D'' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = ''-1''
      ,[tietolahde] = ''TK_6_7_sopv_13''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_13]

UNION ALL

SELECT [kunta]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = ''D'' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = ''-1''
      ,[tietolahde] = ''TK_6_7_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2014
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_14]

UNION ALL

SELECT [kunta]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = ''D'' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = ''-1''
      ,[tietolahde] = ''TK_6_7_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_15]

UNION ALL

SELECT [kunta]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[liitoskunta]
      ,[nimi_suom] --[selite_FI]
      ,[nimi_ruot] --[selite_SV]
      ,[nimi_suom] --[selite_EN]
      ,[maakunta]
      ,[avi]
      ,[ely]
      ,[seutukunta]
      ,[suuralue]
      ,[kuntaryh] --[kuntaryhma]
      ,[laani] = NULL
      ,[tyov_elink_kesk] = NULL
      ,[kielisuhdenim] = ''D'' --[kielisuhde] 2013 alkaen datassa vain kuvaus. Asetetaan koodi, että selitteet löytyvät datasta.
	  ,[kielisuhdenim_s] --Vuodesta 2013 alkaen koodin sijasta teksti
	  ,[kielisuhdenim_r]
	  ,[kielisuhdenim_e]
      ,[mannersu_ahvena] = ''-1''
      ,[tietolahde] = ''TK_6_7_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].[dbo].[TK_6_7_sopv_16]

) KaikkiVuodet  

--where nullif(kaikkivuodet.liitoskunta,'''') is null





' 
GO
/****** Object:  View [dbo].[v_alueluokitus]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_alueluokitus]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[v_alueluokitus] AS

-- Palauta alueluokituksen kunnat, maakunnat, elyt ja avit samalla
-- alueluokitus_avain sisältää
--  kuntakoodi = kolme numeroa
--  maakuntakoodi = MAAK+maakuntakoodi
--  elykoodi = ELY+elykoodi
--  avikoodi = AVI+avikoodi

-- Muutettu kielisuhde käyttämään lähtödatan selitettä, jos se on tarjolla. /7.1.2015 JN

-- select * from [dbo].[v_alueluokitus]


--Palautetaan rivit
SELECT [tilv]
      ,[alueluokitus_avain]
      ,[kuntakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[liitoskuntakoodi]
      ,[kuntaselite]
      ,[kuntaselite_SV]
      ,[kuntaselite_EN] = case when kuntaselite = ''Ulkomaat'' then ''Abroad'' else kuntaselite_EN end
      ,[maakuntakoodi]
      ,[maakuntaselite]
      ,[maakuntaselite_SV]
      ,[maakuntaselite_EN]
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
      ,[jarjestys] = Cast(Left(Isnull(Nullif([kuntaselite],''Tuntematon''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_maakunta] = Cast(Left(Isnull(Nullif([maakuntakoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_avi] = Cast(Left(Isnull(Nullif([avikoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_ely] = Cast(Left(Isnull(Nullif([elykoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_seutukunta] = Cast(Left(Case when [seutukuntaselite]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([seutukuntakoodi],''-1''),''ööö'') end,10) as nvarchar(10))
      ,[jarjestys_suuralue] = Cast(Left(Case when [suuralueselite]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([suuraluekoodi],''-1''),''ööö'') end,10) as nvarchar(10))
      ,[jarjestys_kuntaryhma] = Cast(Left(Isnull(Nullif([kuntaryhmakoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_laani] = Cast(Left(Isnull(Nullif([laanikoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_tyov_elink_kesk] = Cast(Left(Isnull(Nullif([tyov_elink_keskkoodi],''-1''),''ööö''),10) as nvarchar(10))
      ,[jarjestys_kielisuhde] = Cast(Left(Case when [kielisuhdeselite]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([kielisuhdekoodi],''-1''),''ööö'') end,10) as nvarchar(10))
      ,[jarjestys_mannersu_ahvena] = Cast(Left(Isnull(Nullif([mannersu_ahvenakoodi],''-1''),''ööö''),10) as nvarchar(10))

      --,[jarjestys] = Isnull(Nullif([jarjestys],''Tuntematon''),''ööö'')
      --,[jarjestys_maakunta] = Isnull(Nullif([jarjestys_maakunta],''Tuntematon''),''ööö'')
      --,[jarjestys_avi] = Isnull(Nullif([jarjestys_avi],''Tuntematon''),''ööö'')
      --,[jarjestys_ely] = Isnull(Nullif([jarjestys_ely],''Tuntematon''),''ööö'')
      --,[jarjestys_seutukunta] = Isnull(Nullif([jarjestys_seutukunta],''Tuntematon''),''ööö'')
      --,[jarjestys_suuralue] = Isnull(Nullif([jarjestys_suuralue],''Tuntematon''),''ööö'')
      --,[jarjestys_kuntaryhma] = Isnull(Nullif([jarjestys_kuntaryhma],''Tuntematon''),''ööö'')
      --,[jarjestys_laani] = Isnull(Nullif([jarjestys_laani],''Tuntematon''),''ööö'')
      --,[jarjestys_tyov_elink_kesk] = Isnull(Nullif([jarjestys_tyov_elink_kesk],''Tuntematon''),''ööö'')
      --,[jarjestys_kielisuhde] = Isnull(Nullif([jarjestys_kielisuhde],''Tuntematon''),''ööö'')
      --,[jarjestys_mannersu_ahvena] = Isnull(Nullif([jarjestys_mannersu_ahvena],''Tuntematon''),''ööö'')
from ( --kaikki

--Kunnat
SELECT DISTINCT
	   tilv
      ,[alueluokitus_avain] = CAST (kunta AS nvarchar (10))
      ,[kuntakoodi] = CAST (kunta AS nvarchar (3))
      ,[alkaa] = case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy] = NULL
      ,[liitoskuntakoodi] = CAST (liitoskunta AS nvarchar (3))
      ,[kuntaselite] = selite_FI
      ,[kuntaselite_SV] = selite_SV
      ,[kuntaselite_EN] = selite_EN
      
      ,[maakuntakoodi] = CAST (maakunta AS nvarchar (2))
      ,[maakuntaselite] =  ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),''Tuntematon'')
      ,[maakuntaselite_SV] =  ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),''Ökand'')
      ,[maakuntaselite_EN] =  ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta) AS nvarchar (255)),''Unknown'')
      
      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] =(select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then Kaikkivuodet.avi else ''-1'' end)
      ,[aviselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then Kaikkivuodet.avi else ''-1'' end)
      ,[aviselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then Kaikkivuodet.avi else ''-1'' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then Kaikkivuodet.ely else ''-1'' end) AS nvarchar (255)),''Tuntematon'') 
      ,[elyselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then Kaikkivuodet.ely else ''-1'' end) AS nvarchar (255)),''Ökand'')
      ,[elyselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then Kaikkivuodet.ely else ''-1'' end) AS nvarchar (255)),''Unknown'')
            
      ,[seutukuntakoodi] = CAST (seutukunta AS nvarchar (3))
      ,[seutukuntaselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),''Tuntematon'')
      ,[seutukuntaselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),''Ökand'')
      ,[seutukuntaselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta) AS nvarchar (255)),''Unknown'')
      
      ,[suuraluekoodi] = CAST (suuralue AS nvarchar (2))
      ,[suuralueselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),''Tuntematon'')
      ,[suuralueselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),''Ökand'')
      ,[suuralueselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue) AS nvarchar (255)),''Unknown'')
            
      ,[kuntaryhmakoodi] = CAST (kuntaryhma AS nvarchar (2))
      ,[kuntaryhmaselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      ,[kuntaryhmaselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      ,[kuntaryhmaselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma)
      
      ,[laanikoodi] = CAST (laani AS nvarchar (2))
      ,[laaniselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then Kaikkivuodet.laani else ''-1'' end)
      ,[laaniselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then Kaikkivuodet.laani else ''-1'' end)
      ,[laaniselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then Kaikkivuodet.laani else ''-1'' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then Kaikkivuodet.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then Kaikkivuodet.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then Kaikkivuodet.tyov_elink_kesk else ''-1'' end)
      
      ,[kielisuhdekoodi] = Cast(Case when kielisuhde=''D'' then ISNULL((Select top 1 [kielisuhde_koodi] from [VipunenTK_lisatiedot].[dbo].[kielisuhde] where [koodinselite]=[kielisuhdenim_s]),''-1'') else CAST (kielisuhde AS nvarchar (2)) end as nvarchar(2))
      ,[kielisuhdeselite] = Case when kielisuhde=''D'' then ISNULL(kielisuhdenim_s, ''Tuntematon'') else ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),''Tuntematon'') end
      ,[kielisuhdeselite_SV] = Case when kielisuhde=''D'' then ISNULL(kielisuhdenim_r, ''Okänd'') else ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),''Ökand'') end
      ,[kielisuhdeselite_EN] = Case when kielisuhde=''D'' then ISNULL(kielisuhdenim_e, ''Unknown'') else ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde) AS nvarchar (255)),''Unknown'') end
      
      ,[mannersu_ahvenakoodi] = CAST (mannersu_ahvena AS nvarchar (2))
      ,[mannersu_ahvenaselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)
      ,[mannersu_ahvenaselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)
      ,[mannersu_ahvenaselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena)

	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),''Manuaalinen'') 
      
      ,[jarjestys] = selite_FI
      ,[jarjestys_maakunta] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=Kaikkivuodet.maakunta),50)
      ,[jarjestys_avi] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then Kaikkivuodet.avi else ''-1'' end),50)
      ,[jarjestys_ely] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then Kaikkivuodet.ely else ''-1'' end),50)
      ,[jarjestys_seutukunta] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.seutukunta k where k.seutukunta_koodi=Kaikkivuodet.seutukunta),50)
      ,[jarjestys_suuralue] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=Kaikkivuodet.suuralue),50)
      ,[jarjestys_kuntaryhma] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.kuntaryh k where k.kuntaryh_koodi=Kaikkivuodet.kuntaryhma),50)
      ,[jarjestys_laani] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then Kaikkivuodet.laani else ''-1'' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then Kaikkivuodet.tyov_elink_kesk else ''-1'' end),50)
      ,[jarjestys_kielisuhde] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.kielisuhde k where k.kielisuhde_koodi=Kaikkivuodet.kielisuhde),50)
      ,[jarjestys_mannersu_ahvena] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=Kaikkivuodet.mannersu_ahvena),50)
     
FROM dbo._v_alueluokitus_kaikkivuodet Kaikkivuodet
  where [kunta]  ! = ''-1'' and
  [kunta] != ''-2''


-- Lisätään maakunnat
UNION ALL SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST (''MAAK'' + maakunnat.maakunta AS nvarchar (10))
      ,[kuntakoodi] = ''-1''
      ,[alkaa] = case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy] = case
	  when paattyy>=tilv+''-12-31'' then tilv+''-12-31''
	  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = ''Tuntematon''
      ,[kuntaselite_SV] = ''Information saknas''
      ,[kuntaselite_EN] = ''Missing data''
      
      ,[maakuntakoodi] = CAST (maakunta AS nvarchar (2))
      ,[maakuntaselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),''Tuntematon'')
      ,[maakuntaselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),''Ökand'')
      ,[maakuntaselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta) AS nvarchar (255)),''Unknown'')
      
      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then maakunnat.avi else ''-1'' end)
      ,[aviselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then maakunnat.avi else ''-1'' end)
      ,[aviselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then maakunnat.avi else ''-1'' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then maakunnat.ely else ''-1'' end) AS nvarchar (255)),''Tuntematon'')
      ,[elyselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then maakunnat.ely else ''-1'' end) AS nvarchar (255)),''Ökand'')
      ,[elyselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then maakunnat.ely else ''-1'' end) AS nvarchar (255)),''Unknown'')
      
      ,[seutukuntakoodi] = ''-1''
      ,[seutukuntaselite] = ''Tuntematon''
      ,[seutukuntaselite_SV] = ''Okänd''
      ,[seutukuntaselite_EN] = ''Unknown''
          
      ,[suuraluekoodi] = CAST (suuralue AS nvarchar (2))
      ,[suuralueselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),''Tuntematon'')
      ,[suuralueselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),''Ökand'')
      ,[suuralueselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue) AS nvarchar (255)),''Unknown'')
      
      ,[kuntaryhmakoodi] = ''-1''
      ,[kuntaryhmaselite] = ''Tuntematon''
      ,[kuntaryhmaselite_SV] = ''Okänd''
      ,[kuntaryhmaselite_EN] = ''Unknown''
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then maakunnat.laani else ''-1'' end)
      ,[laaniselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then maakunnat.laani else ''-1'' end)
      ,[laaniselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then maakunnat.laani else ''-1'' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then maakunnat.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then maakunnat.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then maakunnat.tyov_elink_kesk else ''-1'' end)
      
      ,[kielisuhdekoodi] = ''-1''
      ,[kielisuhdeselite] = ''Tuntematon''
      ,[kielisuhdeselite_SV] = ''Okänd''
      ,[kielisuhdeselite_EN] = ''Unknown''
           
      ,[mannersu_ahvenakoodi] = CAST (mannersu_ahvena AS nvarchar (2))
      ,[mannersu_ahvenaselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)
      ,[mannersu_ahvenaselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)
      ,[mannersu_ahvenaselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena)

      ,[tietolahde] = CAST(''Manuaalinen'' as nvarchar(50))
      
      ,[jarjestys] = ''ööö''
      ,[jarjestys_maakunta] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.maakunta k where k.maakunta_koodi=maakunnat.maakunta),50)
      ,[jarjestys_avi] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then maakunnat.avi else ''-1'' end),50)
      ,[jarjestys_ely] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then maakunnat.ely else ''-1'' end),50)
      ,[jarjestys_seutukunta] = ''ööö''
      ,[jarjestys_suuralue] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.suuralue k where k.suuralue_koodi=maakunnat.suuralue),50)
      ,[jarjestys_kuntaryhma] = ''ööö''
      ,[jarjestys_laani] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then maakunnat.laani else ''-1'' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then maakunnat.tyov_elink_kesk else ''-1'' end),50)
      ,[jarjestys_kielisuhde] = ''ööö''
      ,[jarjestys_mannersu_ahvena] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.mannersu_ahvena k where k.mannersu_ahvena_koodi=maakunnat.mannersu_ahvena),50)

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
  where [kunta]  ! = ''-1'' and
  [kunta] != ''-2'' and maakunta >= 0
 ) maakunnat
  


-- Lisätään elyt
UNION ALL SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST (''ELY'' +elyt.ely AS nvarchar (10))
      ,[kuntakoodi] = ''-1''
      ,[alkaa] = case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy] = case
	  when paattyy>=tilv+''-12-31'' then tilv+''-12-31''
	  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = ''Tuntematon''
      ,[kuntaselite_SV] = ''Information saknas''
      ,[kuntaselite_EN] = ''Missing data''
      
      ,[maakuntakoodi] = ''-1''
      ,[maakuntaselite] = ''Tuntematon''
      ,[maakuntaselite_SV] = ''Okänd''
      ,[maakuntaselite_EN] = ''Unknown''
      
      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then elyt.avi else ''-1'' end)
      ,[aviselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then elyt.avi else ''-1'' end)
      ,[aviselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then elyt.avi else ''-1'' end)
      
      ,[elykoodi] = CAST (ely AS nvarchar (2))
      ,[elyselite] = ISNULL (CAST ((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then elyt.ely else ''-1'' end) AS nvarchar (255)),''Tuntematon'')
      ,[elyselite_SV] = ISNULL (CAST ((select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then elyt.ely else ''-1'' end) AS nvarchar (255)),''Ökand'')
      ,[elyselite_EN] = ISNULL (CAST ((select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then elyt.ely else ''-1'' end) AS nvarchar (255)),''Unknown'')
      
      ,[seutukuntakoodi] = ''-1''
      ,[seutukuntaselite] = ''Tuntematon''
      ,[seutukuntaselite_SV] = ''Okänd''
      ,[seutukuntaselite_EN] = ''Unknown''
 
      ,[suuraluekoodi] = ''-1''
      ,[suuralueselite] = ''Tuntematon''
      ,[suuralueselite_SV] = ''Okänd''
      ,[suuralueselite_EN] = ''Unknown''
          
      ,[kuntaryhmakoodi] = ''-1''
      ,[kuntaryhmaselite] = ''Tuntematon''
      ,[kuntaryhmaselite_SV] = ''Okänd''
      ,[kuntaryhmaselite_EN] = ''Unknown''
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then elyt.laani else ''-1'' end)
      ,[laaniselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then elyt.laani else ''-1'' end)
      ,[laaniselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then elyt.laani else ''-1'' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then elyt.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then elyt.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then elyt.tyov_elink_kesk else ''-1'' end)
      
      ,[kielisuhdekoodi] = ''-1''
      ,[kielisuhdeselite] = ''Tuntematon''
      ,[kielisuhdeselite_SV] = ''Okänd''
      ,[kielisuhdeselite_EN] = ''Unknown''
           
      ,[mannersu_ahvenakoodi] = ''-1''
      ,[mannersu_ahvenaselite] = ''Tuntematon''
      ,[mannersu_ahvenaselite_SV] = ''Okänd''
      ,[mannersu_ahvenaselite_EN] = ''Unknown''

      ,[tietolahde] = CAST(''Manuaalinen'' as nvarchar(50))
      
      ,[jarjestys] = ''ööö''
      ,[jarjestys_maakunta] = ''ööö''
      ,[jarjestys_avi] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then elyt.avi else ''-1'' end),50)
      ,[jarjestys_ely] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.ely k where k.ely_koodi=case when tilv >= ''2010'' then elyt.ely else ''-1'' end),50)
      ,[jarjestys_seutukunta] = ''ööö''
      ,[jarjestys_suuralue] = ''ööö''
      ,[jarjestys_kuntaryhma] = ''ööö''
      ,[jarjestys_laani] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then elyt.laani else ''-1'' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then elyt.tyov_elink_kesk else ''-1'' end),50)
      ,[jarjestys_kielisuhde] = ''ööö''
      ,[jarjestys_mannersu_ahvena] = ''ööö''

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
  where [kunta]  ! = ''-1'' and
  [kunta] != ''-2'' and ely not in (''-1'', ''-2'')
 ) elyt
  

-- Lisätään avit
UNION ALL SELECT DISTINCT --[id]
	   tilv = CAST (tilv AS nvarchar (4))
      ,[alueluokitus_avain] = CAST (''AVI'' +avit.avi AS nvarchar (10))
      ,[kuntakoodi] = ''-1''
      ,[alkaa] = case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy] = case
	  when paattyy>=tilv+''-12-31'' then tilv+''-12-31''
	  else paattyy
	  end
      ,[liitoskuntakoodi] = NULL
      ,[kuntaselite] = ''Tuntematon''
      ,[kuntaselite_SV] = ''Information saknas''
      ,[kuntaselite_EN] = ''Missing data''
      
      ,[maakuntakoodi] = ''-1''
      ,[maakuntaselite] = ''Tuntematon''
      ,[maakuntaselite_SV] = ''Okänd''
      ,[maakuntaselite_EN] = ''Unknown''
      
      ,[avikoodi] = CAST (avi AS nvarchar (2))
      ,[aviselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then avit.avi else ''-1'' end)
      ,[aviselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then avit.avi else ''-1'' end)
      ,[aviselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then avit.avi else ''-1'' end)
      
      ,[elykoodi] = ''-1''
      ,[elyselite] = ''Tuntematon''
      ,[elyselite_SV] = ''Okänd''
      ,[elyselite_EN] = ''Unknown''
      
      ,[seutukuntakoodi] = ''-1''
      ,[seutukuntaselite] = ''Tuntematon''
      ,[seutukuntaselite_SV] = ''Okänd''
      ,[seutukuntaselite_EN] = ''Unknown''
 
      ,[suuraluekoodi] = ''-1''
      ,[suuralueselite] = ''Tuntematon''
      ,[suuralueselite_SV] = ''Okänd''
      ,[suuralueselite_EN] = ''Unknown''
          
      ,[kuntaryhmakoodi] = ''-1''
      ,[kuntaryhmaselite] = ''Tuntematon''
      ,[kuntaryhmaselite_SV] = ''Okänd''
      ,[kuntaryhmaselite_EN] = ''Unknown''
            
      ,[laanikoodi] = CAST (laani AS  nvarchar (2))
      ,[laaniselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then avit.laani else ''-1'' end)
      ,[laaniselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then avit.laani else ''-1'' end)
      ,[laaniselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then avit.laani else ''-1'' end)
      
      ,[tyov_elink_keskkoodi] = CAST (tyov_elink_kesk AS nvarchar (2))
      ,[tyov_elink_keskselite] = (select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then avit.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_SV] = (select k.koodinselite_SV from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then avit.tyov_elink_kesk else ''-1'' end)
      ,[tyov_elink_keskselite_EN] = (select k.koodinselite_EN from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then avit.tyov_elink_kesk else ''-1'' end)
      
      ,[kielisuhdekoodi] = ''-1''
      ,[kielisuhdeselite] = ''Tuntematon''
      ,[kielisuhdeselite_SV] = ''Okänd''
      ,[kielisuhdeselite_EN] = ''Unknown''
           
      ,[mannersu_ahvenakoodi] = ''-1''
      ,[mannersu_ahvenaselite] = ''Tuntematon''
      ,[mannersu_ahvenaselite_SV] = ''Okänd''
      ,[mannersu_ahvenaselite_EN] = ''Unknown''

      ,[tietolahde] = CAST(''Manuaalinen'' as nvarchar(50))
      
      ,[jarjestys] = ''ööö''
      ,[jarjestys_maakunta] = ''ööö''
      ,[jarjestys_avi] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.avi k where k.avi_koodi=case when tilv >= ''2010'' then avit.avi else ''-1'' end),50)
      ,[jarjestys_ely] = ''ööö''
      ,[jarjestys_seutukunta] = ''ööö''
      ,[jarjestys_suuralue] = ''ööö''
      ,[jarjestys_kuntaryhma] = ''ööö''
      ,[jarjestys_laani] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.laani k where k.laani_koodi=case when tilv <= ''2009'' then avit.laani else ''-1'' end),50)
      ,[jarjestys_tyov_elink_kesk] = Left((select k.koodinselite from VipunenTK_lisatiedot.dbo.tyov_elink_kesk k where k.tyov_elink_kesk_koodi=case when tilv <= ''2009'' then avit.tyov_elink_kesk else ''-1'' end),50)
      ,[jarjestys_kielisuhde] = ''ööö''
      ,[jarjestys_mannersu_ahvena] = ''ööö''

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
  where [kunta]  ! = ''-1'' and
  [kunta] != ''-2'' and avi not in (''-1'', ''-2'')
 ) avit
  
  
) kaikki  

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013





' 
GO
/****** Object:  View [dbo].[_v_koulutusluokitus_kaikkivuodet]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[_v_koulutusluokitus_kaikkivuodet]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[_v_koulutusluokitus_kaikkivuodet] AS

-- Palauta koulutusluokituksen eri tilastovuosien koodit yhdessä taulussa
-- Jarmo 14.3.2014
-- Select * from Vipunen_koodisto.dbo.[_v_koulutusluokitus_kaikkivuodet]
-- Select * from Vipunen_koodisto.dbo.[_v_koulutusluokitus_kaikkivuodet] where tilv in (''2014'')

-- Jarmo 25.9.2015
-- lisätty uudet kentät luokitukseen
-- selitteet on lisätty kolmelle kielelle
--  nyt kentille on vain englanninkieliset selitteet. Kun suomen- ja ruotsinkieliset tulevat tarjolle, tieto haetaan niistä.
-- 2015 ja 2014 dataan
 	   --,[iscle2011]
	   --,[iscleni2011]
	   --,[iscleni2011_r] = [iscleni2011]
	   --,[iscleni2011_e] = [iscleni2011]
	   --,[isccat2011]
	   --,[isccatni2011]
	   --,[isccatni2011_r] = [isccatni2011]
	   --,[isccatni2011_e] = [isccatni2011]
	   --,[iscsubcat2011]
	   --,[iscsubcatni2011]
	   --,[iscsubcatni2011_r] = [iscsubcatni2011]
	   --,[iscsubcatni2011_e] = [iscsubcatni2011]
-- vain 2015 dataan
	   --,[iscfi2013]
	   --,[iscfini2013]
	   --,[iscfini2013_r] = [iscfini2013]
	   --,[iscfini2013_e] = [iscfini2013]
	   --,[iscfinarrow2013]
	   --,[iscfinarrowni2013]
	   --,[iscfinarrowni2013_r] = [iscfinarrowni2013]
	   --,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   --,[iscfibroad2013]
	   --,[iscfibroadni2013]
	   --,[iscfibroadni2013_r] = [iscfibroadni2013]
	   --,[iscfibroadni2013_e] = [iscfibroadni2013]
-- vanhoihin tauluihin tiedot on lisätty tutnemattomina

-- Jarmo 2.6.2016
-- lisätty uusia kenttä 
--   kaste_taso1 (iscle) SV ja FI 
--   kaste_taso2 kokonaan
--   kala taso1 (iscfibroad) SV ja FI
--   kala taso2 (iscfinarrow) SV ja FI
--   kala taso3 (iscfi) SV ja FI



SELECT 
    [koulutuskoodi] = CAST (KaikkiVuodet.koulutuskoodi AS nvarchar (255)) 
	,[alkaa] = CAST (tilv+''-01-01'' AS datetime2(7))
	,[paattyy] = NULL
	,[tilv] = CAST (KaikkiVuodet.tilv AS nvarchar(4)) 
	,[koulutusselite_FI] = ISNULL (CAST (KaikkiVuodet.selite_FI AS nvarchar (255)),''Tuntematon'')
	,[koulutuslyhytselite_FI] = KaikkiVuodet.lyhytselite_FI
	,[koulutusselite_SV] =ISNULL (CAST (KaikkiVuodet.selite_SV AS nvarchar (255)),''Information saknas'')
	,[koulutuslyhytselite_SV] = KaikkiVuodet.lyhytselite_SV
	,[koulutusselite_EN] = ISNULL (CAST (KaikkiVuodet.selite_EN AS nvarchar (255)),''Missing data'')
	,[koulutuslyhytselite_EN] = KaikkiVuodet.lyhytselite_EN
	,[tasokoodi] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar (5)),'''')
	--,[tasoselite_FI] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), ''Tieto puuttuu'')
    --,[tasoselite_SV] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), ''Information saknas'')
    --,[tasoselite_EN] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), ''Missing data'')
	,[koulutusala_tkkoodi] = KaikkiVuodet.kala
	,[koulutusala_tkselite_FI] = ISNULL (CAST (KaikkiVuodet.kalanimi AS nvarchar(255)),''Tuntematon'')
	--,[kalalnimi] = KaikkiVuodet.kalalnimi
	,[koulutusala_tkselite_SV] = ISNULL (CAST (KaikkiVuodet.kalanimi_r  AS nvarchar(255)),''Information saknas'') 
	--,[kalalnimi_r] = KaikkiVuodet.kalalnimi_r
	,[koulutusaste_tkkoodi] = KaikkiVuodet.kaste
	,[koulutusaste_tkselite_FI] = ISNULL (CAST (KaikkiVuodet.kastenimi AS nvarchar(255)),''Tuntematon'')
	,[koulutusaste_tkselite_SV] = ISNULL (CAST (KaikkiVuodet.kastenimi_r AS nvarchar(255)),''Information saknas'')
	--,[opmastlni] = KaikkiVuodet.opmastlni
	--,[opm95alalni] = KaikkiVuodet.opm95alalni
	,[isclekkoodi] = Case when KaikkiVuodet.isclek='''' then ''-1'' else Right(''00''+KaikkiVuodet.isclek,2) end --5.12.2014 Jarmo CSC Lisätään etunollat ja muutetaan tyhjä tuntemattomaksi
	,[isclekselite_FI] = ISNULL (CAST ((SELECT selite_FI FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Tuntematon'') 
	,[isclekselite_SV] = ISNULL (CAST ((SELECT selite_SV FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
	,[isclekselite_EN] = ISNULL (CAST ((SELECT selite_EN FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[isclekoodi] = KaikkiVuodet.iscle
	,[iscfikkoodi] = Case when KaikkiVuodet.iscfik='''' then ''-1'' else KaikkiVuodet.iscfik end --5.12.2014 Jarmo CSC Muutetaan tyhjä tuntemattomaksi
	,[iscdekoodi]  = KaikkiVuodet.iscde
	,[iscdeselite_FI] = ISNULL (CAST ((SELECT selite_FI FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Tuntematon'')
	,[iscdeselite_SV] = ISNULL (CAST ((SELECT selite_SV FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
	,[iscdeselite_EN] = ISNULL (CAST ((SELECT selite_EN FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[iscorkoodi] = KaikkiVuodet.iscor
	,[iscornimi_FI] = ISNULL (CAST ((SELECT selite_FI FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Tuntematon'')
	,[iscornimi_SV] = ISNULL (CAST ((SELECT selite_SV FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
	,[iscornimi_EN] = ISNULL (CAST ((SELECT selite_EN FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[iscstkoodi] = CAST (KaikkiVuodet.iscst AS nvarchar(255))
	,[iscstselite_FI] = ISNULL (CAST ((SELECT selite_FI FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Tuntematon'')
	,[iscstselite_SV] = ISNULL (CAST ((SELECT selite_SV FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
	,[iscstselite_EN] = ISNULL (CAST ((SELECT selite_EN FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[iscdukoodi] = CAST (KaikkiVuodet.iscdu AS nvarchar(255))
	,[iscduselite_FI] = ISNULL (CAST ((SELECT selite_FI FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Tuntematon'')
    ,[iscduselite_SV] = ISNULL (CAST ((SELECT selite_SV FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
    ,[iscduselite_EN] = ISNULL (CAST ((SELECT selite_EN FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),''Manuaalinen'') 
	,[korvaavakoodi] = ISNULL (KaikkiVuodet.korvaavakoodi,'''')
    ,[iscleselite_FI] = ISNULL (CAST (KaikkiVuodet.iscleknim AS nvarchar(255)),''Tuntematon'')
    ,[iscleselite_SV] = ISNULL (CAST (''*SV*'' + KaikkiVuodet.iscleknim AS nvarchar(255)),''Information saknas'')
    ,[iscleselite_EN] = ISNULL (CAST ('' *EN*'' + KaikkiVuodet.iscleknim AS nvarchar(255)),''Missing data'')
    ,[iscfikselite_FI] = Case when KaikkiVuodet.iscfiknim='''' then ''Tuntematon'' else ISNULL (CAST (KaikkiVuodet.iscfiknim AS nvarchar(255)),''Tuntematon'') end
    ,[iscfikselite_SV] = Case when KaikkiVuodet.iscfiknim='''' then ''Information saknas'' else ISNULL (CAST (''*SV*'' + KaikkiVuodet.iscfiknim AS nvarchar(255)),''Information saknas'') end
    ,[iscfikselite_EN] = Case when KaikkiVuodet.iscfiknim='''' then ''Missing data'' else ISNULL (CAST (''*EN*'' + KaikkiVuodet.iscfiknim AS nvarchar(255)),''Missing data'') end
    ,[koulutusala_tkselite_EN] = ISNULL (CAST (''*EN*'' + KaikkiVuodet.kalanimi AS nvarchar(255)),''Missing data'')
    ,[koulutusaste_tkselite_EN] = ISNULL (CAST (''*EN*'' + KaikkiVuodet.kastenimi AS nvarchar(255)),''Missing data'')
    ,[koulutusala2002koodi] = CAST (KaikkiVuodet.opmala AS nvarchar(2))
    ,[koulutusala2002selite_FI] = ISNULL (CAST (KaikkiVuodet.opmalani AS nvarchar(255)),''Tuntematon'')
    ,[koulutusala2002selite_SV] = ISNULL (CAST ((SELECT koulutusala_2002_SV FROM VipunenTK_lisatiedot.dbo.koulutusala2002 k WHERE k.koulutusala_2002koodi=KaikkiVuodet.opmala AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'') 
    ,[koulutusala2002selite_EN] = ISNULL (CAST ((SELECT koulutusala_2002_EN FROM VipunenTK_lisatiedot.dbo.koulutusala2002 k WHERE k.koulutusala_2002koodi=KaikkiVuodet.opmala AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'') 
    ,[opintoala2002koodi] = CAST (KaikkiVuodet.opmopa AS nvarchar(3))
	,[opintoala2002selite_FI] = ISNULL (CAST (KaikkiVuodet.opmopani AS nvarchar(255)),''Tuntematon'')
    ,[opintoala2002selite_SV] = ISNULL (CAST ((SELECT opintoala2002_SV FROM VipunenTK_lisatiedot.dbo.opintoala2002 k WHERE k.opintoala2002_koodi=KaikkiVuodet.opmopa AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'') 
    ,[opintoala2002selite_EN] = ISNULL (CAST ((SELECT opintoala2002_EN FROM VipunenTK_lisatiedot.dbo.opintoala2002 k WHERE k.opintoala2002_koodi=KaikkiVuodet.opmopa AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'') 
   	,[koulutusaste2002koodi] = CAST (KaikkiVuodet.opmast AS nvarchar(2))
    ,[koulutusaste2002selite_FI] = ISNULL (CAST (KaikkiVuodet.opmastni AS nvarchar(255)),''Tuntematon'')
    ,[koulutusaste2002selite_SV] = ISNULL (CAST ((SELECT koulutusaste_2002_SV FROM VipunenTK_lisatiedot.dbo.koulutusaste_2002 k WHERE k.koulutusaste_2002koodi=KaikkiVuodet.opmast AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'')
    ,[koulutusaste2002selite_EN] = ISNULL (CAST ((SELECT koulutusaste_2002_EN FROM VipunenTK_lisatiedot.dbo.koulutusaste_2002 k WHERE k.koulutusaste_2002koodi=KaikkiVuodet.opmast AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'')
	,[koulutusala1995koodi] = CAST (KaikkiVuodet.opm95ala AS nvarchar(2))
    ,[koulutusala1995selite_FI] = ISNULL (CAST (KaikkiVuodet.opm95alani AS nvarchar(255)),''Tuntematon'')
    ,[koulutusala1995selite_SV] = ISNULL (CAST (''*SV*'' + KaikkiVuodet.opm95alani AS nvarchar(255)),''Information saknas'')
    ,[koulutusala1995selite_EN] = ISNULL (CAST (''*EN*'' + KaikkiVuodet.opm95alani AS nvarchar(255)),''Missing data'')
    ,[opintoala1995koodi] = CAST (KaikkiVuodet.opm95opa AS nvarchar(2))
    ,[opintoala1995selite_FI] = ISNULL (CAST (KaikkiVuodet.opm95opani AS nvarchar(255)),''Tuntematon'')
    ,[opintoala1995selite_SV] = ISNULL (CAST ((SELECT opintoala_1995_SV FROM VipunenTK_lisatiedot.dbo.opintoala1995 k WHERE k.opintoala_1995koodi=KaikkiVuodet.opm95opa AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Information saknas'') 
    ,[opintoala1995selite_EN] = ISNULL (CAST ((SELECT opintoala_1995_EN FROM VipunenTK_lisatiedot.dbo.opintoala1995 k WHERE k.opintoala_1995koodi=KaikkiVuodet.opm95opa AND CAST(tilv+''-01-01'' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),''Missing data'') 
    ,[koulutusaste1995koodi] = CAST (KaikkiVuodet.opm95ast AS nvarchar(2))
    ,[koulutusaste1995selite_FI] = ISNULL (CAST (KaikkiVuodet.opm95astni AS nvarchar(255)),''Tuntematon'')
    ,[koulutusaste1995selite_SV] = ISNULL (CAST (''*SV*'' + KaikkiVuodet.opm95astni AS nvarchar(255)),''Information saknas'')
    ,[koulutusaste1995selite_EN] = ISNULL (CAST (''*EN*'' + KaikkiVuodet.opm95astni AS nvarchar(255)),''Missing data'')
    ,[olokoodi] = ISNULL (CAST (KaikkiVuodet.olokoodi AS nvarchar(255)),''Tuntematon'')
    ,[lakkautusvuosi] = ISNULL (CAST (KaikkiVuodet.lakkv AS nvarchar(255)),''Tuntematon'')
    ,[korvaava_koulutuskoodi] = ISNULL (CAST (KaikkiVuodet.korvkoulk AS nvarchar(6)),'''')
    ,[muutosvuosi] = ISNULL (CAST (KaikkiVuodet.nmuutosv AS nvarchar(255)),''Tuntematon'')
	,[iscle2011koodi] = CAST (KaikkiVuodet.iscle2011 AS nvarchar(255))
	,[iscle2011selite_FI] = case KaikkiVuodet.iscleni2011 when ''Bachelors or equivalent level'' then ''Bachelor''''s or equivalent level'' when ''Masters or equivalent level'' then ''Master''''s or equivalent level'' else ISNULL (CAST (KaikkiVuodet.iscleni2011 AS nvarchar(255)),''Tuntematon'') end
	,[iscle2011selite_SV] = case KaikkiVuodet.iscleni2011_r when ''Bachelors or equivalent level'' then ''Bachelor''''s or equivalent level'' when ''Masters or equivalent level'' then ''Master''''s or equivalent level'' else ISNULL (CAST (KaikkiVuodet.iscleni2011_r AS nvarchar(255)),''Information saknas'') end	
	,[iscle2011selite_EN] = case KaikkiVuodet.iscleni2011_e when ''Bachelors or equivalent level'' then ''Bachelor''''s or equivalent level'' when ''Masters or equivalent level'' then ''Master''''s or equivalent level'' else ISNULL (CAST (KaikkiVuodet.iscleni2011_e AS nvarchar(255)),''Missing data'') end
	,[isccat2011koodi] = CAST (KaikkiVuodet.isccat2011 AS nvarchar(255))
	,[isccat2011selite_FI] = ISNULL (CAST (KaikkiVuodet.isccatni2011 AS nvarchar(255)),''Tuntematon'')
	,[isccat2011selite_SV] = ISNULL (CAST (KaikkiVuodet.isccatni2011_r AS nvarchar(255)),''Information saknas'')
	,[isccat2011selite_EN] = ISNULL (CAST (KaikkiVuodet.isccatni2011_e AS nvarchar(255)),''Missing data'')
	,[iscsubcat2011koodi] = CAST (KaikkiVuodet.iscsubcat2011 AS nvarchar(255))
	,[iscsubcat2011selite_FI] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011 AS nvarchar(255)),''Tuntematon'')
	,[iscsubcat2011selite_SV] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011_r AS nvarchar(255)),''Information saknas'')
	,[iscsubcat2011selite_EN] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011_e AS nvarchar(255)),''Missing data'')
	,[iscfi2013koodi] = CAST (KaikkiVuodet.iscfi2013 AS nvarchar(255))
	,[iscfi2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfini2013 AS nvarchar(255)),''Tuntematon'')
	,[iscfi2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfini2013_r AS nvarchar(255)),''Information saknas'')
	,[iscfi2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfini2013_e AS nvarchar(255)),''Missing data'')
	,[iscfinarrow2013koodi] = CAST (KaikkiVuodet.iscfinarrow2013 AS nvarchar(255))
	,[iscfinarrow2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013 AS nvarchar(255)),''Tuntematon'')
	,[iscfinarrow2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013_r AS nvarchar(255)),''Information saknas'')
	,[iscfinarrow2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013_e AS nvarchar(255)),''Missing data'')
	,[iscfibroad2013koodi] = CAST (KaikkiVuodet.iscfibroad2013 AS nvarchar(255))
	,[iscfibroad2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013 AS nvarchar(255)),''Tuntematon'')
	,[iscfibroad2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013_r AS nvarchar(255)),''Information saknas'')
	,[iscfibroad2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013_e AS nvarchar(255)),''Missing data'')
	,[kaste_t2koodi] = ISNULL(CAST (KaikkiVuodet.kaste_t2 AS nvarchar(255)),''-1'')
	,[kaste_t2_FI] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni] AS nvarchar(255)),''Tuntematon'')
	,[kaste_t2_SV] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni_sv] AS nvarchar(255)),''Information saknas'')
	,[kaste_t2_EN] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni_en] AS nvarchar(255)),''Missing data'')

    --,[jarjestys] = ''''
    --,[jarjestys_taso] = ''''
    --,[jarjestys_koulutusala_tk] = ''''
    --,[jarjestys_koulutusaste_tk] = ''''
    --,[jarjestys_koulutusala2002] = ''''
    --,[jarjestys_opintoala2002] = ''''
    --,[jarjestys_koulutusaste2002] = ''''
    --,[jarjestys_koulutusala1995] = ''''
    --,[jarjestys_opintoala1995] = ''''
    --,[jarjestys_koulutusaste1995] = ''''
    --,[jarjestys_isclek] = ''''
    --,[jarjestys_iscle] = ''''
    --,[jarjestys_iscfik] = ''''
    --,[jarjestys_iscde] = ''''
    --,[jarjestys_iscor] = ''''
    --,[jarjestys_iscst] = ''''
    --,[jarjestys_iscdu] = ''''
--INTO dbo._koulutusluokitus_vainkoulutuskoodit
FROM(

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv] = ''2000''
  FROM [Vipunen_koodisto].[koodisto_2000].[koulutusluokitus] d
  where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2001''
  FROM [Vipunen_koodisto].[koodisto_2001].[koulutusluokitus] d
  where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[koulutusluokitus] d
  where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003].[koulutusluokitus] d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004].[koulutusluokitus] d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[koulutusluokitus] d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''  

UNION ALL
 
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[koulutusluokitus] d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL
  
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[koulutusluokitus]  d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL
  
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[koulutusluokitus] d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''
UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
       ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[koulutusluokitus]  d
    where koulutuskoodi ! = ''-1'' and
  koulutuskoodi != ''-2''

UNION ALL

SELECT  [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
	   ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]
    where [koulk] != ''-1'' and
  [koulk] != ''-2''

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[koulutusluokitus]  
    where [koulk]  ! = ''-1'' and
  [koulk] != ''-2''
  
  
 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[koulutusluokitus]  
    where [koulk]  ! = ''-1'' and
  [koulk] != ''-2''

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
-- CSC Jarmo 30.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä kannattaa purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscle2011]
	   ,[iscleni2011]
	   ,[iscleni2011_r] = [iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011] */
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde] = ''TK_6_5_sopv_14''
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2013
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_14
    where [koulk]  ! = ''-1'' and
  [koulk] != ''-2''

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
-- CSC Jarmo 30.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä kannattaa purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscle2011]
	   ,[iscleni2011]
	   ,[iscleni2011_r] = [iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011] */
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
-- CSC Jarmo 29.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä pitää purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscfi2013]
	   ,[iscfini2013]
	   ,[iscfini2013_r] = [iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013]
	   ,[iscfinarrowni2013_r] = [iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013]
	   ,[iscfibroadni2013_r] = [iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013] */
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde] = ''TK_6_5_sopv_15''
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2014
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_15
    where [koulk]  ! = ''-1'' and
  [koulk] != ''-2''

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = ''TK_6_5_sopv_16b''
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2016
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_16b
    where [koulk]  ! = ''-1'' and
  [koulk] != ''-2''

) KaikkiVuodet

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013












' 
GO
/****** Object:  View [dbo].[v_koulutusluokitus]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutusluokitus]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[v_koulutusluokitus] AS

-- Palauta koulutusluokituksen koulutuskoodi, koulutusaste, koulutusala ja opintoala samalla
-- koulutusluokitus_avain sisältää
--  koulutuskoodi = kuusi numeroa
--  koulutusaste_tk = KASTE + koulutusaste_tk koodi
--  koulutusaste2002 = OPMAST + koulutusaste2002 koodi
--  opintoala2002 = OPMOPA + opintoala2002 koodi
--  opintoala1995 = OPM95OPA + opintoala1995 koodi
--  johdettu sosioekonominen asema koulutuskoodi SA9999
-- 2.10.2014 lisätty koulutusalat OPMALA ja OPM95ALA
-- 2.6.2016 lisätty kaste_taso2-kentät	


-- select * from [dbo].[v_koulutusluokitus]


--Palautetaan rivit
SELECT DISTINCT
      [koulutusluokitus_avain]
	  ,tilv
      ,[alkaa] = Cast(alkaa as date)
      ,[paattyy]
	  ,[koulutuskoodi]
      ,[koulutusselite_FI]
      ,[koulutusselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_FI]
      ,[koulutuslyhytselite_SV]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi] = ISNULL([tasokoodi], '''')
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[koulutusaste_tkselite_EN]
      ,ISNULL([isclekkoodi], ''-1'') [isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,ISNULL([iscdekoodi], ''-1'') [iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,ISNULL([iscorkoodi], ''-1'') [iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,ISNULL([iscstkoodi], ''-1'') [iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,ISNULL([iscdukoodi], ''-1'') [iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,ISNULL([isclekoodi], ''-1'') [isclekoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,ISNULL([iscfikkoodi], ''-1'') [iscfikkoodi]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
      --,[iscle2011koodi] = ISNULL([iscle2011koodi], ''-1'') 
      --,[iscle2011selite_FI] = case when [iscle2011selite_FI]=''Tuntematon'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_FI from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_FI,'''')<>'''') else kaikkirivit.[iscle2011selite_FI] end
      --,[iscle2011selite_SV] = case when [iscle2011selite_SV]=''Information saknas'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_SV from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_SV,'''')<>'''') else kaikkirivit.[iscle2011selite_SV] end
      --,[iscle2011selite_EN] = case when [iscle2011selite_EN]=''Missing data'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_EN from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_EN,'''')<>'''') else kaikkirivit.[iscle2011selite_EN] end
	  -- yo selitteet tulevat nyt tilastokeskukselta / CSC Jarmo 2.6.2016
      ,[iscle2011koodi] = ISNULL([iscle2011koodi], ''-1'') 
      ,[iscle2011selite_FI] --= case when [iscle2011selite_FI]=''Tuntematon'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_FI from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_FI,'''')<>'''') else kaikkirivit.[iscle2011selite_FI] end
      ,[iscle2011selite_SV] --= case when [iscle2011selite_SV]=''Information saknas'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_SV from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_SV,'''')<>'''') else kaikkirivit.[iscle2011selite_SV] end
      ,[iscle2011selite_EN] --= case when [iscle2011selite_EN]=''Missing data'' and iscle2011koodi is not null and iscle2011koodi<>''-1'' then (select top 1 kv.iscle2011selite_EN from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_EN,'''')<>'''') else kaikkirivit.[iscle2011selite_EN] end
      ,[isccat2011koodi] = ISNULL([isccat2011koodi], ''-1'') 
      ,[isccat2011selite_FI]
      ,[isccat2011selite_SV]
      ,[isccat2011selite_EN]
      ,[iscsubcat2011koodi] = ISNULL([iscsubcat2011koodi], ''-1'') 
      ,[iscsubcat2011selite_FI]
      ,[iscsubcat2011selite_SV]
      ,[iscsubcat2011selite_EN]
      ,[iscfi2013koodi] = ISNULL([iscfi2013koodi], ''-1'') 
      ,[iscfi2013selite_FI]
      ,[iscfi2013selite_SV]
      ,[iscfi2013selite_EN]
      ,[iscfinarrow2013koodi] = ISNULL([iscfinarrow2013koodi], ''-1'') 
      ,[iscfinarrow2013selite_FI]
      ,[iscfinarrow2013selite_SV]
      ,[iscfinarrow2013selite_EN]
      ,[iscfibroad2013koodi] = ISNULL([iscfibroad2013koodi], ''-1'') 
      ,[iscfibroad2013selite_FI]
      ,[iscfibroad2013selite_SV]
      ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi]
	  ,[kaste_t2_FI]
	  ,[kaste_t2_SV]
	  ,[kaste_t2_EN]
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
      ,[tietolahde]
      ,[korvaavakoodi]

-- Järjestys yhtenäistetty / Jarmo 4.12.2014
      ,[jarjestys] = Cast(Left(Case when [koulutusselite_FI]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusselite_FI],''Tuntematon''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala_tk] = Cast(Left(Case when koulutusala_tkselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala_tkkoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala1995] = Cast(Left(Case when koulutusala1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala1995koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala2002] = Cast(Left(Case when koulutusala2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala2002koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste_tk] = Cast(Left(Case when koulutusaste_tkselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste_tkkoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste1995] = Cast(Left(Case when koulutusaste1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste1995koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste2002] = Cast(Left(Case when koulutusaste2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste2002koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_opintoala1995] = Cast(Left(Case when opintoala1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([opintoala1995koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_opintoala2002] = Cast(Left(Case when opintoala2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([opintoala2002koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_isclek] = Cast(Left(Case when isclekselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isclekkoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscde] = Cast(Left(Case when iscdeselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscdekoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscst] = Cast(Left(Case when iscstselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscstkoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscdu] = Cast(Left(Case when iscduselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscdukoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscle] = Cast(Left(Case when iscleselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isclekoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscfik] = Cast(Left(Case when iscfikselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfikkoodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscle2011] = Cast(Left(Case when iscle2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscle2011koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_isccat2011] = Cast(Left(Case when isccat2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isccat2011koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscsubcat2011] = Cast(Left(Case when iscsubcat2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscsubcat2011koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscfi2013] = Cast(Left(Case when iscfi2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfi2013koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscfinarrow2013] = Cast(Left(Case when iscfinarrow2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfinarrow2013koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_iscfibroad2013] = Cast(Left(Case when iscfibroad2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfibroad2013koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      ,[jarjestys_kaste_t2] = Cast(Left(Case when [kaste_t2_FI]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([kaste_t2koodi],''-1''),''ööö'') end, 10) as nvarchar(10))


FROM ( --kaikkirivit


--Koulutuskoodit
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (koulutuskoodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi]
      ,[koulutusselite_FI]
      ,[koulutusselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_FI]
      ,[koulutuslyhytselite_SV]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[koulutusaste_tkselite_EN]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[isclekoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikkoodi]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi]
	  ,[kaste_t2_FI]
	  ,[kaste_t2_SV]
	  ,[kaste_t2_EN]
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
      ,[tietolahde]
      ,[korvaavakoodi]

-- Järjestys yhtenäistetty / Jarmo 4.12.2014
      ,[jarjestys] = Case when [koulutusselite_FI]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusselite_FI],''Tuntematon''),''ööö'') end
      ,[jarjestys_koulutusala_tk] = Case when koulutusala_tkselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala_tkkoodi],''-1''),''ööö'') end
      ,[jarjestys_koulutusala1995] = Case when koulutusala1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala1995koodi],''-1''),''ööö'') end
      ,[jarjestys_koulutusala2002] = Case when koulutusala2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusala2002koodi],''-1''),''ööö'') end
      ,[jarjestys_koulutusaste_tk] = Case when koulutusaste_tkselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste_tkkoodi],''-1''),''ööö'') end
      ,[jarjestys_koulutusaste1995] = Case when koulutusaste1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste1995koodi],''-1''),''ööö'') end
      ,[jarjestys_koulutusaste2002] = Case when koulutusaste2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([koulutusaste2002koodi],''-1''),''ööö'') end
      ,[jarjestys_opintoala1995] = Case when opintoala1995selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([opintoala1995koodi],''-1''),''ööö'') end
      ,[jarjestys_opintoala2002] = Case when opintoala2002selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([opintoala2002koodi],''-1''),''ööö'') end
      ,[jarjestys_isclek] = Case when isclekselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isclekkoodi],''-1''),''ööö'') end
      ,[jarjestys_iscde] = Case when iscdeselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscdekoodi],''-1''),''ööö'') end
      ,[jarjestys_iscst] = Case when iscstselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscstkoodi],''-1''),''ööö'') end
      ,[jarjestys_iscdu] = Case when iscduselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscdukoodi],''-1''),''ööö'') end
      ,[jarjestys_iscle] = Case when iscleselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isclekoodi],''-1''),''ööö'') end
      ,[jarjestys_iscfik] = Case when iscfikselite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfikkoodi],''-1''),''ööö'') end
      ,[jarjestys_iscle2011] = Case when iscle2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscle2011koodi],''-1''),''ööö'') end
      ,[jarjestys_isccat2011] = Case when isccat2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([isccat2011koodi],''-1''),''ööö'') end
      ,[jarjestys_iscsubcat2011] = Case when iscsubcat2011selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscsubcat2011koodi],''-1''),''ööö'') end
      ,[jarjestys_iscfi2013] = Case when iscfi2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfi2013koodi],''-1''),''ööö'') end
      ,[jarjestys_iscfinarrow2013] = Case when iscfinarrow2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfinarrow2013koodi],''-1''),''ööö'') end
      ,[jarjestys_iscfibroad2013] = Case when iscfibroad2013selite_FI=''Tuntematon'' then ''ööö'' else Isnull(Nullif([iscfibroad2013koodi],''-1''),''ööö'') end
      ,[jarjestys_kaste_t2] = Cast(Left(Case when [kaste_t2_FI]=''Tuntematon'' then ''ööö'' else Isnull(Nullif([kaste_t2koodi],''-1''),''ööö'') end, 10) as nvarchar(10))
      
      --Alkuperäinen koodi
      --,[jarjestys] = [koulutusselite_FI]
      --,[jarjestys_koulutusala_tk] = koulutusala_tkselite_FI
      --,[jarjestys_koulutusala1995] = koulutusala1995selite_FI
      --,[jarjestys_koulutusala2002] = koulutusala2002selite_FI
      --,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      --,[jarjestys_koulutusaste1995] = koulutusaste1995selite_FI
      --,[jarjestys_koulutusaste2002] = koulutusaste2002selite_FI
      --,[jarjestys_opintoala1995] = opintoala1995selite_FI
      --,[jarjestys_opintoala2002] = opintoala2002selite_FI
      --,[jarjestys_isclek] = isclekselite_FI
      --,[jarjestys_iscde] = iscdeselite_FI
      --,[jarjestys_iscst] = iscstselite_FI
      --,[jarjestys_iscdu] = iscduselite_FI
      --,[jarjestys_iscle] = iscleselite_FI
      --,[jarjestys_iscfik] = iscfikselite_FI


FROM (
SELECT --DISTINCT
	   [koulutuskoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[koulutusselite_FI]
      ,[koulutuslyhytselite_FI]
      ,[koulutusselite_SV]
      ,[koulutuslyhytselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[isclekoodi]
      ,[iscfikkoodi]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[tietolahde]
      ,[korvaavakoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi]
	  ,[kaste_t2_FI]
	  ,[kaste_t2_SV]
	  ,[kaste_t2_EN]
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
  FROM [Vipunen_koodisto].dbo._v_koulutusluokitus_kaikkivuodet
  where [koulutuskoodi]  ! = ''-1'' and
  [koulutuskoodi] != ''-2'' 
 ) koulutuskoodit
 
--Koulutusala_2002 OPMALA
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''OPMALA''+koulutusala2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = ''-1''
      ,[koulutusasteselite_FI] = ''Tuntematon''
      ,[koulutusasteselite_SV] = ''Okänd''
      ,[koulutusasteselite_EN] = ''Unknown''
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      ,[koulutusala2002koodi] = koulutusala2002koodi
      ,[koulutusala2002selite_FI] = koulutusala2002selite_FI
      ,[koulutusala2002selite_SV] = koulutusala2002selite_SV
      ,[koulutusala2002selite_EN] = koulutusala2002selite_EN
      ,[opintoala2002koodi] = ''-1''
      ,[opintoala2002selite_FI] = ''Tuntematon''
      ,[opintoala2002selite_SV] = ''Okänd''
      ,[opintoala2002selite_EN] = ''Unknown''
      ,[koulutusaste2002koodi] = ''-1''
      ,[koulutusaste2002selite_FI] = ''Tuntematon''
      ,[koulutusaste2002selite_SV] = ''Okänd''
      ,[koulutusaste2002selite_EN] = ''Unknown''
      ,[koulutusala1995koodi] = ''-1''
      ,[koulutusala1995selite_FI] = ''Tuntematon''
      ,[koulutusala1995selite_SV] = ''Okänd''
      ,[koulutusala1995selite_EN] = ''Unknown''
      ,[opintoala1995koodi] = ''-1''
      ,[opintoala1995selite_FI] = ''Tuntematon''
      ,[opintoala1995selite_SV] = ''Okänd''
      ,[opintoala1995selite_EN] = ''Unknown''
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL OPMALA''
      ,[korvaavakoodi] = ''''
      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  ''ööö''
      ,[jarjestys_koulutusala2002] =  koulutusala2002selite_FI
      ,[jarjestys_koulutusaste_tk] = ''ööö''
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''ööö''
      ,[jarjestys_opintoala1995] =  ''ööö''
      ,[jarjestys_opintoala2002] =  ''ööö''
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      -- ,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusala2002koodi]   ! = ''-1''
  and [koulutusala2002koodi] != ''-2'' 
  and [koulutusala2002selite_FI] != ''Tuntematon'' 
 ) koulutusalat_2002

--Koulutusala_1995 OPM95ALA
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''OPM95ALA''+koulutusala1995koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = ''-1''
      ,[koulutusasteselite_FI] = ''Tuntematon''
      ,[koulutusasteselite_SV] = ''Okänd''
      ,[koulutusasteselite_EN] = ''Unknown''
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      ,[koulutusala2002koodi] = ''-1''
      ,[koulutusala2002selite_FI] = ''Tuntematon''
      ,[koulutusala2002selite_SV] = ''Okänd''
      ,[koulutusala2002selite_EN] = ''Unknown''
      ,[opintoala2002koodi] = ''-1''
      ,[opintoala2002selite_FI] = ''Tuntematon''
      ,[opintoala2002selite_SV] = ''Okänd''
      ,[opintoala2002selite_EN] = ''Unknown''
      ,[koulutusaste2002koodi] = ''-1''
      ,[koulutusaste2002selite_FI] = ''Tuntematon''
      ,[koulutusaste2002selite_SV] = ''Okänd''
      ,[koulutusaste2002selite_EN] = ''Unknown''
      ,[koulutusala1995koodi] = koulutusala1995koodi
      ,[koulutusala1995selite_FI] = koulutusala1995selite_FI
      ,[koulutusala1995selite_SV] = koulutusala1995selite_SV
      ,[koulutusala1995selite_EN] = koulutusala1995selite_EN
      ,[opintoala1995koodi] = ''-1''
      ,[opintoala1995selite_FI] = ''Tuntematon''
      ,[opintoala1995selite_SV] = ''Okänd''
      ,[opintoala1995selite_EN] = ''Unknown''
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL OPM95ALA''
      ,[korvaavakoodi] = ''''
      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  koulutusala1995selite_FI
      ,[jarjestys_koulutusala2002] =  ''ööö''
      ,[jarjestys_koulutusaste_tk] = ''ööö''
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''ööö''
      ,[jarjestys_opintoala1995] =  ''ööö''
      ,[jarjestys_opintoala2002] =  ''ööö''
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      -- ,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusala1995koodi]   ! = ''-1''
  and [koulutusala1995koodi] != ''-2'' 
  and [koulutusala1995selite_FI] != ''Tuntematon'' 
 ) koulutusalat_1995



--Koulutusaste_tk
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''KASTE''+koulutusaste_tkkoodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = koulutusaste_tkkoodi
      ,[koulutusasteselite_FI] = koulutusaste_tkselite_FI
      ,[koulutusasteselite_SV] = koulutusaste_tkselite_SV
      ,[koulutusasteselite_EN] = koulutusaste_tkselite_EN
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      ,[koulutusala2002koodi] = ''-1''
      ,[koulutusala2002selite_FI] = ''Tuntematon''
      ,[koulutusala2002selite_SV] = ''Okänd''
      ,[koulutusala2002selite_EN] = ''Unknown''
      ,[opintoala2002koodi] = ''-1''
      ,[opintoala2002selite_FI] = ''Tuntematon''
      ,[opintoala2002selite_SV] = ''Okänd''
      ,[opintoala2002selite_EN] = ''Unknown''
      ,[koulutusaste2002koodi] = ''-1''
      ,[koulutusaste2002selite_FI] = ''Tuntematon''
      ,[koulutusaste2002selite_SV] = ''Okänd''
      ,[koulutusaste2002selite_EN] = ''Unknown''
      ,[koulutusala1995koodi] = ''-1''
      ,[koulutusala1995selite_FI] = ''Tuntematon''
      ,[koulutusala1995selite_SV] = ''Okänd''
      ,[koulutusala1995selite_EN] = ''Unknown''
      ,[opintoala1995koodi] = ''-1''
      ,[opintoala1995selite_FI] = ''Tuntematon''
      ,[opintoala1995selite_SV] = ''Okänd''
      ,[opintoala1995selite_EN] = ''Unknown''
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL KASTE''
      ,[korvaavakoodi] = ''''

      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  ''ööö''
      ,[jarjestys_koulutusala2002] =  ''ööö''
      ,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''ööö''
      ,[jarjestys_opintoala1995] =  ''ööö''
      ,[jarjestys_opintoala2002] =  ''ööö''
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusaste_tkkoodi]  ! = ''-1''
  and [koulutusaste_tkkoodi] != ''-2'' 
  and [koulutusaste_tkselite_FI] != ''Tuntematon'' 
  --order by koulutusaste_tkkoodi
 ) koulutusasteet_tk


--Koulutusaste2002
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''OPMAST''+koulutusaste2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = ''-1''
      ,[koulutusasteselite_FI] = ''Tuntematon''
      ,[koulutusasteselite_SV] = ''Okänd''
      ,[koulutusasteselite_EN] = ''Unknown''
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      ,[koulutusala2002koodi] = ''-1''
      ,[koulutusala2002selite_FI] = ''Tuntematon''
      ,[koulutusala2002selite_SV] = ''Okänd''
      ,[koulutusala2002selite_EN] = ''Unknown''
      ,[opintoala2002koodi] = ''-1''
      ,[opintoala2002selite_FI] = ''Tuntematon''
      ,[opintoala2002selite_SV] = ''Okänd''
      ,[opintoala2002selite_EN] = ''Unknown''
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi] = ''-1''
      ,[koulutusala1995selite_FI] = ''Tuntematon''
      ,[koulutusala1995selite_SV] = ''Okänd''
      ,[koulutusala1995selite_EN] = ''Unknown''
      ,[opintoala1995koodi] = ''-1''
      ,[opintoala1995selite_FI] = ''Tuntematon''
      ,[opintoala1995selite_SV] = ''Okänd''
      ,[opintoala1995selite_EN] = ''Unknown''
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL OPMAST''
      ,[korvaavakoodi] = ''''

      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  ''ööö''
      ,[jarjestys_koulutusala2002] =  ''ööö''
      ,[jarjestys_koulutusaste_tk] = ''ööö''
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''koulutusaste2002selite_FI''
      ,[jarjestys_opintoala1995] =  ''ööö''
      ,[jarjestys_opintoala2002] =  ''ööö''
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusaste_tkkoodi]  ! = ''-1''
  and [koulutusaste2002koodi] != ''-2'' 
  and [koulutusaste2002koodi] != '''' 
  and [koulutusaste2002selite_FI] != ''Tuntematon'' 
  --order by koulutusaste2002koodi
 ) koulutusasteet2002
 


--Opintoala2002
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''OPMOPA''+opintoala2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = ''-1''
      ,[koulutusasteselite_FI] = ''Tuntematon''
      ,[koulutusasteselite_SV] = ''Okänd''
      ,[koulutusasteselite_EN] = ''Unknown''
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala2002koodi] --= ''-1''
      ,[koulutusala2002selite_FI] --= ''Tuntematon''
      ,[koulutusala2002selite_SV] --= ''Okänd''
      ,[koulutusala2002selite_EN] --= ''Unknown''
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi] = ''-1''
      ,[koulutusaste2002selite_FI] = ''Tuntematon''
      ,[koulutusaste2002selite_SV] = ''Okänd''
      ,[koulutusaste2002selite_EN] = ''Unknown''
      ,[koulutusala1995koodi] = ''-1''
      ,[koulutusala1995selite_FI] = ''Tuntematon''
      ,[koulutusala1995selite_SV] = ''Okänd''
      ,[koulutusala1995selite_EN] = ''Unknown''
      ,[opintoala1995koodi] = ''-1''
      ,[opintoala1995selite_FI] = ''Tuntematon''
      ,[opintoala1995selite_SV] = ''Okänd''
      ,[opintoala1995selite_EN] = ''Unknown''
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL OPMOPA''
      ,[korvaavakoodi] = ''''

      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  ''ööö''
      ,[jarjestys_koulutusala2002] =  ''ööö''
      ,[jarjestys_koulutusaste_tk] = ''ööö''
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''ööö''
      ,[jarjestys_opintoala1995] =  ''ööö''
      ,[jarjestys_opintoala2002] =  opintoala2002selite_FI
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [opintoala2002koodi]  ! = ''-1''
  and [opintoala2002koodi] != ''-2'' 
  and [opintoala2002koodi] != '''' 
  and [opintoala2002selite_FI] != ''Tuntematon'' 
  --order by koulutusaste2002koodi
 ) opintoalat2002


--Opintoala1995
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''OPM95OPA''+opintoala1995koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = ''-1''
      ,[koulutusselite_FI] = ''Tuntematon''
      ,[koulutusselite_SV] = ''Okänd''
      ,[koulutusselite_EN] = ''Unknown''
      ,[koulutuslyhytselite_FI] = ''Tuntematon''
      ,[koulutuslyhytselite_SV] = ''Okänd''
      ,[koulutuslyhytselite_EN] = ''Unknown''
      ,[tasokoodi] = ''-1''
	  ,[koulutusalakoodi] = ''-1''
      ,[koulutusalaselite_FI] = ''Tuntematon''
      ,[koulutusalaselite_SV] = ''Okänd''
      ,[koulutusalaselite_EN] = ''Unknown''
	  ,[koulutusastekoodi] = ''-1''
      ,[koulutusasteselite_FI] = ''Tuntematon''
      ,[koulutusasteselite_SV] = ''Okänd''
      ,[koulutusasteselite_EN] = ''Unknown''
      ,[isclekkoodi] = ''-1''
      ,[isclekselite_FI] = ''Tuntematon''
      ,[isclekselite_SV] = ''Okänd''
      ,[isclekselite_EN] = ''Unknown''
      ,[iscdekoodi] = ''-1''
      ,[iscdeselite_FI] = ''Tuntematon''
      ,[iscdeselite_SV] = ''Okänd''
      ,[iscdeselite_EN] = ''Unknown''
      ,[iscorkoodi] = ''-1''
      ,[iscornimi_FI] = ''Tuntematon''
      ,[iscornimi_SV] = ''Okänd''
      ,[iscornimi_EN] = ''Unknown''
      ,[iscstkoodi] = ''-1''
      ,[iscstselite_FI] = ''Tuntematon''
      ,[iscstselite_SV] = ''Okänd''
      ,[iscstselite_EN] = ''Unknown''
      ,[iscdukoodi] = ''-1''
      ,[iscduselite_FI] = ''Tuntematon''
      ,[iscduselite_SV] = ''Okänd''
      ,[iscduselite_EN] = ''Unknown''
      ,[isclekoodi] = ''-1''
      ,[iscleselite_FI] = ''Tuntematon''
      ,[iscleselite_SV] = ''Okänd''
      ,[iscleselite_EN] = ''Unknown''
      ,[iscfikkoodi] = ''-1''
      ,[iscfikselite_FI] = ''Tuntematon''
      ,[iscfikselite_SV] = ''Okänd''
      ,[iscfikselite_EN] = ''Unknown''
      ,[koulutusala2002koodi] = ''-1''
      ,[koulutusala2002selite_FI] = ''Tuntematon''
      ,[koulutusala2002selite_SV] = ''Okänd''
      ,[koulutusala2002selite_EN] = ''Unknown''
      ,[opintoala2002koodi] = ''-1''
      ,[opintoala2002selite_FI] = ''Tuntematon''
      ,[opintoala2002selite_SV] = ''Okänd''
      ,[opintoala2002selite_EN] = ''Unknown''
      ,[koulutusaste2002koodi] = ''-1''
      ,[koulutusaste2002selite_FI] = ''Tuntematon''
      ,[koulutusaste2002selite_SV] = ''Okänd''
      ,[koulutusaste2002selite_EN] = ''Unknown''
      ,[koulutusala1995koodi] --= ''-1''
      ,[koulutusala1995selite_FI] --= ''Tuntematon''
      ,[koulutusala1995selite_SV] --= ''Okänd''
      ,[koulutusala1995selite_EN] --= ''Unknown''
      ,[opintoala1995koodi] = opintoala1995koodi
      ,[opintoala1995selite_FI] = opintoala1995selite_FI
      ,[opintoala1995selite_SV] = opintoala1995selite_SV
      ,[opintoala1995selite_EN] = opintoala1995selite_EN
      ,[koulutusaste1995koodi] = ''-1''
      ,[koulutusaste1995selite_FI] = ''Tuntematon''
      ,[koulutusaste1995selite_SV] = ''Okänd''
      ,[koulutusaste1995selite_EN] = ''Unknown''
	  ,[iscle2011koodi] = ''-1''
	  ,[iscle2011selite_FI] = ''Tuntematon''
	  ,[iscle2011selite_SV] = ''Okänd''
	  ,[iscle2011selite_EN] = ''Unknown''
	  ,[isccat2011koodi] = ''-1''
	  ,[isccat2011selite_FI] = ''Tuntematon''
	  ,[isccat2011selite_SV] = ''Okänd''
	  ,[isccat2011selite_EN] = ''Unknown''
	  ,[iscsubcat2011koodi] = ''-1''
	  ,[iscsubcat2011selite_FI] = ''Tuntematon''
	  ,[iscsubcat2011selite_SV] = ''Okänd''
	  ,[iscsubcat2011selite_EN] = ''Unknown''
	  ,[iscfi2013koodi] = ''-1''
	  ,[iscfi2013selite_FI] = ''Tuntematon''
	  ,[iscfi2013selite_SV] = ''Okänd''
	  ,[iscfi2013selite_EN] = ''Unknown''
	  ,[iscfinarrow2013koodi] = ''-1''
	  ,[iscfinarrow2013selite_FI] = ''Tuntematon''
	  ,[iscfinarrow2013selite_SV] = ''Okänd''
	  ,[iscfinarrow2013selite_EN] = ''Unknown''
	  ,[iscfibroad2013koodi] = ''-1''
	  ,[iscfibroad2013selite_FI] = ''Tuntematon''
	  ,[iscfibroad2013selite_SV] = ''Okänd''
	  ,[iscfibroad2013selite_EN] = ''Unknown''
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi] = ''-1''
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''''
      ,[tietolahde] = ''CSC SQL OPM95OPA''
      ,[korvaavakoodi] = ''''

      ,[jarjestys] =  ''ööö''
      ,[jarjestys_koulutusala_tk] =  ''ööö''
      ,[jarjestys_koulutusala1995] =  ''ööö''
      ,[jarjestys_koulutusala2002] =  ''ööö''
      ,[jarjestys_koulutusaste_tk] = ''ööö''
      ,[jarjestys_koulutusaste1995] =  ''ööö''
      ,[jarjestys_koulutusaste2002] =  ''ööö''
      ,[jarjestys_opintoala1995] =  opintoala1995selite_FI
      ,[jarjestys_opintoala2002] =  ''ööö''
      ,[jarjestys_isclek] =  ''ööö''
      ,[jarjestys_iscde] =  ''ööö''
      ,[jarjestys_iscst] =  ''ööö''
      ,[jarjestys_iscdu] =  ''ööö''
      ,[jarjestys_iscle] =  ''ööö''
      ,[jarjestys_iscfik] =  ''ööö''
      ,[jarjestys_iscle2011] = ''ööö''
      ,[jarjestys_isccat2011] = ''ööö''
      ,[jarjestys_iscsubcat2011] = ''ööö''
      ,[jarjestys_iscfi2013] = ''ööö''
      ,[jarjestys_iscfinarrow2013] = ''ööö''
      ,[jarjestys_iscfibroad2013] = ''ööö''
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [opintoala1995koodi]  ! = ''-1''
  and [opintoala1995koodi] != ''-2'' 
  and [opintoala1995koodi] != '''' 
  and [opintoala1995selite_FI] != ''Tuntematon'' 
  --order by koulutusaste2002koodi
 ) opintoalat1995
 
 
-- SA9999
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (''SA9999'' AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi]
      ,[koulutusselite_FI]
      ,[koulutusselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_FI]
      ,[koulutuslyhytselite_SV]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[koulutusaste_tkselite_EN]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[isclekoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikkoodi]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
      ,[tietolahde]
      ,[korvaavakoodi]
      
      ,[jarjestys] = [koulutusselite_FI]
      ,[jarjestys_koulutusala_tk] = koulutusala_tkselite_FI
      ,[jarjestys_koulutusala1995] = koulutusala1995selite_FI
      ,[jarjestys_koulutusala2002] = koulutusala2002selite_FI
      ,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      ,[jarjestys_koulutusaste1995] = koulutusaste1995selite_FI
      ,[jarjestys_koulutusaste2002] = koulutusaste2002selite_FI
      ,[jarjestys_opintoala1995] = opintoala1995selite_FI
      ,[jarjestys_opintoala2002] = opintoala2002selite_FI
      ,[jarjestys_isclek] = isclekselite_FI
      ,[jarjestys_iscde] = iscdeselite_FI
      ,[jarjestys_iscst] = iscstselite_FI
      ,[jarjestys_iscdu] = iscduselite_FI
      ,[jarjestys_iscle] = iscleselite_FI
      ,[jarjestys_iscfik] = iscfikselite_FI
      ,[jarjestys_iscle2011] = iscle2011selite_FI
      ,[jarjestys_isccat2011] = isccat2011selite_FI
      ,[jarjestys_iscsubcat2011] = iscsubcat2011selite_FI
      ,[jarjestys_iscfi2013] = iscfi2013selite_FI
      ,[jarjestys_iscfinarrow2013] = iscfi2013selite_FI
      ,[jarjestys_iscfibroad2013] = iscfibroad2013selite_FI
      ,[jarjestys_kaste_t2] = ''ööö''


FROM (
SELECT --DISTINCT
	   [koulutuskoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[koulutusselite_FI]
      ,[koulutuslyhytselite_FI]
      ,[koulutusselite_SV]
      ,[koulutuslyhytselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[isclekoodi]
      ,[iscfikkoodi]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[tietolahde]
      ,[korvaavakoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]= ''Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon''
      ,[koulutusala2002selite_SV]= ''Ingen examen efter den grundläggande utbildningen eller examen okänd''
      ,[koulutusala2002selite_EN] = ''No degree after elementary education or degree unknown''
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]= ''Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon''
      ,[opintoala2002selite_SV]= ''Ingen examen efter den grundläggande utbildningen eller examen okänd''
      ,[opintoala2002selite_EN]= ''No degree after elementary education or degree unknown''
      ,[koulutusaste2002koodi]=''91''
      ,[koulutusaste2002selite_FI]= ''Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon''
      ,[koulutusaste2002selite_SV]= ''Ingen examen efter den grundläggande utbildningen eller examen okänd''
      ,[koulutusaste2002selite_EN]= ''No degree after elementary education or degree unknown''
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi] = ''-1''
	  ,[kaste_t2_FI] = ''Tuntematon''
	  ,[kaste_t2_SV] = ''Okänd''
	  ,[kaste_t2_EN] = ''Unknown''
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
  FROM [Vipunen_koodisto].dbo._v_koulutusluokitus_kaikkivuodet
  where [koulutuskoodi]   = ''999999'' 
 ) SA999999

) kaikkirivit









' 
GO
/****** Object:  View [dbo].[v_koulutuksen_jarjestaja]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_koulutuksen_jarjestaja]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_koulutuksen_jarjestaja] AS

SELECT [koulutuksen_jarjestajakoodi] = CAST (koodi AS varchar (10))
      ,[alkaa] = case
	  when alkaa<=tilv+''-01-01'' then tilv+''-01-01''
	  else alkaa
	  end
      ,[paattyy] = NULL
      --case
	  --when paattyy>=tilv+''-12-31'' then tilv+''-12-31''
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
      ,[sijaintikuntaselite] = COALESCE([ykuntaselite],''Tuntematon'')
      ,[sijaintikuntaselite_SV] = COALESCE([ykuntaselite_SV],''Ökand'')
      ,[sijaintikuntaselite_EN] = COALESCE([ykuntaselite_EN],''Unknown'')
	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),''Manuaalinen'') 
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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2000.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2000.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2000.alueluokitus k where k.kunta=ykunta) end   
	--,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2000''
  FROM [Vipunen_koodisto].[koodisto_2000].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2001.alueluokitus k where k.kunta=ykunta) end
	--,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2001''
  FROM [Vipunen_koodisto].[koodisto_2001].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2002.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2002.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2002.alueluokitus k where k.kunta=ykunta) end   
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2003.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2003.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2003.alueluokitus k where k.kunta=ykunta) end  
   --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2004.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2004.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2004.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2005.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2005.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2005.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2006.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2006.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2006.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2007.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2007.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2007.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2008.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2008.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2008.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2009.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2009.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2009.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2010.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2010.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2010.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

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
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[koulutuksen_jarjestaja]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde] = ''TK_6_2_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_14
      where jarj  ! = ''-1'' and
  jarj != ''-2''

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde] = ''TK_6_2_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_15
      where jarj  ! = ''-1'' and
  jarj != ''-2''

UNION ALL

SELECT jarj --[koodi]
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[korvaavakoodi] = ujarj
      ,[ylnimi] --[selite_FI]
      ,[ylnimi]  --[selite_SV]
      ,[ylnimi]  --[selite_EN]
      ,[yolo]
      ,[yomist]
      ,[ykieli]
      ,[ykunta]
      ,[ykuntaselite] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_FI from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_SV] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_SV from koodisto_2011.alueluokitus k where k.kunta=ykunta) end
      ,[ykuntaselite_EN] = case when ykunta in (''322'',''445'',''508'',''710'',''790'',''791'')
	      then (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta)
	      else (select k.selite_EN from koodisto_2011.alueluokitus k where k.kunta=ykunta) end  
      --,[tilv]
      ,[tietolahde] = ''TK_6_2_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_2_sopv_16
      where jarj  ! = ''-1'' and
  jarj != ''-2''
                
) KaikkiVuodet

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013





' 
GO
/****** Object:  View [dbo].[v_oppilaitos_kaikkivuodet_testi]    Script Date: 21.6.2017 15:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppilaitos_kaikkivuodet_testi]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[v_oppilaitos_kaikkivuodet_testi] AS

SELECT 
       [oppilaitoskoodi] = KaikkiVuodet.koodi
      ,[korvaavakoodi] = KaikkiVuodet.korvaavakoodi
      ,[alkaa] = CAST (tilv+''-01-01'' AS datetime2(7))
      ,[paattyy] = CAST(NULL AS datetime2(7))
      ,[tilv] = CAST (tilv AS nvarchar(4))
      ,[oppilaitosselite_FI] = KaikkiVuodet.selite_FI
      ,[oppilaitosselite_SV] = isnull(kk.oppilaitos_SV,KaikkiVuodet.selite_SV)
      ,[oppilaitosselite_EN] = isnull(kk.oppilaitos_EN,KaikkiVuodet.selite_EN)
      ,[sairaalakoulukoodi] = KaikkiVuodet.sair
      ,[sairaalakouluselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Tuntematon'')
      ,[sairaalakouluselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Information saknas'')
      ,[sairaalakouluselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].ei_kylla k WHERE k.ei_kylla=KaikkiVuodet.sair),''Missing data'')
      ,[oppilaitostyyppikoodi] = KaikkiVuodet.oltyp
      ,[oppilaitostyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Tuntematon'')
      ,[oppilaitostyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Information saknas'')
      ,[oppilaitostyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].oltyp k WHERE k.oltyp=KaikkiVuodet.oltyp),''Missing data'')
      ,[peruskoulujen_ryhmityskoodi] = KaikkiVuodet.pkryhma
      ,[peruskoulujen_ryhmitysselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Tuntematon'')
      ,[peruskoulujen_ryhmitysselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Information saknas'')
      ,[peruskoulujen_ryhmitysselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].pkryhma k WHERE k.pkryhma=KaikkiVuodet.pkryhma),''Missing data'')
      ,[peruskoulujen_vuosilkskoodi] = KaikkiVuodet.vuosilks
      ,[peruskoulujen_vuosilksselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Tuntematon'')
      ,[peruskoulujen_vuosilksselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Information saknas'')
      ,[peruskoulujen_vuosilksselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].vuosilks k WHERE k.vuosilks=KaikkiVuodet.vuosilks),''Missing data'')
      ,[omistajatyyppikoodi] = KaikkiVuodet.omist
      ,[omistajatyyppiselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Tuntematon'')
      ,[omistajatyyppiselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Information saknas'')
      ,[omistajatyyppiselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].omist k WHERE k.omist=KaikkiVuodet.omist),''Missing data'')
      ,[opetuskielikoodi] = KaikkiVuodet.okieli
      ,[opetuskieliselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Tuntematon'')
      ,[opetuskieliselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Information saknas'')
      ,[opetuskieliselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].okieli k WHERE k.okieli=KaikkiVuodet.okieli),''Missing data'')
      ,[koulutuksen_jarjestajakoodi] = KaikkiVuodet.jarj
      ,[koulutuksen_jarjestajaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Tuntematon'')
      ,[koulutuksen_jarjestajaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Information saknas'')
      ,[koulutuksen_jarjestajaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].koulutuksen_jarjestaja k WHERE k.koodi=KaikkiVuodet.jarj),''Missing data'')
      ,[sijaintikuntakoodi] = KaikkiVuodet.okun
      ,[sijaintikuntaselite_FI] = ISNULL ((SELECT k.selite_FI FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Tuntematon'') 
      ,[sijaintikuntaselite_SV] = ISNULL ((SELECT k.selite_SV FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Information saknas'')
      ,[sijaintikuntaselite_EN] = ISNULL ((SELECT k.selite_EN FROM [koodisto_2000].alueluokitus k WHERE k.kunta=KaikkiVuodet.okun),''Missing data'')
      ,[koordinaatti_itakoodi] = KaikkiVuodet.oikoord
      ,[koordinaatti_pohjoiskoodi] = KaikkiVuodet.opkoord
      ,[postinumerokoodi] = KaikkiVuodet.psnro
	  ,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),''Manuaalinen'') 
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
      ,[tilv]= ''2000''
  FROM [Vipunen_koodisto].[koodisto_2000].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

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
      ,[tilv]= ''2001''
  FROM [Vipunen_koodisto].[koodisto_2001].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[oppilaitos]   
   where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[oppilaitos]
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[oppilaitos]  
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''


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
      ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[oppilaitos]
  where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  

  
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
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[oppilaitos]
  where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
   
  UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_14
  where tunn  ! = ''-1'' and
  tunn != ''-2''
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_15
  where tunn  ! = ''-1'' and
  tunn != ''-2''
   
 UNION ALL

SELECT tunn --[koodi]
      ,[korvaavakoodi] = utunn
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
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
      ,[tietolahde] = ''TK_6_1_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_1_sopv_16
  where tunn  ! = ''-1'' and
  tunn != ''-2''

  UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2002''
  FROM [Vipunen_koodisto].[koodisto_2002].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2003''
  FROM [Vipunen_koodisto].[koodisto_2003] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2004''
  FROM [Vipunen_koodisto].[koodisto_2004] .[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''

 UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2005''
  FROM [Vipunen_koodisto].[koodisto_2005].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2006''
  FROM [Vipunen_koodisto].[koodisto_2006].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
 SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2007''
  FROM [Vipunen_koodisto].[koodisto_2007].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2008''
  FROM [Vipunen_koodisto].[koodisto_2008].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2009''
  FROM [Vipunen_koodisto].[koodisto_2009].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2010''
  FROM [Vipunen_koodisto].[koodisto_2010].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2011''
  FROM [Vipunen_koodisto].[koodisto_2011].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]
      ,[korvaavakoodi] = '' ''
      ,[alkaa]
      ,[paattyy]
      ,[selite_FI]
      ,[selite_SV]
      ,[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
      ,[tietolahde]
      ,[kommentti]
      ,[tilv]= ''2012''
  FROM [Vipunen_koodisto].[koodisto_2012].[nayttutk_jarj_koulalan_yrit] 
      where [koodi]  ! = ''-1'' and
  [koodi] != ''-2''
  
   UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_14''
      ,[kommentti] = NULL
      ,[tilv] --2013
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_14
      where tunn  ! = ''-1'' and
  tunn != ''-2'' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_15''
      ,[kommentti] = NULL
      ,[tilv] --2015
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_15
      where tunn  ! = ''-1'' and
  tunn != ''-2'' 
  
  UNION ALL
  
  SELECT [koodi]=tunn
      ,[korvaavakoodi] = '' ''
      ,[alkaa] = ''1999-01-01''
      ,[paattyy] = ''9999-01-01''
      ,[onimi] --[selite_FI]
      ,[onimi] --[selite_SV]
      ,[onimi] --[selite_EN]
      ,[sair]= ''-1''
      ,[oltyp]= ''-1''
      ,[pkryhma]= ''-1''
      ,[vuosilks]= ''-1''
      ,[omist]= ''-1''
      ,[okieli]
      ,[jarj]= ''-1''
      ,[okun]
      ,[oikoord]= ''-1''
      ,[opkoord]=''-1''
      ,[psnro]= ''-1''
     ,[tietolahde] = ''TK_6_4_sopv_16''
      ,[kommentti] = NULL
      ,[tilv] --2016
  FROM [TK_H9098_CSC].dbo.TK_6_4_sopv_16
      where tunn  ! = ''-1'' and
  tunn != ''-2''
   
) KaikkiVuodet
left join VipunenTK_lisatiedot.dbo.korkeakoulut kk on kk.oppilaitoskoodi=KaikkiVuodet.koodi

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013







' 
GO

USE [ANTERO]
