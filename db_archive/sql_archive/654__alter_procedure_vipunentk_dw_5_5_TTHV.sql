USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 28.6.2017 16:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

ALTER procedure [dbo].[p_lataa_f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] as

--execute VipunenTK_DW.dbo.p_lataa_f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat

--drop table vipunentk.dbo.f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat

truncate table vipunentk.dbo.f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat
insert into vipunentk.dbo.f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat

SELECT 
	   f.[tilastovuosi]
      ,syntymamaa_id = coalesce(d1.id, -2)
      ,kansalaisuus_valtio_id = coalesce(d2.id, -2)
      ,sukupuoli_id = coalesce(d3.id, -2)
      ,ika_id = coalesce(d4.id, -2) 
      ,asuinmaakunta_id = coalesce(d5.id, -2)
	  ,paaasiallinen_toiminta_versio3_id = coalesce(d16.id, -2)
      ,koulutusluokitus_id = coalesce(d6.id, -2)
	  ,tieteenala_id = coalesce(d14.id, -2) --Koulutuskoodi -> tieteenala -mappauksesta puuttuu vielä paljon koodeja.
      ,f.[tutkinnon_suoritusvuosi]
	  ,tutkinnosta_kulunut_aika_id = coalesce(d15.id, -1)
      ,tutkinnon_suoritusmaakunta_id = coalesce(d7.id, -2)
      ,ammattiluokitus_2001_id = coalesce(d8b.id, -2)
      ,ammattiluokitus_2010_id = coalesce(d8.id, -2)
      ,tyopaikan_sijaintimaakunta_id = coalesce(d9.id, -2)
      ,asuinmaakunta_sama_kuin_tyopaikan_sijaintikunta_id = coalesce(d12.id, -2)
      ,toimialaluokitus_tthv_id = coalesce(d10.id, -2)
	  ,toimialaluokitus_ed_tthv_id = coalesce(d19.id, -2)
      ,tyonantajasektori2_id = coalesce(d11.id, -2)
	  ,tyonantajasektori2_ed_id = coalesce(d18.id, -2)
	  ,tyonantajasektori2_tthv_id = coalesce(d20.id, -2)
	  ,tyonantajasektori2_ed_tthv_id = coalesce(d21.id, -2)
	  ,tyonantajasektori_sama_kuin_ed_vuonna_id = coalesce(d22.id, -2)
	  ,toimiala_tthv1_sama_kuin_ed_vuonna_id = coalesce(d23.id, -2)
	  ,toimiala_tthv2_sama_kuin_ed_vuonna_id = coalesce(d24.id, -2)
	  ,yrityksen_koko_id = coalesce(d25.id, -1)
	  ,tyonantaja_vaihtunut_id = coalesce(d26.id,-1)
      ,f.[lkm]
	  --Otetaan avaimet talteen testausta varteen
	  ,f.syntymamaa_avain
	  ,f.kansalaisuus_avain
	  ,f.sukupuoli_avain
	  ,f.ika_avain
	  ,f.asuinmaakunta_avain
	  ,f.koulutusluokitus_avain
	  ,f.tutkinnon_suoritusmaakunta
	  ,f.ammattikoodi_2010_avain
	  ,f.tyopaikan_sijaintimaakunta_avain
	  ,f.toimialaluokitus_tthv_avain
	  ,f.toimialaluokitus_ed_tthv_avain
	  ,f.toimiala_tthv1_sama_kuin_ed_vuonna_avain
	  ,f.toimiala_tthv2_sama_kuin_ed_vuonna_avain
	  ,f.tyonantajasektori2_avain
	  ,f.tyonantajasektori2_ed_avain
	  ,f.tyonantajasektori2_tthv_avain
	  ,f.tyonantajasektori2_ed_tthv_avain
	  ,f.yrityksen_koko_avain
	  ,f.asuinmaakunta_sama_kuin_tyopaikan_sijaintikunta_avain
	  ,d13.tieteenala_avain
	  ,f.koulutuksesta_kulunut_aika_koodi
	  ,f.paaasiallinen_toiminta_versio3_avain
