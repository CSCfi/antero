USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 1.3.2024 14:12:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
DROP TABLE [VipunenTK_DW]..f_R4_23_Tyollisten_ammattisiirtymat;
SELECT * INTO [VipunenTK_DW].dbo.f_R4_23_Tyollisten_ammattisiirtymat FROM VIPUNENTK_DW.[dbo].[v_f_R4_23_Tyollisten_ammattisiirtymat]
*/

ALTER VIEW [dbo].[v_f_R4_23_Tyollisten_ammattisiirtymat] AS

SELECT 
	   tilastovuosi = [tilv]
      ,paaasiallinen_toiminta_r9 = [ptoim1r9]
      ,aidinkieli_versio5_koodi = [aikielir5]
      ,ika_avain = 'ikar6_'+[ikar6]
      ,toimiala2008_avain = [tol2008_2]
	  ,oef_toimiala_avain = [tol2008_oef]
      ,mitenna_ammattiryhma2_koodi = 'MITENNA2010_'+[amm2010_m2]
	  ,oef_ammattiryhma2_koodi = [amm2010_oef2]
      ,koulutusaste2002_koodi = [opmast_2]
	  ,koulutusaste_taso2_avain = 'KASTET2'+[kaste_t2_2]
      ,opintoala_avain = 'OPMOPA'+[opmopa]
	  ,koulutusala_taso2_avain = 'ISCFINARROW'+[iscfinarrow2013]
      ,koulutuslaji_koodi = [tutklaja]
      ,opettajankelpoisuus_kytkin_koodi = [opkelp]
      ,tyopaikan_sijaintimaakunta_kytkin_koodi = case when [tmaak_se] = '2' then '0' else tmaak_se end

	  --siirtymä
      ,paaasiallinen_toiminta_r9_siirtyman_paassa_koodi = [ptoim1r9_s]
      ,toimiala2008_siirtyman_paassa_avain = [tol2008_2_s]
      ,mitenna_ammattiryhma2_siirtyman_paassa_koodi = 'MITENNA2010_'+[amm2010_m2_s]
	  ,oef_ammattiryhma2_siirtyman_paassa_koodi = [amm2010_oef2_s]
      ,koulutusaste2002_siirtyman_paassa_koodi = [opmast_2_s]
	  ,koulutusaste_taso2_siirtyman_paassa_avain = 'KASTET2'+[kaste_t2_2_s]
      ,opintoala_siirtyman_paassa_avain = 'OPMOPA'+[opmopa_s]
	  ,koulutusala_taso2_siirtyman_paassa_avain = 'ISCFINARROW'+[iscfinarrow2013_s]
      ,koulutuslaji_siirtyman_paassa_koodi = [tutklaja_s]
	  ,opettajankelpoisuus_kytkin_siirtyman_paassa_koodi = [opkelp_s]
	  ,opintoala_erikoistumiskoulutus_siirtyman_paassa = 'OPMOPA'+[erik_s] 
	  --,koulutusala_taso2_erikoistumiskoulutus_siirtyman_paassa = 'ISCFINARROW'+[erik_s] 
	  ,koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa = 'ISCFIBROAD'+[erik_amk_s]  
	  ,koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa = 'ISCFIBROAD'+[erik_yo_s]

      ,[suhteellinen_ajankohta_avain]
      ,perusjoukko_tyolliset_avain = tilv
      ,siirtyman_tarkastelusuunta_avain = 1

	  ,[lkm]
     
FROM [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]
  
GO

USE [ANTERO]