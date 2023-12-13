USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]    Script Date: 7.12.2023 12:09:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]

INSERT INTO [VipunenTK].[dbo].[f_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]

  SELECT f.[tilastovuosi]
      ,f.[sukupuoli_koodi]
      ,sukupuoli_id = coalesce(d1.id, -1)
      ,f.[aidinkieli_versio1_koodi]
      ,aidinkieli_versio1_id = coalesce(d2.id, -1)
      ,f.[ika_avain]
      ,ika_id = coalesce(d3.id, -1)
      ,f.[tyopaikan_sijaintimaakunta_avain]
      ,tyopaikan_sijaintimaakunta_id = coalesce(d4.id, -1)
      ,tyopaikan_sijaintimaakunta_historia_id = coalesce(d4h.id, -1)      
--      ,f.[amm2001_m1]
      ,f.[mitenna_ammattiryhma2_koodi]
	  ,[oef_ammattiryhma2_koodi] = '-1'
      ,mitenna_ammatti_id = coalesce(d5.id, -1)
	  ,oef_ammatti_id = -1
      ,f.[paaasiallinen_toiminta_siirtyman_paassa_koodi]
      ,paaasiallinen_toiminta_siirtyman_paassa_id = coalesce(d6.id, -1)
      ,f.[tyopaikan_sijainti_v_tilastovuonna_avain]
      ,tyopaikan_sijainti_v_tilastovuonna_id = coalesce(d7.id, -1)
