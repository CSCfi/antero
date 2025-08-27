USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_21_Vaestoennuste]    Script Date: 20.1.2025 13.56.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_sa_4_21_Vaestoennuste] AS

select
	[ennv] = Vuosi
	,[tilvaskun] = d.kunta_koodi
	,[sp] = 
			case 
				when Sukupuoli='Miehet' then 1 
				when Sukupuoli='Naiset' then 2 
			end
	,[ika2] = 
			case
				when ltrim([Ika]) in ('95','96','97','98','99') then ltrim([Ika])+'v2'
				when ltrim([Ika])='100 -' then '100'
				else ltrim([Ika]) 
			end
	,[lkm]
	,[Ennustemalli]

FROM [VipunenTK_SA].[dbo].[sa_api_vaestoennuste_2024] sa
LEFT JOIN (SELECT DISTINCT kunta_koodi,kunta_fi FROM ANTERO.dw.d_alueluokitus WHERE ely_koodi IS NOT NULL and voimassa = 1) d on d.kunta_fi = 
(CASE 
	WHEN sa.kunta LIKE 'Maarianhamina%' THEN 'Maarianhamina' 
	-- 2025 Kuntaliitos
	WHEN sa.kunta = 'Pertunmaa' THEN 'Mäntyharju'
	ELSE sa.Kunta 
END)

GO


USE [ANTERO]