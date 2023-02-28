USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_pohjakoulutus_TK_K1_12c]    Script Date: 28.2.2023 14:33:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dw].[v_amos_pohjakoulutus_TK_K1_12c] 
AS
SELECT
-- AIKAMUUTTUJAT
	   [Tilastovuosi]
	  ,[luontipvm] AS [Luontipvm]
-- KOULUTUSMUUTTUJAT
      ,[Koulutuksen järjestäjä]
-- HENKILÖMUUTTUJAT
      ,[Ikä tutkinnon suorittamisvuoden lopussa]
-- KOODIMUUTTUJAT
	  ,[Koodit Koulutuksen järjestäjä]
-- APUMUUTTUJAT
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
-- JÄRJESTYSMUUTTUJAT
	  ,jarj_ika as 'Järjestys Ikä tutkinnon suorittamisvuoden lopussa'
  FROM [ANTERO].[dw].[f_amos_pohjakoulutus_TK_K1_12c] AS f





GO