--INTO vipunentk.dbo.f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat
FROM [VipunenTK_DW].[dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] f
  left join vipunentk.dbo.d_valtio d1 on d1.valtio_avain = f.syntymamaa_avain
  left join vipunentk.dbo.d_valtio d2 on d2.valtio_avain = f.kansalaisuus_avain
  left join vipunentk.dbo.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli_avain
  left join vipunentk.dbo.d_ika d4 on d4.ika_avain = f.ika_avain
  left join vipunentk.dbo.d_alueluokitus d5 on d5.alueluokitus_avain = f.asuinmaakunta_avain
  left join vipunentk.dbo.d_koulutusluokitus d6 on d6.koulutusluokitus_avain = f.koulutusluokitus_avain
  left join vipunentk.dbo.d_alueluokitus d7 on d7.alueluokitus_avain = f.tutkinnon_suoritusmaakunta
  left join vipunentk.dbo.d_ammattiluokitus_2001 d8b on d8b.ammattiluokitus_2001_avain = Case
	when f.tilastovuosi < '2010' then f.ammattikoodi_2010_avain 
	else '-1' end
  left join vipunentk_lisatiedot.dbo.ammattiluokitus_2001_2010 d17 on d17.ammattiluokitus_2001_avain = f.ammattikoodi_2010_avain
  left join vipunentk.dbo.d_ammattiluokitus_2010 d8 on d8.ammattiluokitus_2010_avain = Case 
	when f.tilastovuosi < '2010' then ISNULL(d17.ammattiluokitus_2010_avain,'-1') 
	else f.ammattikoodi_2010_avain end
  left join vipunentk.dbo.d_alueluokitus d9 on d9.alueluokitus_avain = f.tyopaikan_sijaintimaakunta_avain
  left join vipunentk.dbo.d_toimiala_tthv d10 on d10.toimiala_tthv_avain = f.toimialaluokitus_tthv_avain
  left join vipunentk.dbo.d_tyonantajasektori2 d11 on d11.tyonantajasektori2_avain = f.tyonantajasektori2_avain
  left join vipunentk.dbo.d_asuinmaakunta_sama_kuin_tyopaikan d12 on d12.asuinmaakunta_sama_kuin_tyopaikan_avain = f.asuinmaakunta_sama_kuin_tyopaikan_sijaintikunta_avain
  left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d13 on d13.koulutuskoodi = f.koulutusluokitus_avain
  left join VipunenTK.dbo.d_tieteenala d14 on d14.tieteenala_avain = COALESCE(d13.tieteenala_avain, '-1') --Tuntematon, jos ei asetettu CSC Jarmo 6.5.2016
  left join VipunenTK.dbo.d_koulutuksesta_kulunut_aika d15 on d15.koulutuksesta_kulunut_aika_koodi = f.koulutuksesta_kulunut_aika_koodi
  left join VipunenTK.dbo.d_paaasiallinen_toiminta_versio3 d16 on d16.paaasiallinen_toiminta_versio3_avain = f.paaasiallinen_toiminta_versio3_avain
  left join vipunentk.dbo.d_tyonantajasektori2 d18 on d18.tyonantajasektori2_avain = f.tyonantajasektori2_ed_avain
  left join vipunentk.dbo.d_toimiala_tthv d19 on d19.toimiala_tthv_avain = f.toimialaluokitus_ed_tthv_avain
  left join vipunentk.dbo.d_tyonantajasektori2 d20 on d20.tyonantajasektori2_avain = f.tyonantajasektori2_tthv_avain
  left join vipunentk.dbo.d_tyonantajasektori2 d21 on d21.tyonantajasektori2_avain = f.tyonantajasektori2_ed_tthv_avain
  left join vipunentk.dbo.d_tyonantajasektori_sama_kuin_ed_vuonna d22 on d22.tyonantajasektori_sama_kuin_ed_vuonna_koodi = f.tyonantajasektori_sama_kuin_ed_vuonna_avain
  left join vipunentk.dbo.d_toimiala_tthv1_sama_kuin_ed_vuonna d23 on d23.toimiala_tthv1_sama_kuin_ed_vuonna_koodi = f.toimiala_tthv1_sama_kuin_ed_vuonna_avain
  left join vipunentk.dbo.d_toimiala_tthv2_sama_kuin_ed_vuonna d24 on d24.toimiala_tthv2_sama_kuin_ed_vuonna_koodi = f.toimiala_tthv2_sama_kuin_ed_vuonna_avain
  left join VipunenTK.dbo.d_yrityksen_koko_tthv d25 on d25.yrityksen_koko_koodi = f.yrityksen_koko_avain
  left join vipunentk.dbo.d_kylla_ei d26 on d26.kylla_ei_koodi = f.tyonantaja_vaihtunut_avain


Go 

USE [ANTERO]