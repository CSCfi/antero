USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_amm_opiskelijavuodet_2023]    Script Date: 16.1.2025 18.30.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_koski_amm_opiskelijavuodet_2023] AS

--Lisätty hylkäämisperusteiden samanaikaisten uudet koodit 10-12 (toistaiseksi 10 sisällytettynä koodiin 2 kuten jo ennen lisäyksiä). JS 16.1.2025
--Poiminta toistettu lomalaskennalla ilman 28 pv rajausta ja heinäkuuta. Vuoden 2024 poiminnassa status tarkistettava. JS 16.1.2025

SELECT
	[Opiskelijavuosi] = sum(opiskelijavuodet) + SUM(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste.koodi in ('2','3','4','10','11','12') then opiskelijavuodet_hylatyt else 0 end)
	,[Osa-aikaisuus] = d_kytkin_osa_aikaisuus.kytkin_fi
	,[Kuukausi] = d_kalenteri.kuukausi
	,[Kustannusryhmä] = d_kustannusryhma.selite_fi
	,[Rahoitusmuoto] = d_opintojenrahoitus.selite_fi
	,[Suorituksen tyyppi] = d_suorituksen_tyyppi.selite_fi
	,[Tutkintotyypin ryhmä] = case when d_kustannusryhma.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyypin_ryhma_fi,'Tieto puuttuu'),d4.tutkintotyypin_ryhma_fi) end
	,[Tutkintotyyppi] = case when d_kustannusryhma.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyyppi_fi,'Tieto puuttuu'),d4.tutkintotyyppi_fi) end
	,[Tutkinto] = d4.koulutusluokitus_fi
	,[Muu_ammatillinen_tarkenne] = muu_ammatillinen_tarkenne
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	,[Oppisopimuskoulutus] = d_kytkin_oppisopimuskoulutus.kytkin_fi
	,[Erityisopetus] = d_erityisopetus.erityisopetus_nimi_fi
	,[Majoitus] = d_majoitus.majoitus_nimi_fi
	,[Vankilaopetus] = d_kytkin_vankilaopetus.kytkin_fi
	,[Henkilöstokoulutus] = d_kytkin_henkilostokoulutus.kytkin_fi
	,[Työvoimakoulutus] = d_kytkin_tyovoimakoulutus.kytkin_fi
	,[Oppilaitos] = d_organisaatioluokitus_oppilaitos.organisaatio_fi
	,[Koulutuksen järjestäjä] = d_organisaatioluokitus_jarj.organisaatio_fi
	,[Koulutuksen järjestäjä ed] = 
		case
			when d_kalenteri.paivays < coalesce(d2b.voimaan_alkaen,'1900-01-01') then d2b.nimi_ennen_fuusiota
			when d_kalenteri.paivays >= coalesce(d2a.voimaan_alkaen,'9999-12-31') then d2a.nimi_amos_spl
			else d_organisaatioluokitus_jarj.organisaatio_fi
		end
	,[Koodit Koulutuksen järjestäjä] = d_organisaatioluokitus_jarj.organisaatio_koodi
	,[Koodit Koulutuksen järjestäjä ed] = 
		case
			when d_kalenteri.paivays < coalesce(d2b.voimaan_alkaen,'1900-01-01') then d2b.ytunnus_avain
			when d_kalenteri.paivays >= coalesce(d2a.voimaan_alkaen,'9999-12-31') then d2a.ytunnus_amos_spl
			else d_organisaatioluokitus_jarj.organisaatio_koodi
		end
	,[Koodit Oppilaitos] = d_organisaatioluokitus_oppilaitos.organisaatio_koodi

