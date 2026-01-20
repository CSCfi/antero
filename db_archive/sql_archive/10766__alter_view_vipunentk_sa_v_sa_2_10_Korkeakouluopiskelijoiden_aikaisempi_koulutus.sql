USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 8.5.2025 10.51.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









--DROP TABLE [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
--GO

--SELECT * INTO [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
--FROM [VipunenTK_SA].[dbo].[v_sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
--GO

ALTER    VIEW [dbo].[v_sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] AS

/*
HUOM! ophal mukana sopv22 alkaen, ehditään kuitenkin viedä erottelu tod.näk. vasta sopv23 yhteydessä. JS 30.3.2022
*/
SELECT
      [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
      ,[lahde] = CAST(kaikkivuodet.lahde as nvarchar (2))
      ,[tunn]= CAST(kaikkivuodet.tunn as nvarchar (5))
      ,[jarj]= CAST(kaikkivuodet.jarj as nvarchar (10))
      ,[koulk]= CAST(kaikkivuodet.koulk as nvarchar (6))
	  ,[koulk_opintoala1995] = CAST(kaikkivuodet.koulk_opintoala1995 as nvarchar (6))
	  ,[koulk_opintoala2002] = CAST(kaikkivuodet.koulk_opintoala2002 as nvarchar (6))
	  ,[koulk_koulutusala2002] = CAST(kaikkivuodet.koulk_koulutusala2002 as nvarchar (6))
	  ,[koulk_koulutusaste2002] = CAST(kaikkivuodet.koulk_koulutusaste2002 as nvarchar (6))
	  ,[koulk_koulutusala_taso1] = CAST(kaikkivuodet.koulk_koulutusala_taso1 as nvarchar (6))
	  ,[koulk_koulutusala_taso2] = CAST(kaikkivuodet.koulk_koulutusala_taso2 as nvarchar (6))
	  ,[koulk_koulutusala_taso3] = CAST(kaikkivuodet.koulk_koulutusala_taso3 as nvarchar (6))
	  ,[koulk_koulutusaste_taso1] = CAST(kaikkivuodet.koulk_koulutusaste_taso1 as nvarchar (6))
	  ,[koulk_koulutusaste_taso2] = CAST(kaikkivuodet.koulk_koulutusaste_taso2 as nvarchar (6))
      ,[kkun]= CAST(kaikkivuodet.kkun as nvarchar (3))
      ,[sp]= CAST(kaikkivuodet.sp as nvarchar (1))
      ,[aikielir1]= CAST(kaikkivuodet.aikielir1 as nvarchar (2))
      ,[syntv]= CAST(kaikkivuodet.syntv as nvarchar (4))
      ,[tilvaskun]= CAST(kaikkivuodet.tilvaskun as nvarchar (3))
      ,[kansal]= CAST(kaikkivuodet.kansal as nvarchar (1))
      ,[olotamm]= CAST(kaikkivuodet.olotamm as nvarchar (1))
      ,[olosyys]= CAST(kaikkivuodet.olosyys as nvarchar (1))
      ,[rahlahde]= CAST(kaikkivuodet.rahlahde as nvarchar (1))
      ,[fte]= CAST(kaikkivuodet.fte as nvarchar (1))
      ,[op45]= CAST(kaikkivuodet.op45 as nvarchar (1))
	  ,[op55]= CAST(kaikkivuodet.op55 as nvarchar (1))
	  ,[alvv_johdettu] = CAST(
		case 
			when tilv >= 2012 and (kaikkivuodet.koulk_koulutusaste_taso2 in ('63','72') or kaikkivuodet.koulk_koulutusaste2002 in ('63','72'))
			then coalesce(alvv_kk, alvv)
			else alvv
		end as nvarchar (4))
      ,[alvv]= CAST(kaikkivuodet.alvv as nvarchar (4))
      ,[allk]= CAST(kaikkivuodet.allk as nvarchar (4))
      ,[alvv_kksek]= CAST(kaikkivuodet.alvv_kksek as nvarchar (4))
      ,[alvv_kksek_lasna]= CAST(kaikkivuodet.alvv_kksek_lasna as nvarchar (4))
      ,[alvv_sek]= CAST(kaikkivuodet.alvv_sek as nvarchar (4))
      ,[alvv_sek_lasna]= CAST(kaikkivuodet.alvv_sek_lasna as nvarchar (4))
      ,[alvv_kk]= CAST(kaikkivuodet.alvv_kk as nvarchar (4))
      ,[alvv_kk_lasna]= CAST(kaikkivuodet.alvv_kk_lasna as nvarchar (4))
      ,[alvv_opa]= CAST(kaikkivuodet.alvv_opa as nvarchar (4))
      ,[alvv_opa_lasna]= CAST(kaikkivuodet.alvv_opa_lasna as nvarchar (4))
      ,[koulutyp]= CAST(kaikkivuodet.koulutyp as nvarchar (1))
      ,[om]= CAST(kaikkivuodet.om as nvarchar (1))
      ,[avo]= CAST(kaikkivuodet.avo as nvarchar (1))
      ,[aikyotutk]= CAST(kaikkivuodet.aikyotutk as nvarchar (1))
      ,[aikyotutkkoulk]= CAST(kaikkivuodet.aikyotutkkoulk as nvarchar (6))
	  ,[aikyotutkkoulk_opintoala1995] = CAST(kaikkivuodet.aikyotutkkoulk_opintoala1995 as nvarchar (6))
	  ,[aikyotutkkoulk_opintoala2002] = CAST(kaikkivuodet.aikyotutkkoulk_opintoala2002 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusala2002] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikyotutkkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikyotutkkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosiyotutk]= CAST(kaikkivuodet.suvuosiyotutk as nvarchar (4))
      ,[tunnyotutk]= CAST(kaikkivuodet.tunnyotutk as nvarchar (5))
      ,[aikamm]= CAST(kaikkivuodet.aikamm as nvarchar (1))
      ,[aikammkoulk]= CAST(kaikkivuodet.aikammkoulk as nvarchar (6))
	  ,[aikammkoulk_opintoala1995] = CAST(kaikkivuodet.aikammkoulk_opintoala1995 as nvarchar (6))
	  ,[aikammkoulk_opintoala2002] = CAST(kaikkivuodet.aikammkoulk_opintoala2002 as nvarchar (6))
	  ,[aikammkoulk_koulutusala2002] = CAST(kaikkivuodet.aikammkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikammkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikammkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikammkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikammkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikammkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikammkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikammkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikammkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikammkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikammkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikammkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikammkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosiamm]= CAST(kaikkivuodet.suvuosiamm as nvarchar (4))
      ,[tunnamm]= CAST(kaikkivuodet.tunnamm as nvarchar (5))
      ,[aikamk]= CAST(kaikkivuodet.aikamk as nvarchar (1))
      ,[aikamkkoulk]= CAST(kaikkivuodet.aikamkkoulk as nvarchar (6))
	  ,[aikamkkoulk_opintoala1995] = CAST(kaikkivuodet.aikamkkoulk_opintoala1995 as nvarchar (6))
	  ,[aikamkkoulk_opintoala2002] = CAST(kaikkivuodet.aikamkkoulk_opintoala2002 as nvarchar (6))
	  ,[aikamkkoulk_koulutusala2002] = CAST(kaikkivuodet.aikamkkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikamkkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikamkkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikamkkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikamkkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikamkkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikamkkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikamkkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikamkkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikamkkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikamkkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikamkkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikamkkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosiamk]= CAST(kaikkivuodet.suvuosiamk as nvarchar (4))
      ,[tunnamk]= CAST(kaikkivuodet.tunnamk as nvarchar (5))
      ,[aikylamk]= CAST(kaikkivuodet.aikylamk as nvarchar (1))
      ,[aikylamkkoulk]= CAST(kaikkivuodet.aikylamkkoulk as nvarchar (6))
	  ,[aikylamkkoulk_opintoala1995] = CAST(kaikkivuodet.aikylamkkoulk_opintoala1995 as nvarchar (6))
	  ,[aikylamkkoulk_opintoala2002] = CAST(kaikkivuodet.aikylamkkoulk_opintoala2002 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusala2002] = CAST(kaikkivuodet.aikylamkkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikylamkkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikylamkkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikylamkkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikylamkkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikylamkkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikylamkkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikylamkkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosiylamk]= CAST(kaikkivuodet.suvuosiylamk as nvarchar (4))
      ,[tunnylamk]= CAST(kaikkivuodet.tunnylamk as nvarchar (5))
      ,[aikalkk]= CAST(kaikkivuodet.aikalkk as nvarchar (1))
      ,[aikalkkkoulk]= CAST(kaikkivuodet.aikalkkkoulk as nvarchar (6))
	  ,[aikalkkkoulk_opintoala1995] = CAST(kaikkivuodet.aikalkkkoulk_opintoala1995 as nvarchar (6))
	  ,[aikalkkkoulk_opintoala2002] = CAST(kaikkivuodet.aikalkkkoulk_opintoala2002 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusala2002] = CAST(kaikkivuodet.aikalkkkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikalkkkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikalkkkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikalkkkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikalkkkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikalkkkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikalkkkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikalkkkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosialkk]= CAST(kaikkivuodet.suvuosialkk as nvarchar (4))
      ,[tunnalkk]= CAST(kaikkivuodet.tunnalkk as nvarchar (5))
      ,[aikylkk]= CAST(kaikkivuodet.aikylkk as nvarchar (1))
      ,[aikylkkkoulk]= CAST(kaikkivuodet.aikylkkkoulk as nvarchar (6))
	  ,[aikylkkkoulk_opintoala1995] = CAST(kaikkivuodet.aikylkkkoulk_opintoala1995 as nvarchar (6))
	  ,[aikylkkkoulk_opintoala2002] = CAST(kaikkivuodet.aikylkkkoulk_opintoala2002 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusala2002] = CAST(kaikkivuodet.aikylkkkoulk_koulutusala2002 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusaste2002] = CAST(kaikkivuodet.aikylkkkoulk_koulutusaste2002 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusala_taso1] = CAST(kaikkivuodet.aikylkkkoulk_koulutusala_taso1 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusala_taso2] = CAST(kaikkivuodet.aikylkkkoulk_koulutusala_taso2 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusala_taso3] = CAST(kaikkivuodet.aikylkkkoulk_koulutusala_taso3 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusaste_taso1] = CAST(kaikkivuodet.aikylkkkoulk_koulutusaste_taso1 as nvarchar (6))
	  ,[aikylkkkoulk_koulutusaste_taso2] = CAST(kaikkivuodet.aikylkkkoulk_koulutusaste_taso2 as nvarchar (6))
      ,[suvuosiylkk]= CAST(kaikkivuodet.suvuosiylkk as nvarchar (4))
      ,[tunnylkk]= CAST(kaikkivuodet.tunnylkk as nvarchar (5))
      ,[koulked]= CAST(kaikkivuodet.koulked as nvarchar (6))
      ,[opm02opaed]= CAST(kaikkivuodet.opm02opaed as nvarchar (3))
      ,[opm95opaed]= CAST(kaikkivuodet.opm95opaed as nvarchar (2))
      ,[lkm]= CAST(kaikkivuodet.lkm as int)
      ,[tietolahde]= CAST(kaikkivuodet.tietolahde as nvarchar(20))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)

FROM (

SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]= ''
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koulutyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,[opyotutk] as tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,[opamm]as tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,[kkamk] as tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,[kkylamk] as tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,[kkalkk] as tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[kkylkk] as tunnylkk
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_11]	

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_12]	-- vaihda takaisin siirtokantaan, kun TK:lta saadaan korjattu - Lasse 31.10.2016  -- vaihdettu takas 1.2.2017 - Lasse

 UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_14]	

 UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_15]	

 UNION ALL
  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_16]	

 UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_17]
  
  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed]
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_10_sopv_18]
 
  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed]
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_20]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed] = null
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_21]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed] = null
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_22]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      ,[alvv_opa]
      ,[alvv_opa_lasna]
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed] = null
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_23]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      --,[alvv_opa] = null
	  ,[alvv_iscfinarrow2013] as alvv_opa
      --,[alvv_opa_lasna] = null
	  ,[alvv_iscfinarrow2013_lasna] as alvv_opa_lasna
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed] = null
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_24]

  UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
	  ,[koulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
      ,[koulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi    from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] and tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[koulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk] AND tilv+'0101' between alkaa and paattyy)
      ,[kkun]
      ,[sp]
      ,[aikielir1]
      ,(CASE WHEN [syntv] = '19XX' THEN ''
      ELSE [syntv] END) AS syntv
      ,[tilvaskun]
      ,[kansal]
      ,[olotamm]
      ,[olosyys]
      ,[rahlahde]
      ,[fte]
      ,[op45]
	  ,[op55]
      ,[alvv]
      ,[allk]
      ,[alvv_kksek]
      ,[alvv_kksek_lasna]
      ,[alvv_sek]
      ,[alvv_sek_lasna]
      ,[alvv_kk]
      ,[alvv_kk_lasna]
      --,[alvv_opa] = null
	  ,[alvv_iscfinarrow2013] as alvv_opa
      --,[alvv_opa_lasna] = null
	  ,[alvv_iscfinarrow2013_lasna] as alvv_opa_lasna
      ,[koultyp]
      ,[om]
      ,[avo]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
	  ,[aikyotutkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
      ,[aikyotutkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikyotutkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikyotutkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiyotutk] = '19XX' THEN ''
      ELSE [suvuosiyotutk] END) AS suvuosiyotutk
      ,tunnyotutk
      ,[aikamm]
      ,[aikammkoulk]
	  ,[aikammkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikammkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikammkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikammkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamm] = '19XX' THEN ''
      ELSE [suvuosiamm] END) AS suvuosiamm
      ,tunnamm
      ,[aikamk]
      ,[aikamkkoulk]
	  ,[aikamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiamk] = '19XX' THEN ''
      ELSE [suvuosiamk] END) AS suvuosiamk
      ,tunnamk
      ,[aikylamk]
      ,[aikylamkkoulk]
	  ,[aikylamkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylamkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylamkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylamkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylamk] = '19XX' THEN ''
      ELSE [suvuosiylamk] END) AS suvuosiylamk
      ,tunnylamk
      ,[aikalkk]
      ,[aikalkkkoulk]
	  ,[aikalkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikalkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikalkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikalkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosialkk] = '19XX' THEN ''
      ELSE [suvuosialkk] END) AS suvuosialkk
      ,tunnalkk
      ,[aikylkk]
      ,[aikylkkkoulk]
	  ,[aikylkkkoulk_opintoala1995] = (select top 1 opintoala1995_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_opintoala2002] = (select top 1 opintoala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala2002] = (select top 1 koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
      ,[aikylkkkoulk_koulutusaste2002] = (select top 1 koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk]AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso1] = (select top 1 iscfibroad2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso2] = (select top 1 iscfinarrow2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusala_taso3] = (select top 1 iscfi2013_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso1] = (select top 1 iscle2011_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,[aikylkkkoulk_koulutusaste_taso2] = (select top 1 koulutusaste_taso2_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [aikylkkkoulk] AND tilv+'0101' between alkaa and paattyy)
	  ,(CASE WHEN [suvuosiylkk] = '19XX' THEN ''
      ELSE [suvuosiylkk] END) AS suvuosiylkk
      ,[tunnylkk]
      ,[koulked]
      ,[opm02opaed] = null
      ,[opm95opaed] = null
      ,[lkm]
      ,[tietolahde]='TK_2_10_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_10_sopv_25]

) as kaikkivuodet





GO


