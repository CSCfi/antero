USE [VipunenTK]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








--exec antero.[dbo].[tarkista_kaannokset2] 'v_f_tab_jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet_1_23_cultures'

CREATE OR ALTER VIEW [dbo].[v_f_tab_jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet_1_23_cultures] AS

SELECT

	--fi
	tilastovuosi_fi = f.[tilv]
    ,ikaryhma_fi = d1.ika
    ,sukupuoli_fi = d2.sukupuoli
    ,asuinkunnan_kuntaryhma_fi = d3.kuntaryhma
    ,koulutustaso_fi = 
		case f.kaste_t0 
			when '1' then 'Perusaste tai ei perusasteen jälkeistä koulutusta' 
			when '2' then 'Toinen aste'
			when '3' then 'Korkea-aste'
			else 'Tuntematon' 
		end
    ,sosioekonominen_asema_fi = d5.sosioekonominen_asema_ryhma
    ,paaasiallinen_toiminta_fi = d6.paaasiallinen_toiminta_versio9
    ,palkansaaja_fi = case d7.kylla_ei when 'Kyllä' then 'Palkansaaja' when 'Ei' then 'Ei palkansaaja' else 'Tuntematon' end

	--sv
	,tilastovuosi_sv = f.[tilv]
    ,ikaryhma_sv = d1.ika_sv
    ,sukupuoli_sv = d2.sukupuoli_sv
    ,asuinkunnan_kuntaryhma_sv = d3.kuntaryhma_sv
    ,koulutustaso_sv = 
		case f.kaste_t0 
			when '1' then 'Grundnivå eller ingen examen efter den grundläggande utbildningen' 
			when '2' then 'Andra stadiet'
			when '3' then 'Högre nivå'
			else 'Okänd' 
		end
    ,sosioekonominen_asema_sv = d5.sosioekonominen_asema_ryhma_sv
    ,paaasiallinen_toiminta_sv = d6.paaasiallinen_toiminta_versio9_sv
    ,palkansaaja_sv = case d7.kylla_ei when 'Kyllä' then 'Löntagare' when 'Ei' then 'Ej löntagare' else 'Okänd' end

	--en
	,tilastovuosi_en = f.[tilv]
    ,ikaryhma_en = d1.ika_en
    ,sukupuoli_en = d2.sukupuoli_en
    ,asuinkunnan_kuntaryhma_en = d3.kuntaryhma_en
    ,koulutustaso_en = 
		case f.kaste_t0 
			when '1' then 'Basic education or no degree after basic education' 
			when '2' then 'Upper secondary education'
			when '3' then 'Tertiary education'
			else 'Unknown' 
		end
    ,sosioekonominen_asema_en = d5.sosioekonominen_asema_ryhma_en
    ,paaasiallinen_toiminta_en = d6.paaasiallinen_toiminta_versio9_en
    ,palkansaaja_en = case d7.kylla_ei when 'Kyllä' then 'Employee' when 'Ei' then 'Not employee' else 'Unknown' end

	--jarjestys
    ,jarjestys_ikaryhma = d1.jarjestys_ika
    ,jarjestys_sukupuoli = d2.jarjestys
    ,jarjestys_asuinkunnan_kuntaryhma = d3.jarjestys
	,jarjestys_koulutustaso = coalesce(f.kaste_t0, '9')
    ,jarjestys_sosioekonominen_asema = d5.jarjestys_ryhma
    ,jarjestys_paaasiallinen_toiminta = d6.jarjestys
	,jarjestys_palkansaaja = d7.jarjestys

	--1/2
    ,apusarake_tutk = [tutk]
    ,apusarake_eitutk = [eitutk]
    ,apusarake_ammko = [ammko]
    ,apusarake_heko = [heko]
    ,apusarake_muuko = [muuko]

	--lkm
    ,apusarake_painoaku = [painoaku]

FROM [VipunenTK].[dbo].[f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet] f

LEFT JOIN VipunenTK.dbo.d_ika d1 on d1.id = d_ikar6_id
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.id = d_sp_id
LEFT JOIN VipunenTK.dbo.d_kuntaryhma d3 on d3.id = d_tilvaskunryh_id
--LEFT JOIN VipunenTK.dbo.d_koulutustaso d4 on d4.id = d_kaste_t0_id
LEFT JOIN VipunenTK.dbo.d_sosioekonominen_asema d5 on d5.id = d_soseh_id
LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_versio9 d6 on d6.id = d_ptoim1r9h_id
LEFT JOIN VipunenTK.dbo.d_kylla_ei d7 on d7.id = d_psaajah_id

GO
