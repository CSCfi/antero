USE [ANTERO]
GO

/****** Object:  View [dw].[v_TK_K1_12c]    Script Date: 28.2.2023 14:31:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dw].[v_TK_K1_12c] AS 

	SELECT [tilv]
		,[jarj]
		,[jarjnim]
		,ika = [ikar20]
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
		,[luontipvm]
  FROM [TK_H9098_CSC].[dbo].[TK_K1_12c_sopv_22]

  UNION ALL

	SELECT [tilv]
		,[jarj]
		,[jarjnim]
		,ika = [ika21]
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
		,[luontipvm]
  FROM [TK_H9098_CSC].[dbo].[TK_K1_12c_sopv_21]

  UNION ALL

	SELECT [tilv]
		,[jarj]
		,[jarjnim]
		,ika = NULL
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
		,[luontipvm]
  FROM [TK_H9098_CSC].[dbo].[TK_K1_12c_sopv_20]

  UNION ALL

	SELECT [tilv]
		,[jarj]
		,[jarjnim]
		,ika = NULL
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
		,[luontipvm]
  FROM [TK_H9098_CSC].[dbo].[TK_K1_12c_sopv_19]



GO


