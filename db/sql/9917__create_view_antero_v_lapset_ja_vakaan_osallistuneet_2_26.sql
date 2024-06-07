USE [ANTERO]
GO

/****** Object:  View [dw].[v_lapset_ja_vakaan_osallistuneet_2_26]    Script Date: 22.5.2024 16:20:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE OR ALTER VIEW [dw].[v_lapset_ja_vakaan_osallistuneet_2_26] AS

SELECT 

-- Laskentamuuttujat

	 [Tilastovuosi]						= v.tilv
	,[Maakunta]							= d1.maakunta_fi
	,[Ikä]								= d2.ika_fi
	,[Sukupuoli]						= d5.sukupuoli_fi
	,[Syntyperä]						= d6.syntypera
	,[Osallistunut varhaiskasvatukseen] = d3.kytkin_fi
	,[Kuulunut väestöön 31.12.]			= d4.kytkin_fi
	,[Tuloluokka]						= d7.tulokvintiili_fi
	,[Perhe]							= d8.perhe_fi
	,case when v.pekoko = 'P' then 'tieto puuttuu'
		  else v.pekoko
	 end as [Perheen koko]				

-- apumuuttujat
	,[Apusarake Lukumäärä]				= v.lkm 

-- Koodimuuttujat

	,[Koodit Maakunta]					= d1.maakunta_koodi 

-- Järjestysmuuttujat

	,[Järjestys Osallistunut varhaiskasvatukseen]	= d3.jarjestys_kytkin_koodi
	,[Järjestys Kuulunut väestöön 31.12]			= d4.jarjestys_kytkin_koodi
	,[Järjestys Syntyperä]				= d6.jarjestys
	,case when v.perhe = 'P' then 99 else d8.jarjestys_perhe 
	 end as [Järjestys Perhe]			
							

FROM [VipunenTK_SA].[dbo].[v_sa_2_26_0-6v_ja_vakaan_osallistuneet_2021_2022] v
	OUTER APPLY (select top 1 * from dw.d_alueluokitus d1 where d1.maakunta_koodi = v.maakunta) d1
	LEFT JOIN [ANTERO].[dw].[d_ika] d2
	ON d2.id = v.ika
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d3
	ON d3.id = v.vakaos
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d4
	ON d4.id = v.vaesto
	LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d5
	ON d5.id = v.sp
	LEFT JOIN [VipunenTK].[dbo].[d_syntypera] d6
	ON d6.syntypera_koodi = v.syntyp2
	LEFT JOIN [ANTERO].[dw].[d_tulokvintiili] d7
	ON d7.tulokvintiili_koodi = v.tuloluokka
	LEFT JOIN [ANTERO].[dw].[d_perhe] d8
	ON d8.perhe_koodi = v.perhe




GO