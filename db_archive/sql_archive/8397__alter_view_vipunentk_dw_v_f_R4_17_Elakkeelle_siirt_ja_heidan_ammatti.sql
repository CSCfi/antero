USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 14.12.2023 13:02:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/

CREATE OR ALTER VIEW [dbo].[v_f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti] AS

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
      ,f.[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1x]
      ,[amm2001_m2x]
	  ,[amm2010_oef1_x]
	  ,[amm2010_oef2_x]
      ,f.[tietolahde]
      ,[rivinumero]
      ,f.[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]
      ,[aineisto]
      ,lkm_yht = [lkm]
      ,lkm_elakkeelle_siirtyneet = Case when lahde = 'E' then [lkm] else NULL end
      ,lkm_kuolleet = Case when lahde = 'K' then [lkm] else NULL end
      
  FROM [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti] f


GO


