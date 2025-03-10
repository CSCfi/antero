USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_avoin_yliopisto]    Script Date: 10.3.2025 9.47.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_avoin_yliopisto] as

select
	*
from (

	--Suorittaneet oppilaat
	select 

		[Tilastovuosi] = vuosi
		,[Sukupuoli] = d1.sukupuoli_fi
		,[Yliopisto] = d6.organisaatio_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi 
		,[Koulutusala (1995)] = d3.selite_fi
		,[Tutkinto-opiskelija] = d4.kytkin_fi
		
		--ruotsi

		,[Statistikår] = vuosi
		,[Kön] = d1.sukupuoli_sv
		,[Universitet] = d6.organisaatio_sv
		,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
		,[Utbildningsområde (1995)] = d3.selite_sv
		,[Examensstuderande] = d4.kytkin_sv
		--englanti

		,[Statistical year] = vuosi
		,[Gender] = d1.sukupuoli_en
		,[University] = d6.organisaatio_en
		,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
		,[Field of education (1995)] = d3.selite_en
		,[University degree student] = d4.kytkin_en

		--mittarit
		,f.suorittaneiden_lkm
		,'0' as Opiskelijamaara_brutto
		,'0' as suoritetut_lkm
		,'0' as tarjotut_lkm
		,'0' as y_opiston_jarjestama_koul_tutk_opisk
		,'0' as y_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as muu_jarjestama_koul_tutk_opisk
		,'0' as muu_jarjestama_koul_ei_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_ei_tutk_opisk

		--koodit
		,[Koodit Yliopisto] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi
		,[Koodit Ohjauksenala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala 1995] = d3.koodi
		,[Jarjestys_koulutusalakoodi] = d3.jarjestys_koodi
		,[Jarjestys_Ohjauksenala] = d2.jarjestys_ohjauksenala_koodi

	from [dw].[f_yo_avoimen_yliopiston_kautta_opiskelevat] f
	join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
	join dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id
	join [dw].[d_ohjauksenala] d2 on d2.id = '-1'
	join [ANTERO].[dw].[d_koulutusala_1995] d3 on d3.id = '-1'
	join dw.d_kytkin d4 on d4.id = f.d_asianomainen_id

	Union all

	--Bruttomäärä opiskelijoista
	select 

		vuosi
		,d1.sukupuoli_fi as sukupuoli
		,d6.organisaatio_fi as yliopisto
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi 
		,[Koulutusala (1995)] = d3.selite_fi
		,NULL

		--ruotsi

		,[Statistikår] = vuosi
		,[Kön] = d1.sukupuoli_sv
		,[Universitet] = d6.organisaatio_sv
		,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
		,[Utbildningsområde (1995)] = d3.selite_sv
		,NULL

		--englanti

		,[Statistical year] = vuosi
		,[Gender] = d1.sukupuoli_en
		,[University] = d6.organisaatio_en
		,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
		,[Field of education (1995)] = d3.selite_en
		,NULL

		--mittarit
		,'0' as suorittaneiden_lkm
		,sum (
		[itse_jarj_tutkopiskelijoille]
		+[itse_jarj_ei_tutkopiskelijoille]
		+[kans_ja_tyovaen_tutkopiskelijoille]
		+[kans_ja_tyovaen_ei_tutkopiskelijoille]
		+[kans_opiston_tutkopiskelijoille]
		+[kans_opiston_ei_tutkopiskelijoille]
		+[kesäyliop_tutkopiskelijoille]
		+[kesäyliop_ei_tutkopiskelijoille]
		+[muut_jarj_tutkopiskelijoille]
		+[muut_jarj_ei_tutkopiskelijoille]) as Opiskelijamäärä_Brutto
		,'0' as Suoritetut_lkm
		,'0' as Tarjotut_lkm 
		,sum([itse_jarj_tutkopiskelijoille]) as y_opiston_jarjestama_koul_tutk_opisk
		,sum([itse_jarj_ei_tutkopiskelijoille]) as y_opiston_jarjestama_koul_ei_tutk_opisk
		,sum([kans_opiston_tutkopiskelijoille]) as k_opiston_jarjestama_koul_tutk_opisk
		,sum([kans_opiston_ei_tutkopiskelijoille]) as k_opiston_jarjestama_koul_ei_tutk_opisk
		,sum([kesäyliop_tutkopiskelijoille]) as ky_opiston_jarjestama_koul_tutk_opisk
		,sum([kesäyliop_ei_tutkopiskelijoille]) as ky_opiston_jarjestama_koul_ei_tutk_opisk
		,sum([muut_jarj_tutkopiskelijoille]) as muu_jarjestama_koul_tutk_opisk
		,sum([muut_jarj_ei_tutkopiskelijoille]) as muu_jarjestama_koul_ei_tutk_opisk
		,sum([kans_ja_tyovaen_tutkopiskelijoille]) as kt_opiston_jarjestama_koul_tutk_opisk
		,sum([kans_ja_tyovaen_ei_tutkopiskelijoille]) as kt_opiston_jarjestama_koul_ei_tutk_opisk
	   
		--Koodit
		,[Koodit Yliopisto] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi
		,[Koodit Ohjauksenala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusalakoodi] = d3.koodi
		,[Jarjestys_koulutusala 1995] = d3.jarjestys_koodi
		,[Jarjestys_Ohjauksenala] = d2.jarjestys_ohjauksenala_koodi

	from [ANTERO].[sa].[sa_suorat_hist_yo6a_avoin_yliopisto_opetus] f2
	join antero.dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=f2.yliopisto_tunnus
	join antero.dw.d_sukupuoli d1 on d1.id='-1'
	join [dw].[d_ohjauksenala] d2 on d2.id = '-1'
	join [ANTERO].[dw].[d_koulutusala_1995] d3 on d3.koodi = f2.koulutusalakoodi
	group by vuosi,
			d1.sukupuoli_fi,
			d1.sukupuoli_sv,
			d1.sukupuoli_en,
			d6.organisaatio_fi,
			d6.organisaatio_sv,
			d6.organisaatio_en,
			d6.organisaatio_koodi,
			d1.sukupuoli_koodi,
			d2.ohjauksenala_koodi,
			d2.ohjauksenala_nimi_fi, 
			d2.ohjauksenala_nimi_sv,
			d2.ohjauksenala_nimi_en,
			d3.selite_fi,
			d3.selite_sv,
			d3.selite_en,
			d3.koodi, 
			d3.jarjestys_koodi,
			d2.jarjestys_ohjauksenala_koodi

	Union ALL

	--Suoritettujen opintopisteiden lkm
	select  
		vuosi
		,d1.sukupuoli_fi as sukupuoli
		,d6.organisaatio_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi 
		,[Koulutusala (1995)] = d4.selite_fi
		,NULL

		--ruotsi

		,[Statistikår] = vuosi
		,[Kön] = d1.sukupuoli_sv
		,[Universitet] = d6.organisaatio_sv
		,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
		,[Utbildningsområde (1995)] = d4.selite_sv
		,NULL

		--englanti

		,[Statistical year] = vuosi
		,[Gender] = d1.sukupuoli_en
		,[University] = d6.organisaatio_en
		,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
		,[Field of education (1995)] = d4.selite_en
		,NULL

		--mittarit
		,'0' as suorittaneiden_lkm
		,'0' as Opiskelijamäärä_Brutto
		, sum ([avoinop_lkm]
				--[avoinop_amk_lkm]  HUOM!! Mikäli halutaan hienojakoisempaa dataa, niin sen saa näistä
				--+[avoinop_yliop_lkm]
				--+[avoinop_kesa_lkm]
				--+[avoinop_kansan_lkm]
				--+[avoinop_kansal_lkm]+[avoinop_muut_lkm]
				) as Suoritetut_lkm
		,'0' as Tarjotut_lkm
		,'0' as y_opiston_jarjestama_koul_tutk_opisk
		,'0' as y_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as muu_jarjestama_koul_tutk_opisk
		,'0' as muu_jarjestama_koul_ei_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_ei_tutk_opisk
	   
		--koodit
		,[Koodit Yliopisto] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi
		,[Koodit Ohjauksenala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala 1995] = d4.koodi
		,[Jarjestys_koulutusalakoodi] = d4.jarjestys_koodi
		,[Jarjestys_Ohjauksenala] = d2.jarjestys_ohjauksenala_koodi

	from [ANTERO].dw.f_yo_opintopisteet f3 
	join antero.dw.d_organisaatioluokitus d6 on d6.id=f3.d_yo_id
	join antero.dw.d_sukupuoli d1 on d1.id='-1'
	join [dw].[d_ohjauksenala] d2 on d2.id = f3.d_ohjauksenala_id         
	join dw.d_opintoala95 d3 on d3.id=f3.d_opintoala95_id                 ---Tämä on hieman 
	join dw.d_koulutusala_1995 d4 on d3.opintoala95_koodi = d4.koodi      ---kummallinen ratkaisu, "There has got to be a better way!"
	where vuosi > 2009
	group by vuosi,
			d1.sukupuoli_fi,
			d1.sukupuoli_sv,
			d1.sukupuoli_en,
			d6.organisaatio_fi,
			d6.organisaatio_sv,
			d6.organisaatio_en,
			d6.organisaatio_koodi,
			d1.sukupuoli_koodi,
			d2.ohjauksenala_nimi_fi,
			d2.ohjauksenala_nimi_sv,
			d2.ohjauksenala_nimi_en,
			d2.ohjauksenala_koodi, 
			d4.selite_fi,
			d4.selite_sv,
			d4.selite_en,
			d4.koodi, 
			d4.jarjestys_koodi,
			d2.jarjestys_ohjauksenala_koodi

	UNION ALL

	--Tarjottujen opintopisteiden määrä
	select		 
		vuosi
		,d1.sukupuoli_fi as sukupuoli
		,d6.organisaatio_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi 
		,[Koulutusala (1995)] = d3.selite_fi
		,NULL

		--ruotsi

		,[Statistikår] = vuosi
		,[Kön] = d1.sukupuoli_sv
		,[Universitet] = d6.organisaatio_sv
		,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
		,[Utbildningsområde (1995)] = d3.selite_sv
		,NULL

		--englanti

		,[Statistical year] = vuosi
		,[Gender] = d1.sukupuoli_en
		,[University] = d6.organisaatio_en
		,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
		,[Field of education (1995)] = d3.selite_en
		,NULL

		--mittarit
		,'0' as suorittaneiden_lkm
		,'0' as Opiskelijamäärä_Brutto
		,'0' as Suoritetut_lkm
		,sum(tarjotut_pisteet_lkm) as Tarjotut_lkm
		,'0' as y_opiston_jarjestama_koul_tutk_opisk
		,'0' as y_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_tutk_opisk
		,'0' as k_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_tutk_opisk
		,'0' as ky_opiston_jarjestama_koul_ei_tutk_opisk
		,'0' as muu_jarjestama_koul_tutk_opisk
		,'0' as muu_jarjestama_koul_ei_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_tutk_opisk
		,'0' as kt_opiston_jarjestama_koul_ei_tutk_opisk

		--Koodit
		,[Koodit Yliopisto] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi 
		,[Koodit Ohjauksenala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala 1995] = d3.koodi 
		,[Jarjestys_koulutusalakoodi] = d3.jarjestys_koodi
		,[Jarjestys_Ohjauksenala] = d2.jarjestys_ohjauksenala_koodi

	from [ANTERO].[sa].[sa_suorat_hist_yo6a_avoin_yliopisto_opetus] f4
	join antero.dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=f4.yliopisto_tunnus
	join antero.dw.d_sukupuoli d1 on d1.id='-1'
	join [dw].[d_ohjauksenala] d2 on d2.id = '-1'
	join [ANTERO].[dw].[d_koulutusala_1995] d3 on d3.koodi = f4.koulutusalakoodi
	group by vuosi,
			d1.sukupuoli_fi,
			d1.sukupuoli_sv,
			d1.sukupuoli_en,
			d6.organisaatio_fi,
			d6.organisaatio_sv,
			d6.organisaatio_en,
			d6.organisaatio_koodi,
			d1.sukupuoli_koodi,
			d2.ohjauksenala_nimi_fi, 
			d2.ohjauksenala_nimi_sv,
			d2.ohjauksenala_nimi_en,
			d2.ohjauksenala_koodi,
			d3.selite_fi,
			d3.selite_sv,
			d3.selite_en,
			d3.koodi, 
			d3.jarjestys_koodi,
			d2.jarjestys_ohjauksenala_koodi

) q

-- Edellisen vuoden data julkaistaan vasta 3.3
where cast((cast((Tilastovuosi + 1) as varchar(4)) + '-03-03') as date) <= convert(date, getdate())  

GO

USE [ANTERO]