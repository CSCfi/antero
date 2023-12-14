USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_16_Tyossakayvat_ammateittain]    Script Date: 14.12.2023 10:16:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER VIEW [dbo].[v_f_R4_16_Tyossakayvat_ammateittain] AS

/* Lauseet siirtoon VipunenTK-kantaan nopeaa testiä varten
Drop table VipunenTK.dbo.f_tyossakayvat_ammateittain
Truncate table VipunenTK.dbo.f_tyossakayvat_ammateittain
Insert into VipunenTK.dbo.f_tyossakayvat_ammateittain
  Select * from VipunenTK_DW.dbo.[v_f_R4_16_Tyossakayvat_ammateittain]
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
      ,[mitenna_ammatti2_id]=ISNULL(d1.id,-1)
      ,[amm2001_m]
      ,[mitenna_ammatti_id]=ISNULL(d13.id,-1)
	  ,[amm2010]
	  ,[amm2010_id]=ISNULL(d3.id,-1)
      ,[amm2010_oef1]
	  ,[amm2010_oef2]
	  ,[oef_ammatti_id]=ISNULL(d2.id,-1)
      ,[sp]
      ,[sukupuoli_id]=ISNULL(d4.id,-1)
      ,[aikielir1]
      ,[aikielir1_id]=ISNULL(d6.id,-1)
      ,[ikar1]
      ,[ikar1_koodi]=ISNULL(d9.ika_avain,'-1')
      ,[ika_id]=ISNULL(d9.id,'-1')     
      ,[opmast]
      ,[koulutusaste_id]=ISNULL(d5.id,-1)
	  ,[koulutusaste_taso2]=f.kaste_t2
	  ,[koulutusaste_taso2_id]=ISNULL(d5b.id,-1)
      ,[tutklaja]
      ,[tutkintolaji_id]=ISNULL(d12.id,-1)
      ,[opmopa]
      ,[koulutusluokitus_id]=ISNULL(d14.id,-1)
	  ,[opintoala2002_koodi]=ISNULL(d11.opintoala2002_koodi,-1)
	  ,[koulutusala_taso2]=f.iscfinarrow2013
	  ,[koulutusala_taso2_id]=ISNULL(d14b.id,-1)
      ,[tmaak]
      ,[tyomaakunta_historia_id]=ISNULL(d8h.id,(select id from VipunenTK..d_alueluokitus_historia where alueluokitus_avain='-1' and f.tilv_date between alkaa and paattyy))
      ,[tyomaakunta_id]=ISNULL(d8.id,-1)



FROM

(

SELECT [tilv]
      ,[tilv_date]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]=ika
      ,[ikar1_koodi]=Cast(ika as nvarchar(10))
      ,[opmast]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013]
      ,[amm2001_m1]
      ,[amm2001_m2]
      ,[amm2001_m]
	  ,[amm2010]
	  ,[amm2010_oef1]
	  ,[amm2010_oef2]
      ,[tmaak]
      ,[amm2001_mnim]
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero]
      ,aineisto = CAST('R4.16' as nvarchar(8))
  FROM [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]

) f

  LEFT JOIN VipunenTK..d_mitenna_ammatti d1
	on d1.mitenna_ammatti_koodi=f.amm2001_m2
	and f.tilv_date between d1.alkaa and d1.paattyy

  LEFT JOIN VipunenTK..d_oef_ammatti d2
	on d2.oef_ammatti_koodi=f.amm2010_oef2
	and f.tilv_date between d2.alkaa and d2.paattyy

  LEFT JOIN VipunenTK..v_d_ammattiluokitus_2010 d3
	on d3.[ammattiluokitus_2010_avain]=f.[amm2010]
	and f.tilv_date between d3.alkaa and d3.paattyy

  LEFT JOIN VipunenTK..d_sukupuoli d4
	on d4.sukupuoli_koodi=f.sp
	and f.tilv_date between d4.alkaa and d4.paattyy	

  LEFT JOIN VipunenTK..d_koulutusluokitus d5
	on d5.koulutusluokitus_avain='OPMAST'+f.opmast

  LEFT JOIN VipunenTK..d_koulutusluokitus d5b
	on d5b.koulutusluokitus_avain='KASTET2'+f.kaste_t2

  LEFT JOIN VipunenTK..d_aidinkieli_versio1 d6
	on d6.aidinkieli_versio1_koodi=f.aikielir1
	and f.tilv_date between d6.alkaa and d6.paattyy	

  LEFT JOIN VipunenTK..d_alueluokitus_historia d8h
	on d8h.alueluokitus_avain='MAAK'+f.tmaak
	and f.tilv_date between d8h.alkaa and d8h.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus d8
	on d8.alueluokitus_avain='MAAK'+f.tmaak
	
  LEFT JOIN VipunenTK..d_ika d9
	on d9.ika_avain=f.ikar1_koodi

  LEFT JOIN VipunenTK..d_opintoala2002 d11
	on d11.opintoala2002_koodi=f.opmopa

  LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji d12
	on d12.ammatillisen_koulutuksen_koulutuslaji_koodi=f.tutklaja
	and f.tilv_date between d12.alkaa and d12.paattyy	

  LEFT JOIN VipunenTK..d_mitenna_ammatti d13
	on d13.mitenna_ammatti_koodi=f.amm2001_m
	and f.tilv_date between d13.alkaa and d13.paattyy
	
  LEFT JOIN VipunenTK..d_koulutusluokitus d14
  on d14.koulutusluokitus_avain=case when f.opmopa='-1' then '-1' else 'OPMOPA'+f.opmopa End

  LEFT JOIN VipunenTK..d_koulutusluokitus d14b
  on d14b.koulutusluokitus_avain='ISCFINARROW'+f.iscfinarrow2013








GO


