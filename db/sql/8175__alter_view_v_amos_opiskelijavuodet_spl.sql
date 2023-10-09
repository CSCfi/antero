USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_opiskelijavuodet_spl]    Script Date: 9.10.2023 10:26:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijavuodet_spl] AS

SELECT        
	 
	 [Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi

	,[Tutkintotyypin ryhmä] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
			WHEN d4.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
			WHEN [opiskelijavuodet_painotettu_muu] > 0 OR f.d_koulutusluokitus_id = '-1' THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyypin_ryhma_fi
		END  
   
	,[Tutkintotyyppi] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
			WHEN d4.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
			WHEN [opiskelijavuodet_painotettu_muu] > 0 OR f.d_koulutusluokitus_id = '-1' THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyyppi_fi
		END
	
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Kustannusryhmä] = d18.selite_fi 
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_nimi_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6.kytkin_fi 
			when 'Kyllä' then 'Oppisopimuskoulutus' 
			when 'Ei' then 'Ei oppisopimuskoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_fi 
			when 'Kyllä' then 'Vankilaopetus' 
			when 'Ei' then 'Ei vankilaopetus' 
			else 'Tieto puuttuu' 
		end
	,[Henkilöstokoulutus] =	
		case d8.kytkin_fi 
			when 'Kyllä' then 'Henkilöstökoulutus' 
			when 'Ei' then 'Ei henkilöstökoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Työvoimakoulutus] = 
		case d9.kytkin_fi 
			when 'Kyllä' then 'Työvoimakoulutus' 
			when 'Ei' then 'Ei työvoimakoulutus' 
			else 'Tieto puuttuu' 
		end

	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen järjestäjä] = coalesce(d31.toiminimi, d11.nimi_amos_spl)
	,[Toimipiste] = d21.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Koul. järjestäjän kunta] = d12.kunta_fi 
	,[Koul. järjestäjän maakunta] = d12.maakunta_fi 
	,[Koul. järjestäjän ELY] = d12.ely_fi 
	,[Koul. järjestäjän AVI] = d12.avi_fi  
	,[rahoitusmuoto_maksetaan] = d19.sisaltyy_okm_perusrahoitus
	,[luvallinen_koulutus] = d23.hyvaksytaan

	,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_yhteensa]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
    ,[opiskelijavuodet_painotettu_majoitus]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_hylatyt]

	--Koodit
	,[Koodit Koulutuksen järjestäjä] = d11.ytunnus_amos_spl
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20.koodi

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
	,CASE 
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	END AS jarj_tutkintotyypin_ryhma
	,CASE 
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyyppi_koodi
	END AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys

	--tulleet myöhemmin mukaan
	,[Hankintakoulutus] = d26.kytkin_fi
	,[Oppivelvollisuus] = 
		case d30.kytkin_koodi
			when 1 then 'Maksuttoman koulutuksen korotus'
			when 0 then 'Ei maksuttoman koulutuksen korotusta'
			else ''
		end
	,[Hankintakoulutuksen järjestäjä] = d27.organisaatio_fi
	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton majoitus] = d24.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi
	,[sisaopp_ylittyy] = d28.jarjestys_kytkin_koodi
	,[erityistuki_ylittyy] = d29.jarjestys_kytkin_koodi
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
	,[opiskelijavuodet_painotettu_majoitus_hyv] 
	,[opiskelijavuodet_painotettu_oppivelvollisuus]
	,[Koodit Hankintakoulutuksen järjestäjä] = d27.organisaatio_koodi 
	,[Koodit Kustannusryhmä]  = d18.koodi
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys
	--
	,[Luvanmukainen suorituskieli] = ca.lv_suorituskieli
	,jarj_suorituskieli_luvanmukainen = ca.lv_suorituskieli_koodi

FROM  dw.f_amos_opiskelijavuodet_painotetut f 
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kytkin d6 ON d6.id = f.d_kytkin_oppisopimuskoulutus_id
LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
--LEFT JOIN dw.d_organisaatioluokitus d11b ON d11b.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d11 ON d11.id = f.d_amos_spl_jarjestaja_linkki_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = COALESCE(d11.kunta_koodi,-1)
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
LEFT JOIN dw.d_kytkin d28 ON d28.id = f.d_kytkin_sisaopp_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d29 ON d29.id = f.d_kytkin_erityistuen_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d30 ON d30.id = f.d_kytkin_oppivelvollisuus_id
LEFT JOIN dw.d_ytj_yritystiedot d31 ON d31.ytunnus = d11.ytunnus_amos_spl
LEFT JOIN dw.d_kieli d33 ON d33.id = f.d_kieli_suoritus_luvanmukainen_id
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
AND (opiskelijavuodet_painottamaton > 0.0000 OR opiskelijavuodet_hylatyt > 0.0)
AND d11.sisaltyy_amos_spl = 1
AND tilastovuosi = right(db_name(), 4) --antero_ppkkvvvv

GO
