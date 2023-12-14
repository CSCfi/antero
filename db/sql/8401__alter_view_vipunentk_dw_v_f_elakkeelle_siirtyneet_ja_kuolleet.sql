USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_elakkeelle_siirtyneet_ja_kuolleet]    Script Date: 14.12.2023 13:35:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [dbo].[v_f_elakkeelle_siirtyneet_ja_kuolleet] AS

/*** 

delete from VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
Insert into VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
select * from [dbo].[v_f_elakkeelle_siirtyneet_ja_kuolleet]

***/

SELECT [tilv]
      ,[tilv_date]
      ,[sukupuoli_id]=ISNULL(d7.id,-2)       
      ,[aidinkieli_versio1_id]=ISNULL(d1.id,-2)      
      ,[ika_id]=ISNULL(d2.id,'-2')      
      ,[elakkeelle_siirtynyt_tai_kuollut_id]=ISNULL(d8.id,-2)            
      ,paaasiallinen_toiminta_id =ISNULL(d5.id,-2)
      ,[alueluokitus_id]=ISNULL(d3.id,-2)
      ,[alueluokitus_historia_id]=ISNULL(d3h.id,-2)
      ,[mitenna_ammatti_id]=ISNULL(d4a.id,-2)
	  ,[oef_ammatti_id]=ISNULL(d4b.id,-2)
      ,[tietojen_ajankohta_id]=ISNULL(d6.id,-2)
      ,[tiet_ak]      
      ,[tiet_akdate]
      ,[lkm_yht]
      ,[lkm_elakkeelle_siirtyneet]
      ,[lkm_kuolleet]

  FROM 
  
  (
  
  SELECT [tilv]
      ,[tilv_date]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji] 
      ,[elk_koodi]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1x]
      ,[amm2001_m2x]
	  ,[amm2010_oef1_x]
	  ,[amm2010_oef2_x]
      ,[tietolahde]
      ,[rivinumero]
      ,[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]
      ,[aineisto]
      ,lkm_yht
      ,lkm_elakkeelle_siirtyneet
      ,lkm_kuolleet
      
FROM [VipunenTK_DW].[dbo].[v_f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
  
UNION ALL
  
SELECT [tilv]
      ,[tilv_date]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[elk_koodi]      
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]
	  ,[amm2010_oef1_2x]
	  ,[amm2010_oef2_2x]
      ,[tietolahde]
      ,[rivinumero]      
      ,[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]
      ,[aineisto]
      ,lkm_yht
      ,lkm_elakkeelle_siirtyneet
      ,lkm_kuolleet
      
FROM [VipunenTK_DW].[dbo].[v_f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
  
  ) f

  LEFT JOIN VipunenTK..d_aidinkieli_versio1 d1
	on d1.aidinkieli_versio1_koodi=f.aikielir1
	and f.tilv_date between d1.alkaa and d1.paattyy	
	
  LEFT JOIN VipunenTK..d_ika d2
	on d2.ika_avain=f.ika

  LEFT JOIN VipunenTK..d_alueluokitus d3
	on d3.alueluokitus_avain = 'MAAK' + f.tmaakx
	
  LEFT JOIN VipunenTK..d_alueluokitus_historia d3h
	on d3h.alueluokitus_avain = 'MAAK' + f.tmaakx
	and f.tilv_date between d3h.alkaa and d3h.paattyy	


  LEFT JOIN VipunenTK..d_mitenna_ammatti d4a
	on d4a.mitenna_ammatti_koodi = f.[amm2001_m2x]
	and f.tilv_date between d4a.alkaa and d4a.paattyy

  LEFT JOIN VipunenTK..d_oef_ammatti d4b
	on d4b.oef_ammatti_koodi = f.[amm2010_oef2_x]
	and f.tilv_date between d4b.alkaa and d4b.paattyy

  LEFT JOIN VipunenTK..d_paaasiallinen_toiminta d5
	on d5.paaasiallinen_toiminta_koodi = f.[ptoim1r8x]
	and f.tilv_date between d5.alkaa and d5.paattyy
	
  LEFT JOIN VipunenTK..d_tietojen_ajankohta d6
    on d6.tietojen_ajankohta_koodi = f.tietojen_ajankohta

  LEFT JOIN VipunenTK..d_sukupuoli d7
    on d7.sukupuoli_koodi = f.sp

  LEFT JOIN VipunenTK..d_elakkeelle_siirtynyt_tai_kuollut d8
    on d8.elakkeelle_siirtynyt_tai_kuollut_koodi = f.elk_koodi




GO


