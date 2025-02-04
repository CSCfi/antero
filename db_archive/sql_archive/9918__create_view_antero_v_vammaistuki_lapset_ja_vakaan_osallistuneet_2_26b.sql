USE [ANTERO]
GO

/****** Object:  View [dw].[v_vammaistuki_lapset_ja_vakaan_osallistuneet_2_26b]    Script Date: 7.6.2024 15:11:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













CREATE OR ALTER   VIEW [dw].[v_vammaistuki_lapset_ja_vakaan_osallistuneet_2_26b] AS

SELECT

-- Laskentamuuttujat

	 [Tilastovuosi]						= v.tilv
	,[Maakunta]							= d1.maakunta_fi
	,case when v.ikar_l = 1 then '1-2-vuotiaat'
		  when v.ikar_l = 2 then '3-5-vuotiaat'
		  when v.ikar_l = 3 then '6-vuotiaat'
	 end as [Ikäryhmä]
	,[Osallistunut varhaiskasvatukseen] = d3.kytkin_fi
	,[Perustuki]						= d4.kytkin_fi
	,[Ylin tuki]						= d5.kytkin_fi

-- apumuuttujat
	,[Apusarake Lukumäärä]						= v.lkm 

-- Koodimuuttujat

	,[Koodit Maakunta]					= d1.maakunta_koodi 

-- Järjestysmuuttujat

	,[Järjestys Osallistunut varhaiskasvatukseen]	= d3.jarjestys_kytkin_koodi
	,[Järjestys Perustuki]							= d4.jarjestys_kytkin_koodi
	,[Järjestys Ylin tuki]							= d5.jarjestys_kytkin_koodi				



FROM [VipunenTK_SA].[dbo].[v_sa_2_26b_Vammaistuki_1-6v_ja_vakaan_osallistuneet_2021_2022] v
	OUTER APPLY (select top 1 * from dw.d_alueluokitus d1 where d1.maakunta_koodi = v.maakunta) d1
	LEFT JOIN [VipunenTK].[dbo].[d_ika] d2
	ON d2.id = v.ikar_l
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d3
	ON d3.id = v.vakaos
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d4
	ON d4.id = v.vtukia16perus
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d5
	ON d5.id = v.vtukia16ylin
GO


