USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_jatkuva_oppiminen_uudet_opiskelijat_1_21_1_22_cultures]    Script Date: 21.10.2022 19:56:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dbo].[v_f_tab_otv_korkeakoulut_syntypera_2_8f_2_9d] AS

SELECT --top 1000

	[Tilastovuosi] = f.tilv
	,[Aloitusvuosi] = f.alvv
	
  --APU
	,apusarake_uopisk = case when f.aineisto = '2.8f' and f.alvv = f.tilv and d12.Koulutusaste_taso2_koodi in ('62','63','71','72') /*aineistossa ei opoikv*/ then f.lkm else 0 end
	,apusarake_opisk = case when f.aineisto = '2.8f' then f.lkm else 0 end
	,apusarake_tutk = case when f.aineisto = '2.9d' then f.lkm else 0 end
	,apusarake_aineisto = f.aineisto
	,apusarake_lahde = f.lahde
	,apusarake_sektori = f.sektori
	,apusarake_syntypera = f.syntyp2

  --FI
	,Koulutussektori = d1.koulutussektori
	,Ikäryhmä = d2.ika
	,Sukupuoli = d3.sukupuoli
	,Syntyperä = d4.syntypera
	,Kansalaisuus = d5.kansalaisuus_versio1
	,[Opetushallinnon koulutus] = d6.opetushallinnon_koulutus
	,[Rahoituslähde] = case when d7.rahoituslahde_koodi = '1' then 'Perusrahoitus sekä ESR- ja TE-rahoitus (ESR ja TE vain amk-koulutus)' else d7.rahoituslahde end
	,[Koulutusaste, taso 1] = d12.iscle2011
	,[Koulutusaste, taso 2] = d12.Koulutusaste_taso2
    ,[Koulutusala, taso 1] = d13.iscfibroad2013
	,[Koulutusala, taso 2] = d13.iscfinarrow2013
	,[Koulutusala, taso 3] = d13.iscfi2013
	,Aloituslukukausi = d14.lukukausiselite

  --SV
  --EN

  --KOODIT
	,[Koodit Koulutusaste, taso 1] = d12.iscle2011_koodi
	,[Koodit Koulutusaste, taso 2] = d12.Koulutusaste_taso2_koodi
	,[Koodit Koulutusala, taso 1] = d13.iscfi2013_koodi
	,[Koodit Koulutusala, taso 2] = d13.iscfinarrow2013_koodi
	,[Koodit Koulutusala, taso 3] = d13.iscfibroad2013_koodi
	
  --JARJESTYS
    ,jarjestys_koulutussektori = d1.jarjestys
  	,jarjestys_ikaryhma = d2.jarjestys_ika5v
	,jarjestys_sukupuoli = d3.jarjestys
	,jarjestys_syntypera = d4.jarjestys
	,jarjestys_kansalaisuus = d5.jarjestys
	,jarjestys_opetushallinnon_koulutus = d6.jarjestys
	,jarjestys_rahoituslahde = d7.jarjestys
	,jarjestys_koulutusaste_taso_1 = d12.jarjestys_iscle2011
	,jarjestys_koulutusaste_taso_2 = d12.jarjestys_Koulutusaste_taso2
    ,jarjestys_koulutusala_taso_1 = d13.jarjestys_iscfibroad2013
	,jarjestys_koulutusala_taso_2 = d13.jarjestys_iscfinarrow2013
	,jarjestys_koulutusala_taso_3 = d13.jarjestys_iscfi2013
	,jarjestys_aloituslukukausi = cast(10 + d14.lukukausi as varchar)

FROM [VipunenTK].[dbo].[f_2_8f_2_9d_korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan] f

LEFT JOIN dbo.d_koulutussektori d1 on d1.id = f.sektori_id
LEFT JOIN dbo.d_ika d2 on d2.id = f.ikar7_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id = f.sp_id
LEFT JOIN dbo.d_syntypera d4 on d4.id = f.syntyp2_id
LEFT JOIN dbo.d_kansalaisuus_versio1 d5 on d5.id = f.kansalr1_id
LEFT JOIN dbo.d_opetushallinnon_koulutus d6 on d6.id = f.ophal_id
LEFT JOIN dbo.d_rahoituslahde d7 on d7.id = f.rahlahde_v2_id --koodi 1 <-> 1,2,3
LEFT JOIN dbo.d_koulutusluokitus d12 on d12.id = f.kaste_t2_id
LEFT JOIN dbo.d_koulutusluokitus d13 on d13.id = f.iscfi2013_id
LEFT JOIN dbo.d_kausi d14 on d14.kausi_id = f.allk_id

GO

