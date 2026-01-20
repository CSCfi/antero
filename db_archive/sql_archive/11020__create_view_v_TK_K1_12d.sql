USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_12d] AS

--lopulta poiminnat (limittäin) rahoituskausittain, mikä tuolloin huomioitava alla sekä jatkolatausten liitoksissa.

SELECT 
	tilv
    ,jarj
    ,jarjnim
    ,ikar20
	,pohjakoul_kk 
	,pohjakoul_yo 
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
FROM TK_H9098_CSC.dbo.TK_K1_12d_sopv_24_2024

UNION ALL

SELECT 
	tilv
    ,jarj
    ,jarjnim
    ,ikar20
	,pohjakoul_kk 
	,pohjakoul_yo 
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
FROM TK_H9098_CSC.dbo.TK_K1_12d_sopv_24_2023

GO
