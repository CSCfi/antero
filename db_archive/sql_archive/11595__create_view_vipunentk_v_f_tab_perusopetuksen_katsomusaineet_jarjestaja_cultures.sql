USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_perusopetuksen_katsomusaineet_jarjestaja_cultures]    Script Date: 19.1.2026 12.42.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER    VIEW [dbo].[v_f_tab_perusopetuksen_katsomusaineet_jarjestaja_cultures] AS

SELECT 
       tilastovuosi_fi = tilastovuosi 
	  ,koulutuksen_jarjestaja_fi = d1.koulutuksen_jarjestajaselite
	  ,koulutuksen_jarjestajan_kieli_fi = d1.[koulutuksen_jarjestajan_kieliselite]
	  ,koulutuksen_jarjestajan_omistajatyyppi_fi = d1.omistajatyyppiselite
	  ,koulutuksen_jarjestajan_maakunta_fi = case when d2.maakunta = 'Tuntematon' then 'Ulkomaat' else d2.maakunta end
	  ,vuosiluokkaryhma_tai_koulutus_fi = case when d3.luokkajako_16_79 = 'Luokat 1-6' then 'Vuosiluokat 1-6'
	                         when d3.luokkajako_16_79 = 'Luokat 7-9' then 'Vuosiluokat 7-9'
							 when d3.luokkajako_16_79 = 'Aikuiset' then 'Aikuisten perusopetus'
							 else d3.luokkajako_16_79 end
      ,katsomusaine_fi = d4.katsomusaine 

	  -- ruotsi

	  ,tilastovuosi_sv = tilastovuosi
	  ,koulutuksen_jarjestaja_sv = d1.koulutuksen_jarjestajaselite_SV
	  ,koulutuksen_jarjestajan_kieli_sv = d1.[koulutuksen_jarjestajan_kieliselite_SV]
	  ,koulutuksen_jarjestajan_omistajatyyppi_sv = d1.omistajatyyppiselite_SV
      ,koulutuksen_jarjestajan_maakunta_sv = d2.maakunta_sv 
	  ,vuosiluokkaryhma_tai_koulutus_sv = d3.luokkajako_16_79_sv 
      ,katsomusaine_sv = d4.katsomusaine_sv

	  -- englanti

	  ,tilastovuosi_en = tilastovuosi 
	  ,koulutuksen_jarjestaja_en = d1.koulutuksen_jarjestajaselite_EN
	  ,koulutuksen_jarjestajan_kieli_en = d1.[koulutuksen_jarjestajan_kieliselite_EN]
	  ,koulutuksen_jarjestajan_omistajatyyppi_en = d1.omistajatyyppiselite_EN
      ,koulutuksen_jarjestajan_maakunta_en = d2.maakunta_EN
	  ,vuosiluokkaryhma_tai_koulutus_en = d3.luokkajako_16_79_EN 
      ,katsomusaine_en = d4.katsomusaine_EN

	  ,[jarjestys_koulutuksen_jarjestaja] = d1.jarjestys
	  ,[jarjestys_koulutuksen_jarjestajan_kieli] = d1.jarjestys_koulutuksen_jarjestajan_kieli
	  ,[jarjestys_koulutuksen_jarjestajan_omistajatyyppi] = d1.jarjestys_omistajatyyppi
	  ,[jarjestys_koulutuksen_jarjestajan_maakunta] = d2.jarjestys_maakunta
	  ,[jarjestys_vuosiluokkaryhma_tai_koulutus] = d3.jarjestys
	  ,[jarjestys_katsomusaine] = d4.jarjestys

	  ,[koodit_koulutuksen_jarjestaja] = f.[jarjestaja]
      ,[koodit_koulutuksen_jarjestajan_maakunta] = f.[koulutuksen_sijaintimaakunta]
      ,[koodit_vuosiluokkaryhma_tai_koulutus] = f.vuosiluokat
	  ,[koodit_katsomusaine] = f.katsomusaine

	  ,[lkm] = f.lkm
FROM [VipunenTK].[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja] f
LEFT JOIN VipunenTK..d_jarjestaja d1 ON d1.id = f.jarjestaja_id
LEFT JOIN VipunenTK..v_d_maakunta d2 ON d2.id = f.koulutuksen_sijaintimaakunta_id
LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d3 ON d3.id = f.vuosiluokat_id
LEFT JOIN VipunenTK..d_katsomusaine AS d4 ON d4.id = f.katsomusaine_id
WHERE f.katsomusaine != 'ky'

GO


