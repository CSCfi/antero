USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_pohjakoulutus_TK_K1_12c]    Script Date: 19.10.2023 13:14:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_pohjakoulutus_TK_K1_12c] AS

SELECT 
	[Tilastovuosi] = t.vuosi
	,[Koodit Koulutuksen järjestäjä] = coalesce(d.ytunnus_amos_spl, t.ytunnus)
	,[Koulutuksen järjestäjä] = coalesce(d.nimi_amos_spl, t.koulutuksen_jarjestaja)
	,[Ikä tutkinnon suorittamisvuoden lopussa] = 
		CASE
			WHEN ikar20 = 1 THEN 'Alle 20-vuotias'
			WHEN ikar20 = 2 THEN '20-vuotias'
			WHEN ikar20 = 3 THEN 'Yli 20-vuotias'
			ELSE 'Tieto puuttuu'
		END

	,[ei_pohjakoul_pt_kr1]
	,[ei_pohjakoul_pt_kr2]
	,[ei_pohjakoul_pt_kr3]
	,[ei_pohjakoul_pt_kr4]
	,[ei_pohjakoul_pt_kr5]
	,[ei_pohjakoul_at_eat_kr1]
	,[ei_pohjakoul_at_eat_kr2]
	,[ei_pohjakoul_at_eat_kr3]
	,[ei_pohjakoul_at_eat_kr4]
	,[ei_pohjakoul_at_eat_kr5]
	,[pohjakoul_pt_kr1]
	,[pohjakoul_pt_kr2]
	,[pohjakoul_pt_kr3]
	,[pohjakoul_pt_kr4]
	,[pohjakoul_pt_kr5]
	,[pohjakoul_at_eat_kr1]
	,[pohjakoul_at_eat_kr2]
	,[pohjakoul_at_eat_kr3]
	,[pohjakoul_at_eat_kr4]
	,[pohjakoul_at_eat_kr5]

	,[Järjestys Ikä tutkinnon suorittamisvuoden lopussa] = COALESCE(nullif(ikar20, ''), 9)

FROM sa.sa_amos_tutkinnot_pohjakoulutus_kaikki t
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = t.ytunnus

GO
