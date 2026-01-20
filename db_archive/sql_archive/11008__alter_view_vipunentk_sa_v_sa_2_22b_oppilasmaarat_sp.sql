USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_22b_oppilasmaarat_sp]    Script Date: 11.8.2025 14.32.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








-- Näitä Tytöt/Pojat-luokiteltuja oppilamääriä käytetään 2.22c aineiston tehostetun tuen kaikki oppilaat määriä varten.
-- 10 luokan lisäopetukseen otetaan mukaan vain oppilaitostyypit 11 (peruskoulut) ja 12 (peruskouluasteen erityiskoulut)
-- 15.4.2024 Mika Rissanen/CSC


CREATE OR ALTER   VIEW [dbo].[v_sa_2_22b_oppilasmaarat_sp] AS

WITH data_cte([tilv], [tunn], [sp], [luokka], [esi], [lkm]) AS
(
SELECT [tilv], [tunn], [sp], [luokka], [esi], [lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_22]
WHERE oppilas = '1'

UNION ALL

SELECT [tilv], [tunn], [sp], [luokka], [esi], [lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_23]
WHERE oppilas = '1'

UNION ALL

SELECT [tilv], [tunn], [sp], [luokka], [esi], [lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_24]
WHERE oppilas = '1'

UNION ALL

SELECT [tilv], [tunn], [sp], [luokka], [esi], [lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_25]
WHERE oppilas = '1'
)

-- esiopetuksen oppilaat

SELECT [tilv], 'ove' as aste, [tunn], [sp], SUM([lkm]) as lkm
FROM data_cte
WHERE esi = '2' and luokka = '00'
GROUP BY [tilv], [tunn], [sp]

UNION ALL

-- alasluokkine oppilaat

SELECT [tilv], 'ov16' as aste, [tunn], [sp], SUM([lkm]) as lkm
FROM data_cte
WHERE luokka in ('01', '02', '03', '04', '05', '06')
GROUP BY [tilv], [tunn], [sp]


UNION ALL

-- yläluokkien oppilaat

SELECT [tilv], 'ov79' as aste, [tunn], [sp], SUM([lkm]) as lkm 
FROM data_cte
WHERE luokka in ('07', '08', '09')  
GROUP BY [tilv], [tunn], [sp]

UNION ALL

-- lisäopetuksen oppilaat

SELECT [tilv], 'ovlisa' as aste, [tunn], [sp], SUM([lkm]) as lkm
FROM data_cte b
JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] o
ON b.tunn = o.[oppilaitoskoodi]
WHERE b.luokka = '10' and o.[oppilaitostyyppikoodi] in ('11', '12')
GROUP BY [tilv], [tunn], [sp]


GO


