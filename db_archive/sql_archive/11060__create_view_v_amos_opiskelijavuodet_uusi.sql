USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_opiskelijavuodet_uusi]    Script Date: 15.8.2025 9.46.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_opiskelijavuodet_uusi] AS 

SELECT
  --lisätyt
	[Toteuma/Estimaatti] = case when f.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Rahoituskausi] = f.rahoituskausi
	,[Suorituskausi] = d14.rahoituskausi_amm
	,[Suoritepäätös (viimeisin)] = case when d34.sisaltyy_amos_spl = 1 then 'Kyllä' else 'Ei' end

	,[Äidinkieli (ryhmä)] = d2.kieliryhma1_fi
	,[jarj_aidinkieli_ryhma] = d2.jarjestys_kieliryhma1

	,[Vaativa erityinen tuki] =
		case 
			when d13.erityisopetus_koodi in ('4','5','6') then ' Tutkintokoulutus'
			when d13.erityisopetus_koodi in ('7','8','9') and d4.koulutusluokitus_koodi in ('999901','999908') then ' TUVA/VALMA'
			when d13.erityisopetus_koodi in ('7','8','9') and d4.koulutusluokitus_koodi = '999903' then 'TELMA'
			else ' Ei vaativaa erityistä tukea'
		end

	,[Toisen asteen pohjakoulutus (2018-)] = d0.selite_fi
	,[jarj_toisen_asteen_pohjakoulutus_2018] = d0.jarjestys	
	,[Toisen asteen tutkinto (2018-)] = d0b.selite_fi
	,[jarj_toisen_asteen_tutkinto_2018] = d0b.jarjestys	
	,[Maksuttomuus] = case when maksuttomuus = 1 then 'Maksuton' else 'Ei maksuton' end
	,[Maksuttomuus (simulointi)] = case when maksuttomuus_simulointi = 1 then 'Maksuton (simulointi)' else 'Ei maksuton (simulointi)' end
	,[Maksuttomuus (KOSKI)] = case when maksuttomuus_koski = 1 then 'Maksuton (KOSKI)' else 'Ei maksuton (KOSKI)' end
	,[Ikä (maksuttomuusraja)] = case when left(d3.ikaryhma3_fi,2) in ('14','15') or d3.ika_fi = '20' then '20 tai alle' else '21 tai yli' end
	,[Ikä 20/alle/yli] = case when left(d3.ikaryhma3_fi,2) in ('14','15') then '19 tai alle' when d3.ika_fi = '20' then '20' else '21 tai yli' end
	
	,[Koulutuksen alkamisvuosi] = d14b.vuosi
	,[Koulutuksen alkamiskuukausi] = d14b.kuukausi_fi
	,[jarj_koulutuksen_alkamiskuukausi] = d14b.kuukausi

	,[Perusop. suoritusvuosi (Keskiarvoluokka)] = perusopetuksen_suoritusvuosi
	,[Lähde (Keskiarvoluokka)] = coalesce(f.keskiarvo_lahde, 'Tieto puuttuu')
	,[Keskiarvoluokka] = d36.selite_fi
	,[Keskiarvoluokka 2] = d36.selite2_fi
	,[Yksilöllistäminen (Keskiarvoluokka)] = case yksilollistaminen when 1 then 'Alueittain' when 2 then 'Kokonaan' when 3 then 'Osittain' when 4 then 'Ei' else 'Tieto puuttuu' end
	,[jarj_keskiarvoluokka] = d36.jarj_keskiarvo
	,[jarj_keskiarvoluokka_2] = d36.jarj_keskiarvo2
	,[jarj_yksilollistaminen] = coalesce(yksilollistaminen, 9)

	,[Tutkintotyyppi rahoitus] = 
		case
			when coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) = '02'
				or (coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) in ('19','20') and d9.kytkin_koodi = 1) then 'Pt, työvoimak. at, työvoimak. eat'
			when coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) in ('19','20') and d9.kytkin_koodi = 0 then 'At (pl. työvoimak.), eat (pl. työvoimak.)'
			when d18.koodi = 'muu' then 'Muu amm. koulutus'
			when d4.koulutusluokitus_koodi in ('999901','999903','999908') then 'Valmentava koulutus'
		end
	,[jarjestys Tutkintotyyppi rahoitus] = 
		case
			when coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) = '02'
				or (coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) in ('19','20') and d9.kytkin_koodi = 1) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when coalesce(nullif(d4b.tutkintotyyppi_koodi,'-1'), d4.tutkintotyyppi_koodi) in ('19','20') and d9.kytkin_koodi = 0 then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
			when d18.koodi = 'muu' then 3 --'Muu amm. koulutus'
			when d4.koulutusluokitus_koodi in ('999901','999903','999908') then 4 --'Valmentava koulutus'
		end

	,d34.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,d34.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	
	,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä] = coalesce(opv_som_max, -1)
	,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = coalesce(opv_vet_max, -1)
	,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = coalesce(opv_ei_maksuton_max, -1)
	
	,opv_ei_maksuton_kerroin
  --

	,[Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi 
	,[Tutkintotyypin ryhmä] = case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyypin_ryhma_fi,'Tieto puuttuu'),d4.tutkintotyypin_ryhma_fi) end
    ,[Tutkintotyyppi] = case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' when d4.koulutusluokitus_koodi='999901' then 'VALMA' when d4.koulutusluokitus_koodi='999903' then 'TELMA' when d4.koulutusluokitus_koodi = '999908' then 'TUVA' else coalesce(nullif(d4b.tutkintotyyppi_fi,'Tieto puuttuu'),d4.tutkintotyyppi_fi) end
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Suorituskieli] = d32.kieli_fi
	,[Kustannusryhmä] = case when d18.koodi = 'muu' then concat(d18.selite_fi, case when d9.kytkin_koodi = 1 then ' (työvoimak.)' else ' (pl. työvoimak.)' end) else d18.selite_fi end
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_nimi_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6.kytkin_koodi
			when 1 then 'Oppisopimuskoulutus' 
			when 0 then 'Ei oppisopimuskoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_koodi
			when 1 then 'Vankilaopetus' 
			when 0 then 'Ei vankilaopetus' 
			else 'Tieto puuttuu' 
		end
	,[Henkilöstokoulutus] =	
		case d8.kytkin_koodi
			when 1 then 'Henkilöstökoulutus' 
			when 0 then 'Ei henkilöstökoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Työvoimakoulutus] = 
		case d9.kytkin_koodi
			when 1 then 'Työvoimakoulutus' 
			when 0 then 'Ei työvoimakoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Hankintakoulutus] = d26.kytkin_fi
	,[Oppivelvollisuus] = 
		case d30.kytkin_koodi
			when 1 then 'Maksuttoman koulutuksen korotus'
			when 0 then 'Ei maksuttoman koulutuksen korotusta'
			else ''
		end

	,[Hankintakoulutuksen järjestäjä] = d27.organisaatio_fi
	,[Oppilaitos] = d5.organisaatio_fi
	--,[Koulutuksen järjestäjä] = d11.organisaatio_fi
	,[Koulutuksen järjestäjä] = d34.nimi_amos_spl
	,[Toimipiste] = d21.organisaatio_fi
	,[Toimipisteen kunta] = d35.kunta_fi
	,[Toimipisteen maakunta] = d35.maakunta_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Koul. järjestäjän kunta] = d12.kunta_fi 
	,[Koul. järjestäjän maakunta] = d12.maakunta_fi 
	,[Koul. järjestäjän ELY] = d12.ely_fi 
	,[Koul. järjestäjän AVI] = d12.avi_fi 
	,[Hankintakoulutuksen järjestäjän kunta] = d27b.kunta_fi

	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton koulutus totuusarvo] = case d23.koodi when 1 then 0 else 1 end
	,[Luvaton majoitus] = d24.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi
	,[Luvanmukainen suorituskieli] = ca.lv_suorituskieli
	,d19.sisaltyy_okm_perusrahoitus

	,[sisaopp_ylittyy] = d28.jarjestys_kytkin_koodi
	,[erityistuki_ylittyy] = d29.jarjestys_kytkin_koodi

	,[Opiskelijavuoden tyyppi] = d31.selite_fi
	,painottamaton = cast(painottamaton as decimal (20,10))
	,painotettu = cast(painotettu as decimal (20,10))
	,hylatty = cast(hylatty as decimal (20,10))

	--Koodit
	,[Koodit Tilastokuukausi] = d14.kuukausi
	,[Koodit Koulutuksen järjestäjä] = coalesce(d34.ytunnus_amos_spl,d34.ytunnus_avain)
	,[Koodit Koulutuksen järjestäjän kunta] = d12.kunta_koodi
	,[Koodit Hankintakoulutuksen järjestäjä] = d27.organisaatio_koodi 
	,[Koodit Hankintakoulutuksen järjestäjän kunta] = d27b.kunta_koodi
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,[Koodit Oppilaitoksen kunta] = d10.kunta_koodi
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20.koodi
	,[Koodit Kustannusryhmä] = d18.koodi
	,[Koodit Oppisopimuskoulutus] = d6.kytkin_koodi
	,[Koodit Vankilaopetus] = d7.kytkin_koodi
	,[Koodit Henkilöstokoulutus] =	d8.kytkin_koodi
	,[Koodit Työvoimakoulutus] = d9.kytkin_koodi		
	,[Koodit Hankintakoulutus] = d26.kytkin_koodi
	,[Koodit Oppivelvollisuus] = d30.kytkin_koodi
	,[Koodit Osa-aikaisuus] = d16.kytkin_koodi

	--Järjestykset
	,d18.jarjestys_koodi AS jarj_kustannusryhma
	,d19.jarjestys_koodi AS jarj_rahoitusmuoto
	,d14.kuukausi AS jarj_tilastokuukausi
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d3.ika_avain AS jarj_ika 					  
	,d4.jarjestys_koulutusalataso1_koodi AS jarj_koulutusala_taso1
	,d4.jarjestys_koulutusalataso2_koodi AS jarj_koulutusala_taso2
	,d4.jarjestys_koulutusalataso3_koodi AS jarj_koulutusala_taso3
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi
	,d13.jarjestys_erityisopetus_koodi AS jarj_erityisopetus
	,case when d18.koodi = 'muu' then '90' else coalesce(nullif(d4b.jarjestys_tutkintotyypin_ryhma_koodi,'99999'),d4.jarjestys_tutkintotyypin_ryhma_koodi) end AS jarj_tutkintotyypin_ryhma
	,case when d18.koodi = 'muu' then '90' when d4.koulutusluokitus_koodi='999901' then 91 when d4.koulutusluokitus_koodi='999903' then 92 when d4.koulutusluokitus_koodi='999908' then 93 else coalesce(nullif(d4b.jarjestys_tutkintotyyppi_koodi,'99999'),d4.jarjestys_tutkintotyyppi_koodi) end AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys
	,jarj_painotuksen_tyyppi = d31.jarjestys
	,jarj_suorituskieli = case when d32.kieli_koodi = '-2' then 'ööö' else left(d32.kieli_koodi, 3) end
	,jarj_suorituskieli_luvanmukainen = ca.lv_suorituskieli_koodi
	,jarjestys_toimipisteen_maakunta = d35.jarjestys_maakunta_koodi
	
