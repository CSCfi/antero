USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijavuodet] AS

SELECT
	[Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi 
	,[Tutkintotyypin ryhmä] = case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' else coalesce(nullif(d4b.tutkintotyypin_ryhma_fi,'Tieto puuttuu'),d4.tutkintotyypin_ryhma_fi) end
    ,[Tutkintotyyppi] = case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' when d4.koulutusluokitus_fi like '%VALMA%' then 'VALMA' when d4.koulutusluokitus_fi like '%TELMA%' then 'TELMA' when d4.koulutusluokitus_koodi = '999908' then 'TUVA' else coalesce(nullif(d4b.tutkintotyyppi_fi,'Tieto puuttuu'),d4.tutkintotyyppi_fi) end
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Suorituskieli] = d32.kieli_fi
	,[Kustannusryhmä] = d18.selite_fi 
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
	,case when d18.koodi = 'muu' then '90' when d4.koulutusluokitus_fi like '%VALMA%' then 91 when d4.koulutusluokitus_fi like '%TELMA%' then 92 when d4.koulutusluokitus_koodi = '999908' /*TUVA*/ then 93 else coalesce(nullif(d4b.jarjestys_tutkintotyyppi_koodi,'99999'),d4.jarjestys_tutkintotyyppi_koodi) end AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys
	,jarj_painotuksen_tyyppi = d31.jarjestys
	,jarj_suorituskieli = case when d32.kieli_koodi = '-2' then 'ööö' else left(d32.kieli_koodi, 3) end
	,jarj_suorituskieli_luvanmukainen = ca.lv_suorituskieli_koodi
	,jarjestys_toimipisteen_maakunta = d35.jarjestys_maakunta_koodi

FROM dw.f_amos_opiskelijavuodet_painotetut_unpivot f 
LEFT JOIN dw.d_sukupuoli d1 ON d1.id = f.d_sukupuoli_id
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
AND tilastovuosi < 2026 --julkaistaan 2026 tiedoista vain uuden rahoitusmallin mukaisia tietoja

GO
