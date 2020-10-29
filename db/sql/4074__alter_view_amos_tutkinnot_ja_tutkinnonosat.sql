USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 29.10.2020 16:17:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat] AS

SELECT 
	 [Tilastovuosi] = f.[tilastovuosi]
	,[Tilastokuukausi] = d6.kuukausi_fi

	,[Sukupuoli] = d11.sukupuoli_fi
	,[Äidinkieli] = d12.kieliryhma1_fi
	,[Ikäryhmä] = d13.ikaryhma3_fi
	,[Ikä] = d13.ika_fi

	,[Tutkinto] = d2.koulutusluokitus_fi
	,[Koulutusala, taso 1] = d2.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d2.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d2.koulutusalataso3_fi
	,[Tutkintotyyppi] = d2.tutkintotyyppi_fi
	
	,[Rahoitusmuoto] = d5.selite_fi
	,[Kustannusryhmä] = d7.selite_fi
	,[Oppisopimuskoulutus] = d4.selite_fi
	,[Erityisopetus] = d3.erityisopetus_nimi_fi
	,[Suorituksen tyyppi] = d8.selite_fi
	,[Hankintakoulutus] = d14.kytkin_fi

	,[Hankintakoulutuksen järjestäjä] = d15.organisaatio_fi

	,[Koulutuksen järjestäjä] = d1a.organisaatio_fi
	,[Koulutuksen järjestäjän AVI] = d10a.avi_fi
	,[Koulutuksen järjestäjän ELY] = d10a.ely_fi
	,[Koulutuksen järjestäjän maakunta] = d10a.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d10a.kunta_fi
	,[Oppilaitos] = d1b.organisaatio_fi
	,[Oppilaitoksen AVI] = d10b.avi_fi
	,[Oppilaitoksen ELY] = d10b.ely_fi
	,[Oppilaitoksen maakunta] = d10b.maakunta_fi
	,[Oppilaitoksen kunta] = d10b.kunta_fi
	,[Toimipiste] = d1c.organisaatio_fi
	,[Toimipisteen AVI] = d10c.avi_fi
	,[Toimipisteen ELY] = d10c.ely_fi
	,[Toimipisteen maakunta] = d10c.maakunta_fi
	,[Toimipisteen kunta] = d10c.kunta_fi

	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi

	,[Koodit Koulutuksen järjestäjä] = d1a.organisaatio_koodi
	,[Koodit Hankintakoulutuksen järjestäjä] = d15.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi

    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
	,[painottamaton_osaamispisteet]

	,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]

	--leikkuri (120 osaamispistettä varainhoitovuoden tavoitteellista opiskelijavuotta kohti)
	,[leikkauskerroin] = 
		CASE 
			WHEN os_pisteet_summa.osaamispisteet_sum > 120.0 * sa1.tavoitteelliset_opiskelijavuodet THEN (120.0 * sa1.tavoitteelliset_opiskelijavuodet) / os_pisteet_summa.osaamispisteet_sum
			ELSE 1.0
		END
	,[tavoitteelliset_opv] = sa1.tavoitteelliset_opiskelijavuodet
	,[rahoitusmuoto_maksetaan] = d5.sisaltyy_okm_suoritusrahoitus
	,[hyvaksytaan_rahoitukseen] = case when d23.koodi=1 /*and d25.koodi=1*/ then 1 else 0 end

	--järjestykset
	,[jarj Tilastokuukausi] = d6.kuukausi
	,[jarj Sukupuoli] = d11.jarjestys_sukupuoli_koodi
	,[jarj Äidinkieli] = d12.jarjestys_kieliryhma1
	,[jarj Ikäryhmä] = d13.jarjestys_ikaryhma3
	,[jarj Ikä] = d13.jarjestys_ika
	,[jarj Koulutusala, taso 1] = d2.jarjestys_koulutusalataso1_koodi
	,[jarj Koulutusala, taso 2] = d2.jarjestys_koulutusalataso2_koodi
	,[jarj Koulutusala, taso 3] = d2.jarjestys_koulutusalataso3_koodi
	,[jarj Tutkintotyyppi] = d2.jarjestys_tutkintotyyppi_koodi
	
	,[jarj Rahoitusmuoto] = d5.jarjestys_koodi
	,[jarj Kustannusryhmä] = d7.jarjestys_koodi
	,[jarj Oppisopimuskoulutus] = d4.jarjestys
	,[jarj Erityisopetus] = d3.jarjestys_erityisopetus_koodi
	,[jarj Suorituksen tyyppi] = d8.jarjestys

	,[jarj Koulutuksen järjestäjän AVI] = d10a.jarjestys_avi_koodi
	,[jarj Koulutuksen järjestäjän ELY] = d10a.jarjestys_ely_koodi
	,[jarj Koulutuksen järjestäjän maakunta] = d10a.jarjestys_maakunta_koodi

	,[jarj Oppilaitoksen AVI] = d10b.jarjestys_avi_koodi
	,[jarj Oppilaitoksen ELY] = d10b.jarjestys_ely_koodi
	,[jarj Oppilaitoksen maakunta] = d10b.jarjestys_maakunta_koodi

	,[jarj Toimipisteen AVI] = d10c.jarjestys_avi_koodi
	,[jarj Toimipisteen ELY] = d10c.jarjestys_ely_koodi
	,[jarj Toimipisteen maakunta] = d10c.jarjestys_maakunta_koodi

	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys

FROM  dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut  f

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_erityisopetus d3 on d3.id = f.d_erityisopetus_id
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d9 on d9.id = f.d_amos_spl_jarjestaja_linkki_id	
LEFT JOIN dw.d_alueluokitus d10a on d10a.alueluokitus_avain = 'kunta_'+d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d10b on d10b.alueluokitus_avain = 'kunta_'+d1b.kunta_koodi
LEFT JOIN dw.d_alueluokitus d10c on d10c.alueluokitus_avain = 'kunta_'+d1c.kunta_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d12 on d12.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d13 on d13.id = f.d_ika_id
LEFT JOIN dw.d_kytkin d14 on d14.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_organisaatioluokitus d15 on d15.id = f.d_organisaatioluokitus_jarjestaja_pihvi_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
--tavoitteelliset opiskelijavuodet (fuusiot huomioiden)
LEFT JOIN (
	SELECT
		ytunnus = coalesce(d.ytunnus_amos_spl, sa.ytunnus)
		,vuosi
		,tavoitteelliset_opiskelijavuodet = SUM(tavoitteelliset_opiskelijavuodet)
	FROM sa.sa_amos_tavoitteelliset_opiskelijavuodet sa
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = sa.ytunnus 
	GROUP BY coalesce(d.ytunnus_amos_spl, sa.ytunnus),vuosi
) sa1 on sa1.ytunnus = d1a.organisaatio_koodi and sa1.vuosi = f.tilastovuosi
--tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien luvallisten osaamispisteiden summa per järjestäjä per vuosi
LEFT JOIN (
	SELECT 
		f.tilastovuosi
		,organisaatio_koodi = d1.ytunnus_amos_spl
		,osaamispisteet_sum = sum(f.painottamaton_osaamispisteet)
	FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
	JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
	JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
	JOIN dw.d_amos_luvaton_koulutus d3 on d3.id = f.d_amos_luvaton_koulutus_id
	WHERE d2.sisaltyy_okm_suoritusrahoitus = 1 and d3.koodi = 1
	GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
) os_pisteet_summa on os_pisteet_summa.organisaatio_koodi = d9.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi



