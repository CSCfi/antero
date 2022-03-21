USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 1.9.2021 21:09:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta] AS

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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_11] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_12] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_13] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_14] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_15] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_16] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_17] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_18] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_19] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_20] tk
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
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''), '-1') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''), '-1') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''), '-1') as nvarchar(6))
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
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_21] tk
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+'-01-01' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+'-01-01' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+'-01-01' between kl3.alkaa and kl3.paattyy
where [aineisto] = 'L'

) as kaikkivuodet



GO