--      ,f.[amm2001_m1_2009]
      ,f.[mitenna_ammattiryhma2_siirtyman_paassa_koodi]
	  ,[oef_ammattiryhma2_siirtyman_paassa_koodi] = '-1'
      ,mitenna_ammatti_siirtyman_paassa_id = coalesce(d8.id, -1)
	  ,oef_ammatti_siirtyman_paassa_id = -1

	--uudet
	  ,paaasiallinen_toimintar9_id = '-1' --coalesce(d6b.id, '-1')
	  ,paaasiallinen_toimintar9_siirtyman_paassa_id = '-1' --coalesce(d6c.id, '-1')
	  ,aidinkieli_versio5_id = '-1' --coalesce(d2b.id, '-1')
	  ,toimiala_id = '-1' --coalesce(d12.id, '-1')
	  ,toimiala_siirtyman_paassa_id = '-1' --coalesce(d13.id, '-1')
	  ,koulutusaste_vanha_id = '-1' --coalesce(d14.id,'-1')
	  ,koulutusaste_vanha_siirtyman_paassa_id = '-1' --coalesce(d15.id,'-1')
	  ,koulutusaste_uusi_id = '-1' --coalesce(d16.id,'-1')
	  ,koulutusaste_uusi_siirtyman_paassa_id = '-1' --coalesce(d17.id,'-1')
	  ,opintoala_id = '-1' --coalesce(d18.id,'-1')
	  ,opintoala_siirtyman_paassa_id = '-1' --coalesce(d19.id,'-1')
	  ,koulutusala_taso2_id = '-1' --coalesce(d20.id,'-1')
	  ,koulutusala_taso2_siirtyman_paassa_id = '-1' --coalesce(d21.id,'-1')
	  ,koulutuslaji_id = '-1' --coalesce(d22.id,'-1')
	  ,koulutuslaji_siirtyman_paassa_id = '-1' --coalesce(d23.id,'-1')
	  ,opettajankelpoisuus_id = '-1' --coalesce(d24.id,'-1')
	  ,opettajankelpoisuus_siirtyman_paassa_id = '-1' --coalesce(d25.id,'-1')
	  ,tyopaikan_sijaintimaakunta_sama_kylla_ei_id = '-1' --coalesce(d26.id,'-1')
	  ,opintoala_erikoistumiskoulutus_siirtyman_paassa_id = '-1' --coalesce(d27.id,'-1')
	  --,koulutusala_taso2_erikoistumiskoulutus_siirtyman_paassa_id = '-1' --coalesce(d30.id,'-1')
	  ,koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa_id = '-1' --coalesce(d28.id,'-1')
	  ,koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa_id = '-1' --coalesce(d29.id,'-1')

      ,f.[lkm]
      ,f.[suhteellinen_ajankohta_avain]
      ,suhteellinen_ajankohta_id = coalesce(d9.id, -1)
      ,f.[perusjoukko_tyolliset_avain]
      ,perusjoukko_tyolliset_id = coalesce(d10.id, -1)
      ,f.[siirtyman_tarkastelusuunta_avain]
      ,siirtyman_tarkastelusuunta_id = coalesce(d11.id, -1)
	  ,lahde = 'R4.19/R4.20'
      
     
  FROM [VipunenTK_DW].[dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f

  LEFT OUTER JOIN VipunenTK..d_sukupuoli d1 ON d1.sukupuoli_koodi = f.sukupuoli_koodi
  LEFT OUTER JOIN VipunenTK..d_aidinkieli_versio1 d2 ON d2.aidinkieli_versio1_koodi = f.aidinkieli_versio1_koodi
  LEFT OUTER JOIN VipunenTK..d_ika d3 ON d3.ika_avain = f.ika_avain
  LEFT OUTER JOIN VipunenTK..d_alueluokitus d4 ON d4.alueluokitus_avain = f.tyopaikan_sijaintimaakunta_avain
  LEFT OUTER JOIN VipunenTK..d_alueluokitus_historia d4h ON d4h.alueluokitus_avain = f.tyopaikan_sijaintimaakunta_avain AND f.tilastovuosi between d4h.alkaa and d4h.paattyy
  LEFT OUTER JOIN VipunenTK..d_mitenna_ammatti d5 ON d5.mitenna_ammatti_koodi = f.mitenna_ammattiryhma2_koodi
  LEFT OUTER JOIN VipunenTK..d_paaasiallinen_toiminta d6 ON d6.paaasiallinen_toiminta_koodi = f.paaasiallinen_toiminta_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_tyopaikan_sijainti_v_tilastovuonna d7 ON d7.tyopaikan_sijainti_v_tilastovuonna_avain = f.tyopaikan_sijainti_v_tilastovuonna_avain
  LEFT OUTER JOIN VipunenTK..d_mitenna_ammatti d8 ON d8.mitenna_ammatti_koodi = f.mitenna_ammattiryhma2_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_suhteellinen_ajankohta d9 ON d9.suhteellinen_ajankohta_avain = f.suhteellinen_ajankohta_avain
  LEFT OUTER JOIN VipunenTK..d_perusjoukko_tyolliset d10 ON d10.perusjoukko_tyolliset_avain = f.perusjoukko_tyolliset_avain
  LEFT OUTER JOIN VipunenTK..d_siirtyman_tarkastelusuunta d11 ON d11.siirtyman_tarkastelusuunta_avain = f.siirtyman_tarkastelusuunta_avain
  --LEFT OUTER JOIN VipunenTK..d_toimiala_2008 d12 ON d12.toimiala_2008_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_toimiala_2008 d13 ON d13.toimiala_2008_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusaste_2002 d14 ON d14.koulutusaste_2002koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusaste_2002 d15 ON d15.koulutusaste_2002koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d16 ON d16.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d17 ON d17.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d18 ON d18.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d19 ON d19.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d20 ON d20.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d21 ON d21.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 ON d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d23 ON d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_kylla_ei d24 ON d24.kylla_ei_koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_kylla_ei d25 ON d25.kylla_ei_koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_kylla_ei d26 ON d26.kylla_ei_koodi = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d27 ON d27.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d28 ON d28.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d29 ON d29.koulutusluokitus_avain = '-1'
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d30 ON d30.koulutusluokitus_avain = '-1'

  UNION ALL
 
  SELECT f.[tilastovuosi]
      ,'-1'
      ,sukupuoli_id = coalesce(d1.id, -1)
      ,'-1'
      ,aidinkieli_versio1_id = coalesce(d2a.id, -1)
      ,f.[ika_avain]
      ,ika_id = coalesce(d3.id, -1)
      ,'-1'
      ,tyopaikan_sijaintimaakunta_id = coalesce(d4.id, -1)
      ,tyopaikan_sijaintimaakunta_historia_id = coalesce(d4h.id, -1)      
      ,f.[mitenna_ammattiryhma2_koodi]
	  ,f.oef_ammattiryhma2_koodi
      ,mitenna_ammatti_id = coalesce(d5.id, -1)
	  ,oef_ammatti_id = coalesce(d30.id, -1)
      ,'-1'
      ,paaasiallinen_toiminta_siirtyman_paassa_id = coalesce(d6a.id, -1)
	  ,'-1'
      ,tyopaikan_sijainti_v_tilastovuonna_id = coalesce(d7.id, -1)
      ,f.[mitenna_ammattiryhma2_siirtyman_paassa_koodi]
	  ,f.[oef_ammattiryhma2_siirtyman_paassa_koodi]
      ,mitenna_ammatti_siirtyman_paassa_id = coalesce(d8.id, -1)
	  ,oef_ammatti_siirtyman_paassa_id = coalesce(d31.id, -1)

	--uudet
	  ,paaasiallinen_toimintar9_id = coalesce(d6b.id, '-1')
	  ,paaasiallinen_toimintar9_siirtyman_paassa_id = coalesce(d6c.id, '-1')
	  ,aidinkieli_versio5_id = coalesce(d2b.id, '-1')
	  ,toimiala_id = coalesce(d12.id, '-1')
	  ,toimiala_siirtyman_paassa_id = coalesce(d13.id, '-1')
	  ,koulutusaste_vanha_id = coalesce(d14.id,'-1')
	  ,koulutusaste_vanha_siirtyman_paassa_id = coalesce(d15.id,'-1')
	  ,koulutusaste_uusi_id = coalesce(d16.id,'-1')
	  ,koulutusaste_uusi_siirtyman_paassa_id = coalesce(d17.id,'-1')
	  ,opintoala_id = coalesce(d18.id,'-1')
	  ,opintoala_siirtyman_paassa_id = coalesce(d19.id,'-1')
	  ,koulutusala_taso2_id = coalesce(d20.id,'-1')
	  ,koulutusala_taso2_siirtyman_paassa_id = coalesce(d21.id,'-1')
	  ,koulutuslaji_id = coalesce(d22.id,'-1')
	  ,koulutuslaji_siirtyman_paassa_id = coalesce(d23.id,'-1')
	  ,opettajankelpoisuus_id = coalesce(d24.id,'-1')
	  ,opettajankelpoisuus_siirtyman_paassa_id = coalesce(d25.id,'-1')
	  ,tyopaikan_sijaintimaakunta_sama_kylla_ei_id = coalesce(d26.id,'-1')
	  ,opintoala_erikoistumiskoulutus_siirtyman_paassa_id = coalesce(d27.id,'-1') --opmopa
	  --,koulutusala_taso2_erikoistumiskoulutus_siirtyman_paassa_id = coalesce(d30.id,'-1') --iscfinarrow
	  ,koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa_id = coalesce(d28.id,'-1')
	  ,koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa_id = coalesce(d29.id,'-1')

      ,f.[lkm]
      ,f.[suhteellinen_ajankohta_avain]
      ,suhteellinen_ajankohta_id = coalesce(d9.id, -1)
      ,f.[perusjoukko_tyolliset_avain]
      ,perusjoukko_tyolliset_id = coalesce(d10.id, -1)
      ,f.[siirtyman_tarkastelusuunta_avain]
      ,siirtyman_tarkastelusuunta_id = coalesce(d11.id, -1)
	  ,lahde = 'R4.23'
      
     
  FROM [VipunenTK_DW].[dbo].[f_R4_23_Tyollisten_ammattisiirtymat] f

  LEFT OUTER JOIN VipunenTK..d_sukupuoli d1 ON d1.sukupuoli_koodi = '-1'
  LEFT OUTER JOIN VipunenTK..d_aidinkieli_versio1 d2a ON d2a.aidinkieli_versio1_koodi = '-1'
  LEFT OUTER JOIN VipunenTK..d_aidinkieli_versio5 d2b ON d2b.aidinkieli_versio5_koodi = f.aidinkieli_versio5_koodi
  LEFT OUTER JOIN VipunenTK..d_ika d3 ON d3.ika_avain = f.ika_avain
  LEFT OUTER JOIN VipunenTK..d_alueluokitus d4 ON d4.alueluokitus_avain = '-1'
  LEFT OUTER JOIN VipunenTK..d_alueluokitus_historia d4h ON d4h.alueluokitus_avain = '-1' AND f.tilastovuosi between d4h.alkaa and d4h.paattyy
  LEFT OUTER JOIN VipunenTK..d_mitenna_ammatti d5 ON d5.mitenna_ammatti_koodi = f.mitenna_ammattiryhma2_koodi
  LEFT OUTER JOIN VipunenTK..d_paaasiallinen_toiminta d6a ON d6a.paaasiallinen_toiminta_koodi = '-1'
  LEFT OUTER JOIN VipunenTK..d_paaasiallinen_toiminta_versio9 d6b ON d6b.paaasiallinen_toiminta_versio9_koodi = f.paaasiallinen_toiminta_r9
  LEFT OUTER JOIN VipunenTK..d_paaasiallinen_toiminta_versio9 d6c ON d6c.paaasiallinen_toiminta_versio9_koodi = f.paaasiallinen_toiminta_r9_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_tyopaikan_sijainti_v_tilastovuonna d7 ON d7.tyopaikan_sijainti_v_tilastovuonna_avain = '-1'
  LEFT OUTER JOIN VipunenTK..d_mitenna_ammatti d8 ON d8.mitenna_ammatti_koodi = f.mitenna_ammattiryhma2_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_suhteellinen_ajankohta d9 ON d9.suhteellinen_ajankohta_avain = f.suhteellinen_ajankohta_avain
  LEFT OUTER JOIN VipunenTK..d_perusjoukko_tyolliset d10 ON d10.perusjoukko_tyolliset_avain = f.perusjoukko_tyolliset_avain
  LEFT OUTER JOIN VipunenTK..d_siirtyman_tarkastelusuunta d11 ON d11.siirtyman_tarkastelusuunta_avain = f.siirtyman_tarkastelusuunta_avain
  LEFT OUTER JOIN VipunenTK..d_toimiala_2008 d12 ON d12.toimiala_2008_avain = f.toimiala2008_avain
  LEFT OUTER JOIN VipunenTK..d_toimiala_2008 d13 ON d13.toimiala_2008_avain = f.toimiala2008_siirtyman_paassa_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusaste_2002 d14 ON d14.koulutusaste_2002koodi = f.koulutusaste2002_koodi
  LEFT OUTER JOIN VipunenTK..d_koulutusaste_2002 d15 ON d15.koulutusaste_2002koodi = f.koulutusaste2002_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d16 ON d16.koulutusluokitus_avain = f.koulutusaste_taso2_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d17 ON d17.koulutusluokitus_avain = f.koulutusaste_taso2_siirtyman_paassa_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d18 ON d18.koulutusluokitus_avain = f.opintoala_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d19 ON d19.koulutusluokitus_avain = f.opintoala_siirtyman_paassa_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d20 ON d20.koulutusluokitus_avain = f.koulutusala_taso2_avain
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d21 ON d21.koulutusluokitus_avain = f.koulutusala_taso2_siirtyman_paassa_avain
  LEFT OUTER JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 ON d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = f.koulutuslaji_koodi
  LEFT OUTER JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d23 ON d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = f.koulutuslaji_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_kylla_ei d24 ON d24.kylla_ei_koodi = f.opettajankelpoisuus_kytkin_koodi
  LEFT OUTER JOIN VipunenTK..d_kylla_ei d25 ON d25.kylla_ei_koodi = f.opettajankelpoisuus_kytkin_siirtyman_paassa_koodi
  LEFT OUTER JOIN VipunenTK..d_kylla_ei d26 ON d26.kylla_ei_koodi = f.tyopaikan_sijaintimaakunta_kytkin_koodi
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d27 ON d27.koulutusluokitus_avain = f.opintoala_erikoistumiskoulutus_siirtyman_paassa
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d28 ON d28.koulutusluokitus_avain = f.koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa
  LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d29 ON d29.koulutusluokitus_avain = f.koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa
  OUTER APPLY ( 
	SELECT 
		MAX(d30.id) as id  
	FROM VipunenTK..d_oef_ammatti d30 
	WHERE d30.oef_ammattiryhma2_koodi = f.oef_ammattiryhma2_koodi
  ) d30
  OUTER APPLY ( 
	SELECT 
		MAX(d31.id) as id  
	FROM VipunenTK..d_oef_ammatti d31
	WHERE d31.oef_ammattiryhma2_koodi = f.oef_ammattiryhma2_siirtyman_paassa_koodi
  ) d31
  --LEFT OUTER JOIN VipunenTK..d_koulutusluokitus d30 ON d30.koulutusluokitus_avain = f.koulutusala_taso2_erikoistumiskoulutus_siirtyman_paassa

  WHERE 1=1


GO

USE [ANTERO]