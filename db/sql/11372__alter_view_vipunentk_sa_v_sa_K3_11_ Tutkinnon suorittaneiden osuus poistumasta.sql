USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 10.11.2025 15.13.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








--parsittu muoto tiedoston nimeksi:
--v_sa_K3_11_Tutkinnon_suorittaneiden_osuus_poistumasta

ALTER VIEW [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta] AS

/*
CSC Juha 24.11.2021:
Lisätty 2016 koulutusluokituksen mukaiset muuttujat.
Lisätty myös liitokset nykytiladimensioon, luetaan yhä ensijaisesti tilastovuoden tieto tai ohjataan tiedot nulliksi jos ao. koulutuskoodi puuttuu.
*/ 

SELECT
      [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'-01-01' as date)
      ,[aineisto]= cast(kaikkivuodet.aineisto as nvarchar(1))
      ,[lahde]= cast(kaikkivuodet.lahde as nvarchar(2))
      ,[sp]= cast(kaikkivuodet.sp as nvarchar(1))
      ,[aikielir1]= cast(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[syntv]= cast(kaikkivuodet.syntv as nvarchar(4))
      ,[tilvaskun]= cast(kaikkivuodet.tilvaskun as nvarchar(3))
      ,[kansalr1]= cast(kaikkivuodet.kansalr1 as nvarchar(1))
      ,[eumaa]= cast(kaikkivuodet.eumaa as nvarchar(1))
      ,[etamaa]= cast(kaikkivuodet.etamaa as nvarchar(1))
      ,[pohjmaa]= cast(kaikkivuodet.pohjmaa as nvarchar(1))
      ,[alvv]= cast(kaikkivuodet.alvv as nvarchar(4))
      ,[allk]= cast(kaikkivuodet.allk as nvarchar(1))
      ,[ololk]= cast(kaikkivuodet.ololk as nvarchar(1))
      ,[jarj]= cast(kaikkivuodet.jarj as nvarchar(10))
      ,[tunn]= cast(kaikkivuodet.tunn as nvarchar(5))
      ,[koulk]= cast(kaikkivuodet.koulk as nvarchar(6))
	  ,[koulk_kala_t1] = cast(kaikkivuodet.[koulk_kala_t1] as nvarchar(6)) 
	  ,[koulk_kala_t2] = cast(kaikkivuodet.[koulk_kala_t2] as nvarchar(6)) 
	  ,[koulk_kala_t3] = cast(kaikkivuodet.[koulk_kala_t3] as nvarchar(6)) 
	  ,[koulk_kaste_t1] = cast(kaikkivuodet.[koulk_kaste_t1] as nvarchar(6)) 
	  ,[koulk_kaste_t2] = cast(kaikkivuodet.[koulk_kaste_t2] as nvarchar(6)) 
	  ,[tutk_kala_t1] = cast(kaikkivuodet.[tutk_kala_t1] as nvarchar(6)) 
	  ,[tutk_kala_t2] = cast(kaikkivuodet.[tutk_kala_t2] as nvarchar(6)) 
	  ,[tutk_kala_t3] = cast(kaikkivuodet.[tutk_kala_t3] as nvarchar(6)) 
	  ,[tutk_kaste_t1] = cast(kaikkivuodet.[tutk_kaste_t1] as nvarchar(6)) 
	  ,[tutk_kaste_t2] = cast(kaikkivuodet.[tutk_kaste_t2] as nvarchar(6)) 
	  ,[seurv_kala_t1] = cast(kaikkivuodet.[seurv_kala_t1] as nvarchar(6)) 
	  ,[seurv_kala_t2] = cast(kaikkivuodet.[seurv_kala_t2] as nvarchar(6)) 
	  ,[seurv_kala_t3] = cast(kaikkivuodet.[seurv_kala_t3] as nvarchar(6)) 
	  ,[seurv_kaste_t1] = cast(kaikkivuodet.[seurv_kaste_t1] as nvarchar(6)) 
	  ,[seurv_kaste_t2] = cast(kaikkivuodet.[seurv_kaste_t2] as nvarchar(6)) 
	  ,[koulk_opintoala] = CAST(kaikkivuodet.koulk_opintoala as nvarchar (6))
	  ,[koulk_koulutusala] = CAST(kaikkivuodet.koulk_koulutusala as nvarchar (6))
	  ,[koulk_koulutusaste] = CAST(kaikkivuodet.koulk_koulutusaste as nvarchar (6))
      ,[kkielir1]= cast(kaikkivuodet.kkielir1 as nvarchar(2))
      ,[kkun]= cast(kaikkivuodet.kkun as nvarchar(3))
	  ,[kkun_kmaak]= cast(kaikkivuodet.kkun_kmaak as nvarchar(2))
	  ,[ophal]= cast(kaikkivuodet.ophal as nvarchar(1))
      ,[koultyp]= cast(kaikkivuodet.koultyp	 as nvarchar(1))
      ,[tutkmaak]= cast(kaikkivuodet.tutkmaak as nvarchar(2))
      ,[tutkjarj]= cast(kaikkivuodet.tutkjarj as nvarchar(10))
      ,[tutktunn]= cast(kaikkivuodet.tutktunn as nvarchar(5))
      ,[tutkkoulk]= cast(kaikkivuodet.tutkkoulk as nvarchar(6))
	  ,[tutk_opintoala] = CAST(kaikkivuodet.tutk_opintoala as nvarchar (6))
	  ,[tutk_koulutusala] = CAST(kaikkivuodet.tutk_koulutusala as nvarchar (6))
	  ,[tutk_koulutusaste] = CAST(kaikkivuodet.tutk_koulutusaste as nvarchar (6))
      ,[tutkkoultyp]= cast(kaikkivuodet.tutkkoultyp as nvarchar(1))
      ,[seurvkmaak]= cast(kaikkivuodet.seurvkmaak as nvarchar(2))
      ,[seurvjarj]= cast(kaikkivuodet.seurvjarj as nvarchar(10))
      ,[seurvtunn]= cast(kaikkivuodet.seurvtunn as nvarchar(5))
      ,[seurvkoulk]= cast(kaikkivuodet.seurvkoulk as nvarchar(6))
	  ,[seurv_opintoala] = CAST(kaikkivuodet.seurv_opintoala as nvarchar (6))
	  ,[seurv_koulutusala] = CAST(kaikkivuodet.seurv_koulutusala as nvarchar (6))
	  ,[seurv_koulutusaste] = CAST(kaikkivuodet.seurv_koulutusaste as nvarchar (6))
      ,[seurvkoulutyp]= cast(kaikkivuodet.seurvkoulutyp as nvarchar(1))
      ,[ptoim1r2]= cast(kaikkivuodet.ptoim1r2 as nvarchar(2))
      ,[amas1]= cast(kaikkivuodet.amas1 as nvarchar(1))
      ,[lkm]= CAST(kaikkivuodet.lkm as int)
 FROM (
SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_11] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
  UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_12] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
 UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_13] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
 UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_14] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_15] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_16] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
  where [aineisto] = 'L'
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_17] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_18] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_19] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_20] tk
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak] = (select distinct maakunta_koodi from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_21] tk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak] = (select distinct maakunta_koodi from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_22] tk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp] 
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak] = (select distinct maakunta_koodi from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_23] tk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp] 
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak] = (select distinct maakunta_koodi from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_24] tk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp] 
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk] 
	  ,[koulk_kala_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscfibroad2013_koodi, '-1'), kl1b.iscfibroad2013_koodi, '-1') end
	  ,[koulk_kala_t2] = case when koulk <> '' then coalesce(nullif(kl1.iscfinarrow2013_koodi, '-1'), kl1b.iscfinarrow2013_koodi, '-1') end
	  ,[koulk_kala_t3] = case when koulk <> '' then coalesce(nullif(kl1.iscfi2013_koodi, '-1'), kl1b.iscfi2013_koodi, '-1') end
	  ,[koulk_kaste_t1] = case when koulk <> '' then coalesce(nullif(kl1.iscle2011_koodi, '-1'), kl1b.iscle2011_koodi, '-1') end
	  ,[koulk_kaste_t2] = case when koulk <> '' then coalesce(nullif(kl1.Koulutusaste_taso2_koodi, '-1'), kl1b.Koulutusaste_taso2_koodi, '-1') end
	  ,[tutk_kala_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfibroad2013_koodi, '-1'), kl2b.iscfibroad2013_koodi, '-1') end
	  ,[tutk_kala_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfinarrow2013_koodi, '-1'), kl2b.iscfinarrow2013_koodi, '-1') end
	  ,[tutk_kala_t3] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscfi2013_koodi, '-1'), kl2b.iscfi2013_koodi, '-1') end
	  ,[tutk_kaste_t1] = case when tutkkoulk <> '' then coalesce(nullif(kl2.iscle2011_koodi, '-1'), kl2b.iscle2011_koodi, '-1') end
	  ,[tutk_kaste_t2] = case when tutkkoulk <> '' then coalesce(nullif(kl2.Koulutusaste_taso2_koodi, '-1'), kl2b.Koulutusaste_taso2_koodi, '-1') end
	  ,[seurv_kala_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfibroad2013_koodi, '-1'), kl3b.iscfibroad2013_koodi, '-1') end
	  ,[seurv_kala_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfinarrow2013_koodi, '-1'), kl3b.iscfinarrow2013_koodi, '-1') end
	  ,[seurv_kala_t3] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscfi2013_koodi, '-1'), kl3b.iscfi2013_koodi, '-1') end
	  ,[seurv_kaste_t1] = case when seurvkoulk <> '' then coalesce(nullif(kl3.iscle2011_koodi, '-1'), kl3b.iscle2011_koodi, '-1') end
	  ,[seurv_kaste_t2] = case when seurvkoulk <> '' then coalesce(nullif(kl3.Koulutusaste_taso2_koodi, '-1'), kl3b.Koulutusaste_taso2_koodi, '-1') end
	  ,[koulk_opintoala] = case when koulk <> '' then coalesce(nullif(kl1.opintoala2002_koodi, '-1'), kl1b.opintoala2002_koodi, '-1') end
	  ,[koulk_koulutusala] = case when koulk <> '' then coalesce(nullif(kl1.koulutusala2002_koodi , '-1'), kl1b.koulutusala2002_koodi , '-1') end
	  ,[koulk_koulutusaste] = case when koulk <> '' then coalesce(nullif(kl1.koulutusaste2002_koodi , '-1'), kl1b.koulutusaste2002_koodi , '-1') end
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak] = (select distinct maakunta_koodi from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+'-01-01' between (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.opintoala2002_koodi, '-1'), kl2b.opintoala2002_koodi, '-1') end
      ,[tutk_koulutusala] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusala2002_koodi, '-1'), kl2b.koulutusala2002_koodi, '-1') end
      ,[tutk_koulutusaste] = case when tutkkoulk <> '' then coalesce(nullif(kl2.koulutusaste2002_koodi, '-1'), kl2b.koulutusaste2002_koodi, '-1') end
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.opintoala2002_koodi, '-1'), kl3b.opintoala2002_koodi, '-1') end
      ,[seurv_koulutusala] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusala2002_koodi, '-1'), kl3b.koulutusala2002_koodi, '-1') end
      ,[seurv_koulutusaste] = case when seurvkoulk <> '' then coalesce(nullif(kl3.koulutusaste2002_koodi, '-1'), kl3b.koulutusaste2002_koodi, '-1') end
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_25] tk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl1b on kl1b.koulutusluokitus_avain = tk.koulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl2b on kl2b.koulutusluokitus_avain = tk.tutkkoulk 
left join [VipunenTK].[dbo].[d_koulutusluokitus] kl3b on kl3b.koulutusluokitus_avain = tk.seurvkoulk 
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

) as kaikkivuodet





GO


