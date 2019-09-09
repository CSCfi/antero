USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutusluokitus_nykytila]    Script Date: 4.9.2019 7:35:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_koulutusluokitus_nykytila] AS
/*
-- HUOM [VipunenTK].[dbo].[d_koulutusluokitus_historia] pitää olla olemassa
Drop table VipunenTK.dbo.d_koulutusluokitus_nykytila
Select * into VipunenTK.dbo.d_koulutusluokitus_nykytila from VipunenTK_DW.dbo.v_koulutusluokitus_nykytila
Truncate table VipunenTK.dbo.d_koulutusluokitus_nykytila
Insert into VipunenTK.dbo.d_koulutusluokitus_nykytila
  Select * from VipunenTK_DW.dbo.v_koulutusluokitus_nykytila
*/

SELECT [id]
      ,[koulutusluokitus_avain]
      ,[koulutus_koodi]
      --,[viimeisin_tilv]
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
	  ,[iscfi2013_koodi]
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
	  ,[OKM_ohjauksen_ala_koodi]
	  ,[OKM_ohjauksen_ala]
	  ,[OKM_ohjauksen_ala_SV]
	  ,[OKM_ohjauksen_ala_EN]
	  ,[OKM_ohjauksen_ala_yo_tav_koodi]
	  ,[OKM_ohjauksen_ala_yo_tav]
	  ,[OKM_ohjauksen_ala_yo_tav_SV]
	  ,[OKM_ohjauksen_ala_yo_tav_EN]
	  ,[OKM_ohjauksen_ala_amk_tav_koodi]
	  ,[OKM_ohjauksen_ala_amk_tav]
	  ,[OKM_ohjauksen_ala_amk_tav_SV]
	  ,[OKM_ohjauksen_ala_amk_tav_EN]
	  ,[Koulutusaste_taso2_koodi]
	  ,[Koulutusaste_taso2]
	  ,[Koulutusaste_taso2_SV]
	  ,[Koulutusaste_taso2_EN]
      ,[SCD_alkaa]
      ,[SCD_paattyy]
      ,[olo_koodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutus_koodi]
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
	  ,[jarjestys_OKM_ohjauksen_ala]
	  ,[jarjestys_OKM_ohjauksen_ala_yo_tav]
	  ,[jarjestys_OKM_ohjauksen_ala_amk_tav]
	  ,[jarjestys_Koulutusaste_taso2]
      --,[virhetilanne]
      ,[tietolahde]
	  ,[jarjestys_OKM_ohjauksen_ala_yo_tav2021]
      ,[OKM_ohjauksen_ala_yo_tav2021_koodi]
      ,[OKM_ohjauksen_ala_yo_tav2021]
      ,[OKM_ohjauksen_ala_yo_tav2021_SV]
      ,[OKM_ohjauksen_ala_yo_tav2021_EN]
  FROM [VipunenTK_DW].[dbo].[v_koulutusluokitus_nykytila_koodiaeikorvattu]

-- Tehdään koodien korvaus, kun korvaavassa koodissa on jotain dataa
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi
	--on ol.oppilaitoksen_korvaavakoodi = ol_uusi.oppilaitoskoodi
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi_2
	--on ol_uusi.oppilaitoksen_korvaavakoodi = ol_uusi_2.oppilaitoskoodi
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi_3
	--on ol_uusi_2.oppilaitoksen_korvaavakoodi = ol_uusi_3.oppilaitoskoodi
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi_4
	--on ol_uusi_3.oppilaitoksen_korvaavakoodi = ol_uusi_4.oppilaitoskoodi
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi_5
	--on ol_uusi_4.oppilaitoksen_korvaavakoodi = ol_uusi_5.oppilaitoskoodi
 -- left join [VipunenTK_DW].[dbo].[v_oppilaitoksen_taustatiedot_nykytila_koodiaeikorvattu] ol_uusi_6
	--on ol_uusi_5.oppilaitoksen_korvaavakoodi = ol_uusi_6.oppilaitoskoodi






GO


USE [ANTERO]