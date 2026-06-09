USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi] AS

SELECT 
	--uudet
	[Toteuma/Estimaatti] = case when generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi] = right(f.rahoituskausi, 4) + 1
	,[Rahoituskausi] = f.[rahoituskausi]
	,Tilastokausi = f.suorituskausi
	,[Järjestäjärakenne] = case when d27.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,[Koulutuksen alkamisvuosi] = d6b.vuosi
	,[Koulutuksen alkamiskuukausi] = d6b.kuukausi_fi
	,jarj_koulutuksen_alkamiskuukausi = d6b.kuukausi
	,[Perusopetuksen suoritusvuosi] = f.perusopetuksen_suoritusvuosi
	,[Perusopetuksen keskiarvoluokka] = d29.selite2_fi
	,[jarj_perusopetuksen_keskiarvoluokka] = d29.jarj_keskiarvo2
	,d27.[Toiminnanohjauksen kokeilu]
	,d27.[jarjestys Toiminnanohjauksen kokeilu]
	,d27.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,d27.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Tutkintotyyppi (rahoitus)] = 
		case
			when d2.tutkintotyyppi_koodi = '02'	or (d2.tutkintotyyppi_koodi in ('19','20') and d5.tyovoimakoulutus = 1) then 'Pt, työvoimak. at, työvoimak. eat'
			when d2.tutkintotyyppi_koodi in ('19','20') then 'At (pl. työvoimak.), eat (pl. työvoimak.)'
		end
	,[jarjestys Tutkintotyyppi (rahoitus)] = 
		case
			when d2.tutkintotyyppi_koodi = '02'	or (d2.tutkintotyyppi_koodi in ('19','20') and d5.tyovoimakoulutus = 1) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when d2.tutkintotyyppi_koodi in ('19','20') then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
		end
	,[Ikä (maksuttomuusraja)] = case when left(d13.ikaryhma3_fi,2) in ('14','15') or d13.ika_fi = '20' then '20 tai alle' else '21 tai yli' end
	,[Ikä 20/alle/yli] = case when left(d13.ikaryhma3_fi,2) in ('14','15') then '19 tai alle' when d13.ika_fi = '20' then '20' else '21 tai yli' end
	,[Maksuttomuus (rahoitus)] = case when d28.kytkin_fi = 'Kyllä' then 'Maksuton (rahoitus)' else 'Ei maksuton (rahoitus)' end
	,d5.sisaltyy_okm_suoritusrahoitus --koontinäkymää varten

	,[enimmaismaaran_mukaiset_opv_ka]
    ,[osaamispisteet_kerroin]
	--

	,[Tilastovuosi] = f.[tilastovuosi]
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
	,[Työvoimakoulutus] = case d5.tyovoimakoulutus when 1 then 'Työvoimakoulutus' when 0 then 'Ei työvoimakoulutus' else 'Tieto puuttuu' end
	,[Oppisopimuskoulutus] = d4.selite_fi
	,[Erityisopetus] = d3.erityisopetus_nimi_fi
	,[Suorituksen tyyppi] = d8.selite_fi
	,[Osaamisala] = d18.selite_fi
	,[Hankintakoulutus] = d14.kytkin_fi
	,[Suorituskieli] = d16.kieli_fi
	,[Vankilaopetus] = case d30.kytkin_koodi when 1 then 'Vankilaopetus' when 0 then 'Ei vankilaopetus' else 'Tieto puuttuu' end

	,[Hankintakoulutuksen järjestäjä] = d15.organisaatio_fi
	,[Hankintakoulutuksen oppilaitos] = d15b.organisaatio_fi

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
	,[Luvanmukainen suorituskieli] = case when d17.kieli_koodi = '-2' then 'Luvaton, ei hyväksytty suorituskieli' else 'Ei luvaton, hyväksytty suorituskieli' end

	,[Koodit Koulutuksen järjestäjä] =	coalesce(d27.ytunnus_amos_spl,d27.ytunnus_avain)
	,[Koodit Hankintakoulutuksen järjestäjä] = d15.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi
	,[Koodit Osaamisala] = d18.koodi
	
	--apusarakkeet
    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
    ,[painottamaton_osaamispisteet]
    ,[painotettu_tutkinnot]

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
	,[jarj Oppisopimuskoulutus] = d4.jarjestys
	,[jarj Erityisopetus] = d3.jarjestys_erityisopetus_koodi
	,[jarj Suorituksen tyyppi] = d8.jarjestys
	,[jarj Suorituskieli] = case when d16.kieli_koodi = '-2' then 'ööö' else left(d16.kieli_koodi, 3) end
	,[jarj Suorituskieli luvanmukainen] = case when d17.kieli_koodi = '-2' then 2 else 1 end

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

FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi  f
LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_erityisopetus d3 on d3.id = f.d_erityisopetus_id
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id
LEFT JOIN dw.d_kalenteri d6b on d6b.id = f.d_kalenteri_alkamispaiva_id
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.id = f.d_suorituksen_tyyppi_id
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
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d27 ON d27.oid_avain = d1a.organisaatio_oid 
LEFT JOIN dw.d_kytkin d28 on d28.id = f.d_maksuttomuus_id
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d29 on d29.id = f.d_opintojen_kulku_keskiarvot_keskiarvoluokka_id
LEFT JOIN dw.d_kytkin d30 on d30.id = f.d_kytkin_vankilaopetus_id

GO


