USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_VipunenTK_paivitys]    Script Date: 27.8.2023 20:51:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_VipunenTK_paivitys] AS

SELECT DISTINCT 
	aineisto =
		CASE --1.24a-g käsitellään metadatassa ja latauksissa yhtenä
			WHEN Taulu LIKE '%1[_]24[a-z]%' THEN LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 2) + RIGHT(Taulu, LEN(Taulu) - CHARINDEX('_sopv', Taulu) + 1)
			ELSE Taulu
		END
	,afp.aineisto_avain
	,proseduuri
	,k.kuutio_nimi
FROM [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] tk
LEFT JOIN [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] afp on	
	REPLACE(REPLACE(afp.aineisto_avain, 'TK_K', 'TK_'), 'TK_R', 'TK_')
	=
	REPLACE(
		REPLACE(
			CASE 
				WHEN Taulu LIKE '%1[_]24[a-z]%' THEN LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 2) --1.24a-g käsitellään metadatassa ja latauksissa yhtenä
				WHEN Taulu LIKE '%[_]vos[_]%' THEN LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 5) --tpo 7.1X sopv19
				WHEN Taulu LIKE '%5[_]2b%' THEN 'TK_5_2b' --aikasarjan nimessä ei '_sopv'
				WHEN Taulu LIKE '%4[_]1_tilv%' THEN 'TK_4_1' --aikasarjan nimessä ei '_sopv'
				WHEN LEN(LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 1)) > 9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 6))) --nimessä tilv ennen '_sopv'
				ELSE LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 1) 
			END
			, 'TK_K'
			, 'TK_'
		)
		, 'TK_R'
		, 'TK_'
	)
LEFT JOIN VipunenTK_lisatiedot.dbo.Vipunen_aineisto_kuutio ak on ak.aineisto_avain = afp.aineisto_avain
LEFT JOIN VipunenTK_lisatiedot.dbo.Vipunen_kuutio k on k.kuutio_avain = ak.kuutio_avain

WHERE proseduuri is not null
 

GO


