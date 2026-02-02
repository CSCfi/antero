USE [ANTERO]
GO

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
	,[Osaamisala] = d18.selite_fi
	,[Hankintakoulutus] = d14.kytkin_fi
	,[Suorituskieli] = d16.kieli_fi

	,[Hankintakoulutuksen järjestäjä] = d15.organisaatio_fi
	,[Hankintakoulutuksen oppilaitos] = d15b.organisaatio_fi

	--,[Koulutuksen järjestäjä] = d1a.organisaatio_fi
	,[Koulutuksen järjestäjä] =	d27.nimi_amos_spl				     
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
	,[Luvaton koulutus totuusarvo] = case d23.koodi when 1 then 0 when 23 then 0 else 1 end
	,[Luvaton korotustekijä] = d25.selite_fi
	,[Luvanmukainen suorituskieli] = case when d17.kieli_koodi = '-2' and f.tilastovuosi > 2020 then 'Luvaton, ei hyväksytty suorituskieli' else 'Ei luvaton, hyväksytty suorituskieli' end

	,[Koodit Koulutuksen järjestäjä] =	coalesce(d27.ytunnus_amos_spl,d27.ytunnus_avain)
	,[Koodit Hankintakoulutuksen järjestäjä] = d15.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi
	,[Koodit Osaamisala] = d18.koodi

	,[Hyväksytään laskentaan] = case when f.laskentaan_hyvaksyttava=1 and d23.hyvaksytaan=1 then 'Kyllä' else 'Ei' end
	,[Tutkintopisteen tyyppi] = d26.selite_fi
	
	--apusarakkeet
	,[painottamaton_tutkinnot_ja_osaamispisteet] = [painottamaton_tutkinnot_ja_osaamispisteet]
	,[painottamaton_tutkinnot_ja_osaamispisteet_hylatty] = case when f.laskentaan_hyvaksyttava=0 then [painottamaton_tutkinnot_ja_osaamispisteet] end
	,[painotettu_tutkinnot_ja_osaamispisteet] = case when f.laskentaan_hyvaksyttava=1 and d23.hyvaksytaan=1 then [painotettu_tutkinnot_ja_osaamispisteet] end

	--,[rahoitusmuoto_maksetaan] = d5.sisaltyy_okm_suoritusrahoitus
	--,[hyvaksytaan_rahoitukseen] = case when d23.koodi=1 then 1 else 0 end

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
	,[jarj Suorituskieli] = case when d16.kieli_koodi = '-2' then 'ööö' else left(d16.kieli_koodi, 3) end
	,[jarj Suorituskieli luvanmukainen] = case when d17.kieli_koodi = '-2' then 'ööö' else left(d17.kieli_koodi, 3) end

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

	,jarj_painotuksen_tyyppi = d26.jarjestys

FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot  f
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
LEFT JOIN dw.d_organisaatioluokitus d15b on d15b.id = f.d_organisaatioluokitus_oppilaitos_pihvi_id
LEFT JOIN dw.d_kieli d16 on d16.id = f.d_kieli_suoritus_id
LEFT JOIN dw.d_kieli d17 on d17.id = f.d_kieli_suoritus_luvanmukainen_id
LEFT JOIN dw.d_osaamisala d18 on d18.id = f.d_osaamisala_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 on d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 on d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_amos_painotuksen_tyyppi d26 on d26.id = f.d_amos_painotuksen_tyyppi_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d27 ON d27.oid_avain = d1a.organisaatio_oid

WHERE d6.vuosi < 2026 --GETDATE()

GO
