USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_TK_K1_12d] AS

--kopioi ja lisää uusi vuosi ylle 

SELECT 
	rahoituskausi
	,tutkinnon_suorituskausi
    ,jarj
	,[ei_pohjakoul_pt_kr1]
	,[ei_pohjakoul_pt_kr2]
	,[ei_pohjakoul_pt_kr3]
	,[ei_pohjakoul_pt_kr4]
	,[ei_pohjakoul_pt_kr5]
	,[ei_pohjakoul_pt_kr6]
	,[ei_pohjakoul_pt_kr7]
	,[ei_pohjakoul_at_eat_kr1]
	,[ei_pohjakoul_at_eat_kr2]
	,[ei_pohjakoul_at_eat_kr3]
	,[ei_pohjakoul_at_eat_kr4]
	,[ei_pohjakoul_at_eat_kr5]
	,[ei_pohjakoul_at_eat_kr6]
	,[ei_pohjakoul_at_eat_kr7]
	,[pohjakoul_pt_kr1]
	,[pohjakoul_pt_kr2]
	,[pohjakoul_pt_kr3]
	,[pohjakoul_pt_kr4]
	,[pohjakoul_pt_kr5]
	,[pohjakoul_pt_kr6]
	,[pohjakoul_pt_kr7]
	,[pohjakoul_at_eat_kr1]
	,[pohjakoul_at_eat_kr2]
	,[pohjakoul_at_eat_kr3]
	,[pohjakoul_at_eat_kr4]
	,[pohjakoul_at_eat_kr5]
	,[pohjakoul_at_eat_kr6]
	,[pohjakoul_at_eat_kr7]
FROM TK_H9098_CSC.dbo.TK_K1_12d_sopv_25

--UNION ALL

GO
