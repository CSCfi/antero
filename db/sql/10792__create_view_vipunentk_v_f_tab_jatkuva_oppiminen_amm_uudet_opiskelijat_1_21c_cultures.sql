USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_jatkuva_oppiminen_amm_uudet_opiskelijat_1_21c_cultures]    Script Date: 27.5.2025 20.18.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dbo].[v_f_tab_jatkuva_oppiminen_amm_uudet_opiskelijat_1_21c_cultures] AS

SELECT --top 1000
	apusarake_lkm = f.lkm

  --FI
	,tilastovuosi_fi = f.tilv
	,ikaryhma_fi = d1.ika
	,ika_25_64_vuotta_fi = d2.kylla_ei
	,sukupuoli_fi = d3.sukupuoli
	,paaasiallinen_toiminta_fi = d8.paaasiallinen_toiminta_versio2
	,sosioekonominen_asema_fi = d9.sosioekonominen_asema_ryhma
	,koulutusnimike_fi = f.koulknimi
	,koulutusaste_taso_2_fi = d12.Koulutusaste_taso2 
    ,koulutusala_taso_1_fi = d13.iscfibroad2013
	,tavoite_koulutuksessa_fi = d15.tutkinnon_tavoite
	,tyovoimakoulutus_fi = d16.kylla_ei
	,korkein_aiempi_tutkinto_fi = 
		case 
			when f.kaste_t2_tr = '78' then 'Yliopistojen jatkokoulutus (lääkärien erikoistumiskoulutus, lisensiaatintutkinto tai tohtorintutkinto)' 
			else d30.Koulutusaste_taso2 
		end
	,[aiempi_tutkinto_fi] = d31.kylla_ei

  --KOODIT
	,koodit_paaasiallinen_toiminta = d8.paaasiallinen_toiminta_versio2_koodi
	,koodit_sosioekonominen_asema = d9.sosioekonominen_asema_koodi
	,koodit_koulutusaste_taso_2 = d12.Koulutusaste_taso2_koodi
	,koodit_koulutusala_taso_1 = d13.iscfibroad2013_koodi
	,koodit_koulutusnimike = f.koulk

  --JARJESTYS
  	,jarjestys_ikaryhma = coalesce(nullif(f.ikar8, '-1'), '99')
	,jarjestys_ika_25_64_vuotta = d2.jarjestys
	,jarjestys_sukupuoli = d3.jarjestys
	,jarjestys_paaasiallinen_toiminta = d8.jarjestys
	,jarjestys_sosioekonominen_asema = d9.jarjestys_ryhma
	,jarjestys_koulutusaste_taso_2 = d12.jarjestys_Koulutusaste_taso2
    ,jarjestys_koulutusala_taso_1 = d13.jarjestys_iscfibroad2013
	,jarjestys_tavoite_koulutuksessa = d15.jarjestys
	,jarjestys_tyovoimakoulutus = d16.jarjestys
	,jarjestys_korkein_aiempi_tutkinto = coalesce(kaste_t2_tr, '99')
	,jarjestys_aiempi_tutkinto = d31.jarjestys

FROM dbo.f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat f
LEFT JOIN dbo.d_ika d1 on d1.id = f.ikar8_id
LEFT JOIN dbo.d_kylla_ei d2 on d2.id = f.ika_25_64_vuotta_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id = f.sp_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_versio2 d8 on d8.id = f.ptoim1r6e_id --r6 <-> r2 pl. varusmies- & siviilipalvelus
LEFT JOIN dbo.d_sosioekonominen_asema d9 on d9.id = f.sosee_id
LEFT JOIN dbo.d_koulutusluokitus d12 on d12.id = f.kaste_t2_3_id
LEFT JOIN dbo.d_koulutusluokitus d13 on d13.id = f.iscfibroad2013_id
LEFT JOIN dbo.d_tutkinnon_tavoite d15 on d15.id = f.tavoite_id
LEFT JOIN dbo.d_kylla_ei d16 on d16.id = f.tyov_id
LEFT JOIN dbo.d_koulutusluokitus d30 on d30.id = f.kaste_t2_tr_id
LEFT JOIN dbo.d_kylla_ei d31 on d31.id = f.aiktutk_id

GO