FROM dw.f_amos_opiskelijavuodet_painotetut_unpivot_uusi f 
LEFT JOIN dw.d_amos_pohjakoulutus d0 ON d0.id = f.d_amos_pohjakoulutus_toisen_asteen_pohjakoulutus_2018_id
LEFT JOIN dw.d_amos_pohjakoulutus d0b ON d0b.id = f.d_amos_pohjakoulutus_toisen_asteen_tutkinto_2018_id
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_koulutusluokitus d4b ON d4b.id = f.d_koulutusluokitus_tutk_osaa_pienempi_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kytkin d6 ON d6.id = f.d_kytkin_oppisopimuskoulutus_id
LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13 ON d13.id = f.d_erityisopetus_id
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_tilastokuukausi_id
LEFT JOIN dw.d_kalenteri d14b ON d14b.id = f.d_kalenteri_alkamispaiva_id
LEFT JOIN dw.d_majoitus d15 ON d15.id = f.d_majoitus_id
LEFT JOIN dw.d_kytkin d16 ON d16.id = f.d_osa_aikaisuus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d18 ON d18.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_opintojenrahoitus d19 ON d19.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_osaamisala d20 ON d20.id = f.d_osaamisala_id 
LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d22 ON d22.id = f.d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_majoitus d24 ON d24.id = f.d_amos_luvaton_majoitus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_kytkin d26 ON d26.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_organisaatioluokitus d27 ON d27.id = f.d_organisaatioluokitus_jarj_pihvi_id
LEFT JOIN dw.d_alueluokitus d27b ON d27b.kunta_koodi = d27.kunta_koodi
LEFT JOIN dw.d_kytkin d28 ON d28.id = f.d_kytkin_sisaopp_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d29 ON d29.id = f.d_kytkin_erityistuen_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d30 ON d30.id = f.d_kytkin_oppivelvollisuus_id
LEFT JOIN dw.d_amos_painotuksen_tyyppi d31 ON d31.id = f.d_amos_painotuksen_tyyppi_id
LEFT JOIN dw.d_kieli d32 ON d32.id = f.d_kieli_suoritus_id
LEFT JOIN dw.d_kieli d33 ON d33.id = f.d_kieli_suoritus_luvanmukainen_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d34 ON d34.oid_avain = d11.organisaatio_oid
LEFT JOIN dw.d_alueluokitus d35 ON d35.kunta_koodi = d21.kunta_koodi 
LEFT JOIN dw.d_opintojen_kulku_keskiarvot d36 ON d36.id = f.d_opintojen_kulku_keskiarvot_keskiarvoluokka_id
CROSS APPLY(
	SELECT
		lv_suorituskieli =
			case	
				when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' 
				when d33.kieli_koodi = '-2' and tilastovuosi > 2020 then 'Ei luvassa mainittu suorituskieli' 
				else 'Luvassa mainittu suorituskieli' 
			end
		,lv_suorituskieli_koodi = 
			case	
				when d18.koodi = 'muu' then 3
				when d33.kieli_koodi = '-2' and tilastovuosi > 2020 then 2
				else 1
			end
) ca

WHERE 1=1 

GO
