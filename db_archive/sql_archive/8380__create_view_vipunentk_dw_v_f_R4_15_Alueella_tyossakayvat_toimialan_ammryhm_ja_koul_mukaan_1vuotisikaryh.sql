USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 12.12.2023 17:10:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER VIEW [dbo].[v_f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] AS

/* Lauseet siirtoon VipunenTK-kantaan nopeaa testiä varten
Truncate table VipunenTK.dbo.f_alueella_tyossakayvat_1v
Insert into VipunenTK.dbo.f_alueella_tyossakayvat_1v
Select * from VipunenTK_DW.dbo.v_f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh
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
	  ,[tol2008_2]
      ,[tol2008_2_id]=ISNULL(d3.id,-1)
      ,[aikielir1]
      ,[aikielir1_id]=ISNULL(d6.id,-1)
      ,[ikar1]
      ,[ikar1_koodi]=ISNULL(d9.ika_avain,'-1')
      ,[ika_id]=ISNULL(d9.id,'-1')      
      ,[tilvasmaak]
      ,[asuinmaakunta_historia_id]=ISNULL(d7h.id,(select id from VipunenTK..d_alueluokitus_historia where alueluokitus_avain='-1' and f.tilv_date between alkaa and paattyy))
      ,[asuinmaakunta_id]=ISNULL(d7.id,-1)      
      ,[tmaak]
      ,[tyomaakunta_historia_id]=ISNULL(d8h.id,(select id from VipunenTK..d_alueluokitus_historia where alueluokitus_avain='-1' and f.tilv_date between alkaa and paattyy))
      ,[tyomaakunta_id]=ISNULL(d8.id,-1)

FROM
(
  SELECT [tilv]
		,[tilv_date]
		,[aikielir1]
		,[ikar1]=ika
		,[ikar1_koodi]=Cast(ika as nvarchar(10))
		,[tilvasmaak]
		,[tol2008_2]
		,[tol2008_m1]
		,[tol2008_m2]
		,[tol2008_oef]
		,[amm2001_m1]
		,[amm2001_m2]
		,[amm2010_oef1]
	    ,[amm2010_oef2]
		,[tmaak]
		,[lkm]
		,[tietolahde]
		,[rivinumero]
		,aineisto = CAST('R4.15' as nvarchar(8))

  FROM [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
) f

  LEFT JOIN VipunenTK..d_mitenna_ammatti d1a
	on d1a.mitenna_ammatti_koodi=f.amm2001_m2
	and f.tilv_date between d1a.alkaa and d1a.paattyy

	LEFT JOIN VipunenTK..d_oef_ammatti d1b
	on d1b.oef_ammatti_koodi=f.amm2010_oef2
	and f.tilv_date between d1b.alkaa and d1b.paattyy

  LEFT JOIN VipunenTK..d_mitenna_toimiala d2a
	on d2a.tol_koodi=f.tol2008_m2
	and f.tilv_date between d2a.alkaa and d2a.paattyy

  LEFT JOIN VipunenTK..d_oef_toimiala d2b
	on d2b.oef_toimiala_koodi=f.tol2008_oef
	and f.tilv_date between d2b.alkaa and d2b.paattyy

  LEFT JOIN VipunenTK..d_toimiala_tk d3
	on d3.tol2008=f.tol2008_2
	and f.tilv_date between d3.alkaa and d3.paattyy

  LEFT JOIN VipunenTK..d_aidinkieli_versio1 d6
	on d6.aidinkieli_versio1_koodi=f.aikielir1
	and f.tilv_date between d6.alkaa and d6.paattyy	

  LEFT JOIN VipunenTK..d_alueluokitus_historia d7h
	on d7h.alueluokitus_avain='MAAK'+f.tilvasmaak
	and f.tilv_date between d7h.alkaa and d7h.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus d7
	on d7.alueluokitus_avain='MAAK'+f.tilvasmaak

  LEFT JOIN VipunenTK..d_alueluokitus_historia d8h
	on d8h.alueluokitus_avain='MAAK'+f.tmaak
	and f.tilv_date between d8h.alkaa and d8h.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus d8
	on d8.alueluokitus_avain='MAAK'+f.tmaak

  LEFT JOIN VipunenTK..d_ika d9
	on d9.ika_avain=f.ikar1_koodi



GO