FROM dw.f_amos_opiskelijavuodet f 
LEFT JOIN dw.d_sukupuoli AS d_sukupuoli ON d_sukupuoli_id = d_sukupuoli.id 
LEFT JOIN dw.d_kieli AS d_kieli ON d_kieli_aidinkieli_id = d_kieli.id 
LEFT JOIN dw.d_ika AS d_ika ON d_ika_id = d_ika.id 
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_koulutusluokitus d4b ON d4b.id = f.d_koulutusluokitus_tutk_osaa_pienempi_id
LEFT JOIN dw.d_organisaatioluokitus AS d_organisaatioluokitus_oppilaitos ON d_organisaatioluokitus_oppilaitos_id = d_organisaatioluokitus_oppilaitos.id 
LEFT JOIN dw.d_kytkin AS d_kytkin_oppisopimuskoulutus ON d_kytkin_oppisopimuskoulutus_id = d_kytkin_oppisopimuskoulutus.id 
LEFT JOIN dw.d_kytkin AS d_kytkin_vankilaopetus ON d_kytkin_vankilaopetus_id = d_kytkin_vankilaopetus.id 
LEFT JOIN dw.d_kytkin AS d_kytkin_henkilostokoulutus ON d_kytkin_henkilostokoulutus_id = d_kytkin_henkilostokoulutus.id 
LEFT JOIN dw.d_kytkin AS d_kytkin_tyovoimakoulutus ON d_kytkin_tyovoimakoulutus_id = d_kytkin_tyovoimakoulutus.id 
LEFT JOIN dw.d_alueluokitus AS d_alueluokitus_oppilaitos ON d_organisaatioluokitus_oppilaitos.kunta_koodi = d_alueluokitus_oppilaitos.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus AS d_organisaatioluokitus_jarj ON d_organisaatioluokitus_jarj_id = d_organisaatioluokitus_jarj.id 
LEFT JOIN dw.d_alueluokitus AS d_alueluokitus_jarj ON d_organisaatioluokitus_jarj.kunta_koodi = d_alueluokitus_jarj.kunta_koodi 
LEFT JOIN dw.d_erityisopetus AS d_erityisopetus ON d_erityisopetus_id = d_erityisopetus.id 
LEFT JOIN dw.d_kalenteri AS d_kalenteri ON d_kalenteri_id = d_kalenteri.id 
LEFT JOIN dw.d_majoitus AS d_majoitus ON d_majoitus_id = d_majoitus.id 
LEFT JOIN dw.d_kytkin AS d_kytkin_osa_aikaisuus ON d_osa_aikaisuus_id = d_kytkin_osa_aikaisuus.id 
LEFT JOIN dw.d_suorituksen_tyyppi AS d_suorituksen_tyyppi ON d_suorituksen_tyyppi_id = d_suorituksen_tyyppi.id 
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma AS d_kustannusryhma ON d_kustannusryhma_id = d_kustannusryhma.id 
LEFT JOIN dw.d_opintojenrahoitus AS d_opintojenrahoitus ON d_opintojenrahoitus_id = d_opintojenrahoitus.id 
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste AS d_amos_spl_opiskelijavuodet_hylkaamisperuste ON d_amos_spl_opiskelijavuodet_hylkaamisperuste.id = f.d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
--
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id = f.d_organisaatioluokitus_jarj_hist_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2a ON d2a.oid_avain = d_organisaatioluokitus_jarj.organisaatio_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2b ON d2b.oid_avain = d1.organisaatio_oid

WHERE d_kalenteri.vuosi=2023

GROUP BY d_kytkin_osa_aikaisuus.kytkin_fi
	,d_kalenteri.kuukausi
	,d_kustannusryhma.selite_fi
	,d_opintojenrahoitus.selite_fi
	,d_suorituksen_tyyppi.selite_fi
	,d4.koulutusluokitus_fi 
	,(case when d_kustannusryhma.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyypin_ryhma_fi,'Tieto puuttuu'),d4.tutkintotyypin_ryhma_fi) end)
	,(case when d_kustannusryhma.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyyppi_fi,'Tieto puuttuu'),d4.tutkintotyyppi_fi) end)
	,d4.koulutusalataso1_fi
	,d4.koulutusalataso2_fi
	,d4.koulutusalataso3_fi
	,d4.koulutusluokitus_koodi
	,muu_ammatillinen_tarkenne
	,d_kytkin_oppisopimuskoulutus.kytkin_fi
	,d_erityisopetus.erityisopetus_nimi_fi
	,d_majoitus.majoitus_nimi_fi
	,d_kytkin_vankilaopetus.kytkin_fi
	,d_kytkin_henkilostokoulutus.kytkin_fi
	,d_kytkin_tyovoimakoulutus.kytkin_fi
	,d_organisaatioluokitus_oppilaitos.organisaatio_fi
	,d_organisaatioluokitus_jarj.organisaatio_fi
	,d_organisaatioluokitus_jarj.organisaatio_koodi
	,d_organisaatioluokitus_oppilaitos.organisaatio_koodi
	,(case
			when d_kalenteri.paivays < coalesce(d2b.voimaan_alkaen,'1900-01-01') then d2b.nimi_ennen_fuusiota
			when d_kalenteri.paivays >= coalesce(d2a.voimaan_alkaen,'9999-12-31') then d2a.nimi_amos_spl
			else d_organisaatioluokitus_jarj.organisaatio_fi
	 end)
	,(case
			when d_kalenteri.paivays < coalesce(d2b.voimaan_alkaen,'1900-01-01') then d2b.ytunnus_avain
			when d_kalenteri.paivays >= coalesce(d2a.voimaan_alkaen,'9999-12-31') then d2a.ytunnus_amos_spl
			else d_organisaatioluokitus_jarj.organisaatio_koodi
	 end)

HAVING sum(opiskelijavuodet) + SUM(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste.koodi in ('2','3','4','10','11','12') then opiskelijavuodet_hylatyt else 0 end) > 0.0

GO
