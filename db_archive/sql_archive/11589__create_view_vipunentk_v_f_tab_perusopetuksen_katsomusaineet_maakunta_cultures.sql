USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_perusopetuksen_katsomusaineet_maakunta_cultures]    Script Date: 19.1.2026 12.40.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE OR ALTER  VIEW [dbo].[v_f_tab_perusopetuksen_katsomusaineet_maakunta_cultures] AS
SELECT 
       tilastovuosi as tilastovuosi_fi
      --,d1.maakunta as koulutuksen_maakunta_fi
	  ,koulutuksen_maakunta_fi = case when d1.maakunta = 'Tuntematon' then 'Ulkomaat' else d1.maakunta end
      --,d2.luokkajako_16_79 as vuosiluokat_fi
--	  ,vuosiluokat_fi = case when d2.luokkajako_16_79 = 'Luokat 1-6' then 'Vuosiluokat 1-6'
--	                         when d2.luokkajako_16_79 = 'Luokat 7-9' then 'Vuosiluokat 7-9'
--							 when d2.luokkajako_16_79 = 'Aikuiset' then 'Aikuisten perusopetus'
--							 else d2.luokkajako_16_79 end
	  ,vuosiluokkaryhma_tai_koulutus_fi = case when d2.luokkajako_16_79 = 'Luokat 1-6' then 'Vuosiluokat 1-6'
	                         when d2.luokkajako_16_79 = 'Luokat 7-9' then 'Vuosiluokat 7-9'
							 when d2.luokkajako_16_79 = 'Aikuiset' then 'Aikuisten perusopetus'
							 else d2.luokkajako_16_79 end
      ,d3.katsomusaine as katsomusaine_fi

	  -- ruotsi

	  ,tilastovuosi as tilastovuosi_sv
      ,d1.maakunta_SV as koulutuksen_maakunta_sv
--      ,d2.luokkajako_16_79_SV as vuosiluokat_sv
	  ,d2.luokkajako_16_79_SV as vuosiluokkaryhma_tai_koulutus_sv
      ,d3.katsomusaine_SV as katsomusaine_sv

	  -- englanti

	  ,tilastovuosi as tilastovuosi_en
      ,d1.maakunta_EN as koulutuksen_maakunta_en
 --     ,d2.luokkajako_16_79_EN as vuosiluokat_en
	  ,d2.luokkajako_16_79_EN as vuosiluokkaryhma_tai_koulutus_en
      ,d3.katsomusaine_EN as katsomusaine_en

	  ,[jarjestys_koulutuksen_maakunta] = d1.jarjestys_maakunta
	  ,[jarjestys_vuosiluokat] = d2.luokkajako_16_79_jarjestys
	  ,[jarjestys_katsumusaine] = d3.jarjestys

      ,[lkm] = f.lkm
FROM [VipunenTK].[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta] f
LEFT JOIN VipunenTK..v_d_maakunta d1 ON d1.id = f.koulutuksen_sijaintimaakunta_id
LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d2 ON d2.id = f.vuosiluokat_id
LEFT JOIN VipunenTK..d_katsomusaine AS d3 ON d3.id = f.katsomusaine_id
WHERE f.katsomusaine != 'ky'

GO


