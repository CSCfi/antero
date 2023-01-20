USE [VipunenTK]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER VIEW [dbo].[v_f_tab_vaeston_koulutusrakenne_syntyperan_mukaan] AS

SELECT 
	[Tilastovuosi] = f.tilv
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d2.aidinkieli_versio1
	,[Ikä] = d3.ika
	,[Asuinmaakunta] = d4.maakunta
	,[Kansalaisuus] = d5.kansalaisuus_versio2
	,[Syntyperä] = d6.syntypera
	,[Tutk. suor.maakunta] = d7.maakunta
	,[Koulutusala, taso 1] = d8.iscfibroad2013
	,[Koulutusala, taso 2] = d8.iscfinarrow2013
	,[Koulutusala, taso 3] = d8.iscfi2013
	,[Koulutusaste, taso 1] = d9.iscle2011
	,[Koulutusaste, taso 2] = d9.Koulutusaste_taso2
	,[Amm. koul. koulutusmuoto] = d10.koulutusmuoto
	,[Oppisopimuskoulutus] = d11.oppisopimuskoulutus
	,[Amm. koul. koulutuslaji] = d12.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	,[Sis. oppisopimusjaksoja] = d13.kylla_ei
	,[Sis. koulutussopimusjaksoja] = d14.kylla_ei

	,f.lkm

	--koodit
	,[Koodit Asuinmaakunta] = d4.maakunta_koodi
	,[Koodit Tutk. suor.maakunta] = d7.maakunta_koodi
	,[Koodit Koulutusala, taso 1] = d8.iscfibroad2013_koodi
	,[Koodit Koulutusala, taso 2] = d8.iscfinarrow2013_koodi
	,[Koodit Koulutusala, taso 3] = d8.iscfi2013_koodi
	,[Koodit Koulutusaste, taso 1] = d9.iscle2011_koodi
	,[Koodit Koulutusaste, taso 2] = d9.Koulutusaste_taso2_koodi

	--jarjestykset
	,d1.jarjestys as jarjestys_sukupuoli
	,d2.jarjestys as jarjestys_aidinkieli
	,d3.jarjestys_ika as jarjestys_ika
	,d4.jarjestys_maakunta as jarjestys_asuinmaakunta
	,d5.jarjestys as jarjestys_kansalaisuus
	,d6.jarjestys as jarjestys_syntypera
	,d7.jarjestys_maakunta as jarjestys_tutk_suor_maakunta
	,d8.jarjestys_iscfibroad2013
	,d8.jarjestys_iscfinarrow2013
	,d8.jarjestys_iscfi2013
	,d9.jarjestys_iscle2011 as jarjestys_iscle --väärä nimi kuutiossa
	,d9.jarjestys_Koulutusaste_taso2
	,d10.jarjestys as jarjestys_amm_koul_koulutusmuoto
	,d11.jarjestys as jarjestys_oppisopimuskoulutus
	,d12.jarjestys as jarjestys_amm_koul_koulutuslaji
	,d13.jarjestys as jarjestys_sis_oppisopimusjaksoja
	,d14.jarjestys as jarjestys_sis_koulutussopimusjaksoja

FROM dbo.f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan f

LEFT JOIN dbo.d_sukupuoli AS d1 ON d1.id = f.sp_id
LEFT JOIN dbo.d_aidinkieli_versio1 AS d2 ON d2.id = f.aikielir1_id
LEFT JOIN dbo.d_ika AS d3 ON d3.id = f.ikar8_id
LEFT JOIN dbo.d_alueluokitus AS d4 ON d4.id = f.tilvasmaak_id
LEFT JOIN dbo.d_kansalaisuus_versio2 AS d5 ON d5.id = f.kansalr2_id
LEFT JOIN dbo.d_syntypera AS d6 ON d6.id = f.syntyp2_id
LEFT JOIN dbo.d_alueluokitus AS d7 ON d7.id = f.suormaak_id
LEFT JOIN dbo.d_koulutusluokitus AS d8 ON d8.id = f.iscfi2013_id
LEFT JOIN dbo.d_koulutusluokitus AS d9 ON d9.id = f.kaste_t2_id
LEFT JOIN dbo.d_koulutusmuoto AS d10 ON d10.id = f.kouljat_id
LEFT JOIN dbo.d_oppisopimuskoulutus AS d11 ON d11.id = f.oppis_id
LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa AS d12 ON d12.id = f.tutklaja_tr_id
LEFT JOIN dbo.d_kylla_ei AS d13 ON d13.id = f.opso_id
LEFT JOIN dbo.d_kylla_ei AS d14 ON d14.id = f.koso_id

GO
