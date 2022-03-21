USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutusluokitus_historia]    Script Date: 4.3.2019 17:08:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_koulutusluokitus_historia] AS 
/*
CSC Jarmo 24.3.2014
CSC Jarmo 28.9.2015 lisätty isced2013-kentät
CSC Anssi 4.3.2019 muutettu ekan selectin tokassa joinissa -2 -> -1

Drop table VipunenTK.dbo.d_koulutusluokitus_historia
Select * into VipunenTK.dbo.d_koulutusluokitus_historia from VipunenTK_DW.[dbo].[v_koulutusluokitus_historia]

Truncate table VipunenTK.dbo.d_koulutusluokitus_historia
Insert into VipunenTK.dbo.d_koulutusluokitus_historia
  Select * from VipunenTK_DW.[dbo].[v_koulutusluokitus_historia]

ennen (10979 row(s) affected)
jälkeen (10979 row(s) affected) OK
*/

SELECT DISTINCT d_koulutusluokitus.[id]
      ,d_koulutusluokitus.[luotu]
      ,[koulutusluokitus_avain]
      ,[koulutus_koodi]
      ,[korvaava_koulutus_koodi]
      ,[alkaa]
      ,[paattyy] = ISNULL([paattyy], Cast('9999-01-01' as date))
      ,[viimeisin_tilv] = ISNULL([viimeisin_tilv], '')
      ,[koulutus]
      ,[koulutus_SV]
      ,[koulutus_EN]
      ,[koulutuslyhyt]
      ,[koulutuslyhyt_SV]
      ,[koulutuslyhyt_EN]
      ,[taso_koodi]
      ,[koulutusala_koodi]
      ,[koulutusala]
      ,[koulutusala_SV]
      ,[koulutusala_EN]
      ,[koulutusaste_koodi]
      ,[koulutusaste]
      ,[koulutusaste_SV]
      ,[koulutusaste_EN]
      ,[koulutusala2002_koodi]
      ,[koulutusala2002]
      ,[koulutusala2002_SV]
      ,[koulutusala2002_EN]
      ,[opintoala2002_koodi]
      ,[opintoala2002]
      ,[opintoala2002_SV]
      ,[opintoala2002_EN]
      ,[koulutusaste2002_koodi]
      ,[koulutusaste2002]
      ,[koulutusaste2002_SV]
      ,[koulutusaste2002_EN]
      ,[koulutusala1995_koodi]
      ,[koulutusala1995]
      ,[koulutusala1995_SV]
      ,[koulutusala1995_EN]
      ,[opintoala1995_koodi]
      ,[opintoala1995]
      ,[opintoala1995_SV]
      ,[opintoala1995_EN]
      ,[koulutusaste1995_koodi]
      ,[koulutusaste1995]
      ,[koulutusaste1995_SV]
      ,[koulutusaste1995_EN]
      ,[isclek_koodi]
      ,[isclek]
      ,[isclek_SV]
      ,[isclek_EN]
      ,[iscle_koodi]
      ,[iscle]
      ,[iscle_SV]
      ,[iscle_EN]
      ,[iscfik_koodi]
      ,[iscfik]
      ,[iscfik_SV]
      ,[iscfik_EN]
      ,[iscde_koodi]
      ,[iscde]
      ,[iscde_SV]
      ,[iscde_EN]
      ,[iscor_koodi]
      ,[iscor]
      ,[iscor_SV]
      ,[iscor_EN]
      ,[iscst_koodi]
      ,[iscst]
      ,[iscst_SV]
      ,[iscst_EN]
      ,[iscdu_koodi]
      ,[iscdu]
      ,[iscdu_SV]
      ,[iscdu_EN]
	  ,[iscle2011_koodi]
	  ,[iscle2011]
	  ,[iscle2011_SV]
	  ,[iscle2011_EN]
	  ,[isccat2011_koodi]
	  ,[isccat2011]
	  ,[isccat2011_SV]
	  ,[isccat2011_EN]
	  ,[iscsubcat2011_koodi]
	  ,[iscsubcat2011]
	  ,[iscsubcat2011_SV]
	  ,[iscsubcat2011_EN]
	  ,d_koulutusluokitus.[iscfi2013_koodi]
	  ,[iscfi2013]
	  ,[iscfi2013_SV]
	  ,[iscfi2013_EN]
	  ,[iscfinarrow2013_koodi]
	  ,[iscfinarrow2013]
	  ,[iscfinarrow2013_SV]
	  ,[iscfinarrow2013_EN]
	  ,[iscfibroad2013_koodi]
	  ,[iscfibroad2013]
	  ,[iscfibroad2013_SV]
	  ,[iscfibroad2013_EN]

	  ,[OKM_ohjauksen_ala_koodi] = isnull(ktpo.[KTPO_ohjauksen_ala_2016_koodi], ktpo_virhe.[KTPO_ohjauksen_ala_2016_koodi])
	  ,[OKM_ohjauksen_ala] = isnull(ktpo.[KTPO_ohjauksen_ala_2016], ktpo_virhe.[KTPO_ohjauksen_ala_2016])
	  ,[OKM_ohjauksen_ala_SV] = isnull(ktpo.[KTPO_ohjauksen_ala_2016_SV], ktpo_virhe.[KTPO_ohjauksen_ala_2016_SV])
	  ,[OKM_ohjauksen_ala_EN] = isnull(ktpo.[KTPO_ohjauksen_ala_2016_EN], ktpo_virhe.[KTPO_ohjauksen_ala_2016_EN])
	  ,[OKM_ohjauksen_ala_yo_tav_koodi] = isnull(ktpo.[Yliopistot_tutkintotavoitteet_koodi], ktpo_virhe.[Yliopistot_tutkintotavoitteet_koodi])
	  ,[OKM_ohjauksen_ala_yo_tav] = isnull(ktpo.[Yliopistot_tutkintotavoitteet], ktpo_virhe.[Yliopistot_tutkintotavoitteet])
	  ,[OKM_ohjauksen_ala_yo_tav_SV] = isnull(ktpo.[Yliopistot_tutkintotavoitteet_SV], ktpo_virhe.[Yliopistot_tutkintotavoitteet_SV])
	  ,[OKM_ohjauksen_ala_yo_tav_EN] = isnull(ktpo.[Yliopistot_tutkintotavoitteet_EN], ktpo_virhe.[Yliopistot_tutkintotavoitteet_EN])
	  ,[OKM_ohjauksen_ala_amk_tav_koodi] = isnull(ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_koodi], ktpo_virhe.[Ammattikorkeakoulut_tutkintotavoitteet_koodi])
	  ,[OKM_ohjauksen_ala_amk_tav] = isnull(ktpo.[Ammattikorkeakoulut_tutkintotavoitteet], ktpo_virhe.[Ammattikorkeakoulut_tutkintotavoitteet])
	  ,[OKM_ohjauksen_ala_amk_tav_SV] = isnull(ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_SV], ktpo_virhe.[Ammattikorkeakoulut_tutkintotavoitteet_SV])
	  ,[OKM_ohjauksen_ala_amk_tav_EN] = isnull(ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_EN], ktpo_virhe.[Ammattikorkeakoulut_tutkintotavoitteet_EN])

	  -- koulutusaste taso 2 tulee nyt Tilastokeskuksesta
	  ,[Koulutusaste_taso2_koodi] --= Cast('-1' as nvarchar(10))
	  ,[Koulutusaste_taso2] --= Cast('Tulossa' as nvarchar(255))
	  ,[Koulutusaste_taso2_SV] --= Cast('På kommande' as nvarchar(255))
	  ,[Koulutusaste_taso2_EN] --= Cast('Coming' as nvarchar(255))

      ,[SCD_alkaa]
      ,[SCD_paattyy]
      ,[olo_koodi]
      ,[lakkautusvuosi]

      ,[muutosvuosi]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_koulutusala]
      ,[jarjestys_koulutusaste]
      ,[jarjestys_koulutusala2002]
      ,[jarjestys_opintoala2002]
      ,[jarjestys_koulutusaste2002]
      ,[jarjestys_koulutusala1995]
      ,[jarjestys_opintoala1995]
      ,[jarjestys_koulutusaste1995]
      ,[jarjestys_isclek]
      ,[jarjestys_iscle]
      ,[jarjestys_iscfik]
      ,[jarjestys_iscde]
      ,[jarjestys_iscor]
      ,[jarjestys_iscst]
      ,[jarjestys_iscdu]
	  ,[jarjestys_iscle2011]
	  ,[jarjestys_isccat2011]
	  ,[jarjestys_iscsubcat2011]
	  ,[jarjestys_iscfi2013]
	  ,[jarjestys_iscfinarrow2013]
	  ,[jarjestys_iscfibroad2013]

	  ,[jarjestys_OKM_ohjauksen_ala] = isnull(ktpo.[jarjestys_KTPO_ohjauksen_ala_2016], ktpo_virhe.[jarjestys_KTPO_ohjauksen_ala_2016])
	  ,[jarjestys_OKM_ohjauksen_ala_yo_tav] = isnull(ktpo.[jarjestys_Yliopistot_tutkintotavoitteet], ktpo_virhe.[jarjestys_Yliopistot_tutkintotavoitteet])
	  ,[jarjestys_OKM_ohjauksen_ala_amk_tav] = isnull(ktpo.[jarjestys_Ammattikorkeakoulut_tutkintotavoitteet], ktpo_virhe.[jarjestys_Ammattikorkeakoulut_tutkintotavoitteet])
	  ,[jarjestys_Koulutusaste_taso2] --= Cast('998' as nvarchar(10))

      ,d_koulutusluokitus.[virhetilanne]
      ,d_koulutusluokitus.[tietolahde]

  FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]

	LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] ktpo
	ON ktpo.[iscfi2013_koodi] = d_koulutusluokitus.iscfi2013_koodi
	LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] ktpo_virhe
	ON ktpo_virhe.[iscfi2013_koodi] = '-1'

