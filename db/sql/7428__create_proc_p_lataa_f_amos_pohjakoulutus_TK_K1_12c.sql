USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_pohjakoulutus_TK_K1_12c]    Script Date: 28.2.2023 14:29:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dw].[p_lataa_f_amos_pohjakoulutus_TK_K1_12c] AS

TRUNCATE TABLE dw.f_amos_pohjakoulutus_TK_K1_12c

INSERT dw.f_amos_pohjakoulutus_TK_K1_12c

SELECT [tilv] AS 'Tilastovuosi'
      ,[jarj] AS 'Koodit Koulutuksen järjestäjä'
      ,spl1.nimi_amos_spl AS 'Koulutuksen järjestäjä'
      ,CASE
	      WHEN [ika] = 1 THEN 'Alle 20-vuotias'
		  WHEN [ika] = 2 THEN '20-vuotias'
		  WHEN [ika] = 3 THEN 'Yli 20-vuotias'
		  ELSE 'Tieto puuttuu'
	  END AS 'Ikä tutkinnon suorittamisvuoden lopussa'
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
      ,CASE
	      WHEN [ika] = 1 THEN '1'
		  WHEN [ika] = 2 THEN '2'
		  WHEN [ika] = 3 THEN '3'
		  ELSE '4'
	  END AS 'jarj_ika'
  
  FROM [dw].[v_TK_K1_12c] AS TK
  LEFT JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] AS spl1 ON TK.jarj = spl1.ytunnus_avain








GO


