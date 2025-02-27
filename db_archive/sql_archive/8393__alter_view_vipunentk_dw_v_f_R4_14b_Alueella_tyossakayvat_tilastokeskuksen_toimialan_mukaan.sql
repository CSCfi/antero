USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 14.12.2023 12:28:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE OR ALTER VIEW [dbo].[v_f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] AS

/* Lauseet siirtoon VipunenTK-kantaan nopeaa testi� varten
Truncate table VipunenTK.dbo.f_alueella_tyossakayvat_toimialoittain
Insert into VipunenTK.dbo.f_alueella_tyossakayvat_toimialoittain
 select * from VipunenTK_DW.dbo.v_f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan
*/

SELECT [tilv]
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      ,f.[tietolahde]
      ,[rivinumero]
      ,[lkm]
      ,[amm2001_m1]
      ,[amm2001_m2]
      ,[mitenna_ammatti_id]=ISNULL(d1a.id,-1)
	  ,[amm2010_oef1]
	  ,[amm2010_oef2]
	  ,[oef_ammatti_id]=ISNULL(d1b.id,-1)
      ,[tol2008_m1]
      ,[tol2008_m2]
      ,[mitenna_toimiala_id]=ISNULL(d2a.id,-1)
	  ,[tol2008_oef]
	  ,[oef_toimiala_id]=ISNULL(d2b.id,-1)
	  ,f.[tol2008]
	  ,[tol2008_id]=ISNULL(d3.id, -1)
      ,[ikar1]
      ,[ikar1_koodi]=ISNULL(d9.ika_avain,'-1')
      ,[ika_id]=ISNULL(d9.id,'-1')      
      ,[opmast]
      ,[koulutusaste_id]=ISNULL(d5.id,-1)
	  ,[koulutusaste_taso2] = f.kaste_t2
	  ,[koulutusaste_taso2_id]=ISNULL(d5b.id,-1)
      ,[tutklaja]
      ,[tutkintolaji_id]=ISNULL(d12.id,-1)
      ,[opmopa]
      ,[opintoala2002_koodi]=ISNULL(d11.opintoala2002_koodi,-1)
	  ,[opintoala_id]=ISNULL(d13.id,-1)
	  ,[koulutusala_taso2]=f.iscfinarrow2013
	  ,[koulutusala_taso2_id]=ISNULL(d11b.id,-1)
	  ,[koulutusala_taso3]=f.iscfi2013
	  ,[koulutusala_taso3_id]=ISNULL(d11c.id,-1)
      ,[tmaak]
      ,[tyomaakunta_historia_id]=ISNULL(d8h.id,(select id from VipunenTK..d_alueluokitus_historia where alueluokitus_avain='-1' and f.tilv_date between alkaa and paattyy))
      ,[tyomaakunta_id]=ISNULL(d8.id,-1)


FROM 

(

SELECT [tilv]
      ,[tilv_date]
      ,[ikar1]
      ,[ikar1_koodi]=Cast('5v'+ikar1 as nvarchar(10))
      ,[opmast]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa]
      ,opmopa_avain='OPMOPA'+opmopa
	  ,[iscfinarrow2013]
	  ,[iscfi2013]
      ,[tol2008_m1]
      ,[tol2008_m2]
	  ,[tol2008_oef]
	  ,[tol2008]
      ,[amm2001_m1]
      ,[amm2001_m2]
	  ,[amm2010_oef1]
	  ,[amm2010_oef2]
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero]
      ,aineisto = CAST('R4.14b' as nvarchar(8))
FROM [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]

) f

  LEFT JOIN VipunenTK..d_mitenna_ammatti d1a
	on d1a.mitenna_ammatti_koodi=f.amm2001_m2
	and f.tilv_date between d1a.alkaa and d1a.paattyy

  LEFT JOIN VipunenTK..d_oef_ammatti d1b
	on d1b.oef_ammatti_koodi=f.[amm2010_oef2]
	and f.tilv_date between d1b.alkaa and d1b.paattyy
  
  LEFT JOIN VipunenTK..d_mitenna_toimiala d2a
	on d2a.tol_koodi=f.tol2008_m2
	and f.tilv_date between d2a.alkaa and d2a.paattyy

  LEFT JOIN VipunenTK..d_oef_toimiala d2b
	on d2b.oef_toimiala_koodi=f.[tol2008_oef]
	and f.tilv_date between d2b.alkaa and d2b.paattyy
  
  LEFT JOIN VipunenTK..d_toimiala_tk d3
	on d3.tol2008=f.tol2008
	and f.tilv_date between d3.alkaa and d3.paattyy

  
  LEFT JOIN VipunenTK..d_koulutusluokitus d5
	on d5.koulutusluokitus_avain='OPMAST'+f.opmast
	--and f.tilv_date between d5.alkaa and d5.paattyy	

  LEFT JOIN VipunenTK..d_koulutusluokitus d5b
	on d5b.koulutusluokitus_avain='KASTET2'+f.kaste_t2
	--and f.tilv_date between d5.alkaa and d5.paattyy	


  LEFT JOIN VipunenTK..d_alueluokitus_historia d8h
	on d8h.alueluokitus_avain='MAAK'+f.tmaak
	and f.tilv_date between d8h.alkaa and d8h.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus d8
	on d8.alueluokitus_avain='MAAK'+f.tmaak


  LEFT JOIN VipunenTK..d_ika d9
	on d9.ika_avain=f.ikar1_koodi
  
  LEFT JOIN VipunenTK..d_opintoala2002 d11
	on d11.opintoala2002_koodi=f.opmopa

  LEFT JOIN VipunenTK..d_koulutusluokitus d11b
	on d11b.koulutusluokitus_avain='ISCFINARROW'+f.iscfinarrow2013
  
  LEFT JOIN VipunenTK..d_koulutusluokitus d11c
	on d11c.koulutusluokitus_avain='ISCFI'+f.iscfi2013
  
  LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji d12
	on d12.ammatillisen_koulutuksen_koulutuslaji_koodi=f.tutklaja
	and f.tilv_date between d12.alkaa and d12.paattyy	
  
  LEFT JOIN VipunenTK..d_koulutusluokitus d13
	on d13.koulutusluokitus_avain=f.opmopa_avain








GO