UNION ALL

SELECT DISTINCT [VipunenTK_lisatiedot].[dbo].[koulutusluokitus].[id]
      ,[VipunenTK_lisatiedot].[dbo].[koulutusluokitus].[luotu]
      ,[koulutusluokitus_avain]
      ,[koulutus_koodi]
      ,[korvaava_koulutus_koodi]
      ,[alkaa]
      ,[paattyy] = ISNULL([paattyy], Cast('9999-01-01' as date))
      ,[viimeisin_tilv] = ''
      ,[koulutus]
      ,[koulutus_SV]
      ,[koulutus_EN]
      ,[koulutuslyhyt]
      ,[koulutuslyhyt_SV]
      ,[koulutuslyhyt_EN]
      ,[taso_koodi]
      ,[koulutusala_koodi]
      ,[koulutusala]
      ,[koulutusala_SV]
      ,[koulutusala_EN]
      ,[koulutusaste_koodi]
      ,[koulutusaste]
      ,[koulutusaste_SV]
      ,[koulutusaste_EN]
      ,[koulutusala2002_koodi]
      ,[koulutusala2002]
      ,[koulutusala2002_SV]
      ,[koulutusala2002_EN]
      ,[opintoala2002_koodi]
      ,[opintoala2002]
      ,[opintoala2002_SV]
      ,[opintoala2002_EN]
      ,[koulutusaste2002_koodi]
      ,[koulutusaste2002]
      ,[koulutusaste2002_SV]
      ,[koulutusaste2002_EN]
      ,[koulutusala1995_koodi]
      ,[koulutusala1995]
      ,[koulutusala1995_SV]
      ,[koulutusala1995_EN]
      ,[opintoala1995_koodi]
      ,[opintoala1995]
      ,[opintoala1995_SV]
      ,[opintoala1995_EN]
      ,[koulutusaste1995_koodi]
      ,[koulutusaste1995]
      ,[koulutusaste1995_SV]
      ,[koulutusaste1995_EN]
      ,[isclek_koodi]
      ,[isclek]
      ,[isclek_SV]
      ,[isclek_EN]
      ,[iscle_koodi]
      ,[iscle]
      ,[iscle_SV]
      ,[iscle_EN]
      ,[iscfik_koodi]
      ,[iscfik]
      ,[iscfik_SV]
      ,[iscfik_EN]
      ,[iscde_koodi]
      ,[iscde]
      ,[iscde_SV]
      ,[iscde_EN]
      ,[iscor_koodi]
      ,[iscor]
      ,[iscor_SV]
      ,[iscor_EN]
      ,[iscst_koodi]
      ,[iscst]
      ,[iscst_SV]
      ,[iscst_EN]
      ,[iscdu_koodi]
      ,[iscdu]
      ,[iscdu_SV]
      ,[iscdu_EN]
	  ,[iscle2011_koodi]
	  ,[iscle2011]
	  ,[iscle2011_SV]
	  ,[iscle2011_EN]
	  ,[isccat2011_koodi]
	  ,[isccat2011]
	  ,[isccat2011_SV]
	  ,[isccat2011_EN]
	  ,[iscsubcat2011_koodi]
	  ,[iscsubcat2011]
	  ,[iscsubcat2011_SV]
	  ,[iscsubcat2011_EN]
	  ,[VipunenTK_lisatiedot].[dbo].[koulutusluokitus].[iscfi2013_koodi]
	  ,[iscfi2013]
	  ,[iscfi2013_SV]
	  ,[iscfi2013_EN]
	  ,[iscfinarrow2013_koodi]
	  ,[iscfinarrow2013]
	  ,[iscfinarrow2013_SV]
	  ,[iscfinarrow2013_EN]
	  ,[iscfibroad2013_koodi]
	  ,[iscfibroad2013]
	  ,[iscfibroad2013_SV]
	  ,[iscfibroad2013_EN]

	  ,[OKM_ohjauksen_ala_koodi] = ktpo.[KTPO_ohjauksen_ala_2016_koodi]
	  ,[OKM_ohjauksen_ala] = ktpo.[KTPO_ohjauksen_ala_2016]
	  ,[OKM_ohjauksen_ala_SV] = ktpo.[KTPO_ohjauksen_ala_2016_SV]
	  ,[OKM_ohjauksen_ala_EN] = ktpo.[KTPO_ohjauksen_ala_2016_EN]
	  ,[OKM_ohjauksen_ala_yo_tav_koodi] = ktpo.[Yliopistot_tutkintotavoitteet_koodi]
	  ,[OKM_ohjauksen_ala_yo_tav] = ktpo.[Yliopistot_tutkintotavoitteet]
	  ,[OKM_ohjauksen_ala_yo_tav_SV] = ktpo.[Yliopistot_tutkintotavoitteet_SV]
	  ,[OKM_ohjauksen_ala_yo_tav_EN] = ktpo.[Yliopistot_tutkintotavoitteet_EN]
	  ,[OKM_ohjauksen_ala_amk_tav_koodi] = ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_koodi]
	  ,[OKM_ohjauksen_ala_amk_tav] = ktpo.[Ammattikorkeakoulut_tutkintotavoitteet]
	  ,[OKM_ohjauksen_ala_amk_tav_SV] = ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_SV]
	  ,[OKM_ohjauksen_ala_amk_tav_EN] = ktpo.[Ammattikorkeakoulut_tutkintotavoitteet_EN]

	  ,[Koulutusaste_taso2_koodi] --= Cast('-1' as nvarchar(10))
	  ,[Koulutusaste_taso2] --= Cast('Tulossa' as nvarchar(255))
	  ,[Koulutusaste_taso2_SV] --= Cast('På kommande' as nvarchar(255))
	  ,[Koulutusaste_taso2_EN] --= Cast('Coming' as nvarchar(255))

      ,[SCD_alkaa]
      ,[SCD_paattyy]
      ,[olo_koodi]
      ,[lakkautusvuosi]
      ,[muutosvuosi]
      ,[jarjestys]
      ,[jarjestys_taso]
      ,[jarjestys_koulutusala]
      ,[jarjestys_koulutusaste]
      ,[jarjestys_koulutusala2002]
      ,[jarjestys_opintoala2002]
      ,[jarjestys_koulutusaste2002]
      ,[jarjestys_koulutusala1995]
      ,[jarjestys_opintoala1995]
      ,[jarjestys_koulutusaste1995]
      ,[jarjestys_isclek]
      ,[jarjestys_iscle]
      ,[jarjestys_iscfik]
      ,[jarjestys_iscde]
      ,[jarjestys_iscor]
      ,[jarjestys_iscst]
      ,[jarjestys_iscdu]
	  ,[jarjestys_iscle2011]
	  ,[jarjestys_isccat2011]
	  ,[jarjestys_iscsubcat2011]
	  ,[jarjestys_iscfi2013]
	  ,[jarjestys_iscfinarrow2013]
	  ,[jarjestys_iscfibroad2013]

	  ,[jarjestys_OKM_ohjauksen_ala] = ktpo.[jarjestys_KTPO_ohjauksen_ala_2016]
	  ,[jarjestys_OKM_ohjauksen_ala_yo_tav] = ktpo.[jarjestys_Yliopistot_tutkintotavoitteet]
	  ,[jarjestys_OKM_ohjauksen_ala_amk_tav] = ktpo.[jarjestys_Ammattikorkeakoulut_tutkintotavoitteet]
	  ,[jarjestys_Koulutusaste_taso2] = Cast('998' as nvarchar(10))

      ,[VipunenTK_lisatiedot].[dbo].[koulutusluokitus].[virhetilanne]
      ,[VipunenTK_lisatiedot].[dbo].[koulutusluokitus].[tietolahde]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutusluokitus]
	LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] ktpo
	ON ktpo.[iscfi2013_koodi] = '-1'
  WHERE [VipunenTK_lisatiedot].[dbo].[koulutusluokitus].virhetilanne = 'K'




GO

USE [ANTERO]
