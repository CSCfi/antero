USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 14.12.2023 13:34:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] AS

/*** surrogaatit ***

TK-kanta ladataan näkymästä v_f_elakkeelle_siirtyneet_ja_kuolleet

***/


SELECT [tilv]
      ,[tilv_date]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,f.[ika]
      ,[elaji]
      ,[elk_koodi]      
      ,f.[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]
	  ,[amm2010_oef1_2x]
	  ,[amm2010_oef2_2x]
      ,f.[tietolahde]
      ,[rivinumero]      
      ,f.[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]
      ,[aineisto]
      ,lkm_yht = [lkm]
	  ,lkm_elakkeelle_siirtyneet = Case when lahde = 'E' then [lkm] else NULL end
      ,lkm_kuolleet = Case when lahde = 'K' then [lkm] else NULL end      
  FROM [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] f




GO


