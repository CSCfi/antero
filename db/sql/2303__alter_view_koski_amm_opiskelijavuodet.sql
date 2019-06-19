USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_amm_opiskelijavuodet]    Script Date: 19.6.2019 10:03:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dw].[v_koski_amm_opiskelijavuodet] AS

SELECT        

	 [opiskelijavuodet_painottamaton]
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

    ,d_kytkin.kytkin_fi AS [Osa-aikaisuus], d_kytkin.kytkin_sv AS Deltid, d_kytkin.kytkin_en AS [Part Time]
	,f.tilastovuosi AS Tilastovuosi, f.tilastovuosi AS Statistikår, f.tilastovuosi AS [Statistical year]
	,d_kalenteri.kuukausi_fi AS Tilastokuukausi, d_kalenteri.kuukausi_sv AS Statistikmånad, d_kalenteri.kuukausi_en AS [Statistical month], 
    d_kalenteri.kuukausi AS jarj_tilastokuukausi

	,d_kustannusryhma.selite_fi AS Kustannusryhmä
	,d_kustannusryhma.selite_sv AS Bekostnadsgrupp
	,d_kustannusryhma.selite_en AS [Cost group]
	,d_kustannusryhma.jarjestys_koodi AS jarj_kustannusryhma

	,d_opintojenrahoitus.selite_fi AS Rahoitusmuoto
	,d_opintojenrahoitus.jarjestys_koodi AS jarj_rahoitusmuoto

	,d_suorituksen_tyyppi.selite_fi AS [Suorituksen tyyppi]
    ,d_suorituksen_tyyppi.selite_sv AS [Typ av utföranden]
	,d_suorituksen_tyyppi.selite_en AS [Type of accomplishment]

	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
		--WHEN d_koulutusluokitus.koulutusastetaso2_koodi in (33,41) OR d_koulutusluokitus.koulutusluokitus_koodi IN ('354204','487102','477100') THEN 'Ammatti- ja erikoisammattitutkinnot' 
		WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN 'Ammatti- ja erikoisammattitutkinnot' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN 'Muu ammatillinen koulutus'
		ELSE d_koulutusluokitus.tutkintotyyppi_fi
	END) AS [Tutkintotyypin ryhmä]
    ,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Utbildning som inte leder till examen' 
		WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN 'Yrkes- och specialyrkesexamina' 
		ELSE d_koulutusluokitus.tutkintotyyppi_sv 
	END) AS [Kategori av typ av examen]
	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Education not leading to a degree' 
		WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN 'Further and specialist vocational qualifications' 
		ELSE d_koulutusluokitus.tutkintotyyppi_en
	END) AS [Category of qualification type]
	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN '99' 
		WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN '33' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '999900' THEN '91'
		ELSE d_koulutusluokitus.jarjestys_tutkintotyyppi_koodi
	END) AS jarj_tutkintotyypin_ryhma

	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
		--WHEN d_koulutusluokitus.koulutusluokitus_koodi = '354204' THEN 'Ammattitutkinto' 
		--WHEN d_koulutusluokitus.koulutusluokitus_koodi IN ('487102','477100') THEN 'Erikoisammattitutkinto' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN 'Muu ammatillinen koulutus'
		ELSE d_koulutusluokitus.tutkintotyyppi_fi
	END) AS Tutkintotyyppi 
    ,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Utbildning som inte leder till examen' 
		ELSE d_koulutusluokitus.tutkintotyyppi_sv
	END) AS [Typ av examen]
	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Education not leading to a degree' 
		ELSE d_koulutusluokitus.tutkintotyyppi_en 
	END) AS [Qualification type]
	,(CASE 
		WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN '99' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '354204' THEN '33' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '487102' THEN '41' 
		WHEN d_koulutusluokitus.koulutusluokitus_koodi = '999900' THEN '91'
		ELSE d_koulutusluokitus.jarjestys_koulutusastetaso2_koodi 
	END) AS jarj_tutkintotyyppi

	,[Osaamisala] = d20.selite_fi
	,[Koodit Osaamisala] = d20.koodi

	,[Oppilaitos] = d_organisaatioluokitus_oppilaitos.organisaatio_fi
	,[Koulutuksen järjestäjä] = d_organisaatioluokitus_jarj.organisaatio_fi
	,[Toimipiste] = d21.organisaatio_fi

    ,d_koulutusluokitus.koulutusluokitus_fi AS Tutkinto, d_koulutusluokitus.koulutusluokitus_sv AS Examen, d_koulutusluokitus.koulutusluokitus_en AS [Degree/Qualification], 
    d_koulutusluokitus.koulutusluokitus_koodi AS [Koodit Tutkinto], d_koulutusluokitus.koulutusalataso1_fi AS [Koulutusala, taso 1], d_koulutusluokitus.koulutusalataso1_sv AS [Utbildningsområde, nivå 1], 
    d_koulutusluokitus.koulutusalataso1_en AS [Field of education, tier 1], d_koulutusluokitus.jarjestys_koulutusalataso1_koodi AS jarj_koulutusala_taso1, 
    d_koulutusluokitus.koulutusalataso2_fi AS [Koulutusala, taso 2], d_koulutusluokitus.koulutusalataso2_sv AS [Utbildningsområde, nivå 2], d_koulutusluokitus.koulutusalataso2_en AS [Field of education, tier 2], 
    d_koulutusluokitus.jarjestys_koulutusalataso2_koodi AS jarj_koulutusala_taso2, d_koulutusluokitus.koulutusalataso3_fi AS [Koulutusala, taso 3], 
    d_koulutusluokitus.koulutusalataso3_sv AS [Utbildningsområde, nivå 3], d_koulutusluokitus.koulutusalataso3_en AS [Field of education, tier 3], 
    d_koulutusluokitus.jarjestys_koulutusalataso3_koodi AS jarj_koulutusala_taso3, 
	case d_kytkin_oppisopimuskoulutus.kytkin_fi when 'Kyllä' then 'Oppisopimuskoulutus' when 'Ei' then 'Ei oppisopimuskoulutus' else 'Tieto puuttuu' end AS Oppisopimuskoulutus, 
    d_kytkin_oppisopimuskoulutus.kytkin_sv AS Läroavtalsutbildning, d_kytkin_oppisopimuskoulutus.kytkin_en AS [Apprenticeship training], d_erityisopetus.erityisopetus_nimi_fi AS Erityisopetus, 
    d_erityisopetus.erityisopetus_nimi_sv AS Specialundervisning, d_erityisopetus.erityisopetus_nimi_en AS [Special needs education], d_erityisopetus.jarjestys_erityisopetus_koodi AS jarj_erityisopetus, 
    d_majoitus.majoitus_nimi_fi AS Majoitus, d_majoitus.majoitus_nimi_sv AS Inkvartering, d_majoitus.majoitus_nimi_en AS Accommodation, 
	case d_kytkin_vankilaopetus.kytkin_fi when 'Kyllä' then 'Vankilaopetus' when 'Ei' then 'Ei vankilaopetus' else 'Tieto puuttuu' end AS Vankilaopetus, 
    d_kytkin_vankilaopetus.kytkin_sv AS FängELSEundervisning, d_kytkin_vankilaopetus.kytkin_en AS [Prison education], 
	case d_kytkin_henkilostokoulutus.kytkin_fi when 'Kyllä' then 'Henkilöstökoulutus' when 'Ei' then 'Ei henkilöstökoulutus' else 'Tieto puuttuu' end AS Henkilöstokoulutus, 
    d_kytkin_henkilostokoulutus.kytkin_sv AS Personalutbildning, d_kytkin_henkilostokoulutus.kytkin_en AS [Personnel training], 
	case d_kytkin_tyovoimakoulutus.kytkin_fi when 'Kyllä' then 'Työvoimakoulutus' when 'Ei' then 'Ei työvoimakoulutus' else 'Tieto puuttuu' end AS Työvoimakoulutus, 
    d_kytkin_tyovoimakoulutus.kytkin_sv AS Arbetskraftsutbildning, d_kytkin_tyovoimakoulutus.kytkin_en AS [Labour market training]
	
	
    ,d_organisaatioluokitus_oppilaitos.organisaatio_sv AS Läroanstalt, d_organisaatioluokitus_oppilaitos.organisaatio_en AS [Educational institution], d_alueluokitus_oppilaitos.kunta_fi AS [Oppilaitoksen kunta], 
    d_alueluokitus_oppilaitos.kunta_sv AS [Läroanstaltens kommun], d_alueluokitus_oppilaitos.kunta_en AS [Municipality of the institution], d_alueluokitus_oppilaitos.maakunta_fi AS [Oppilaitoksen maakunta], 
    d_alueluokitus_oppilaitos.maakunta_sv AS [Läroanstaltens landskap], d_alueluokitus_oppilaitos.maakunta_en AS [Region of the institution], 
    d_alueluokitus_oppilaitos.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta, d_alueluokitus_oppilaitos.avi_fi AS [Oppilaitoksen AVI], d_alueluokitus_oppilaitos.avi_sv AS [Läroanstaltens RFV-område], 
    d_alueluokitus_oppilaitos.avi_en AS [AVI area of the institution], d_alueluokitus_oppilaitos.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi, d_alueluokitus_oppilaitos.ely_fi AS [Oppilaitoksen ELY], 
    d_alueluokitus_oppilaitos.ely_sv AS [Läroanstaltens NMT-område], d_alueluokitus_oppilaitos.ely_en AS [ELY area of the institution], d_alueluokitus_oppilaitos.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely, d_organisaatioluokitus_jarj.organisaatio_sv AS Utbildningsanordnare, d_organisaatioluokitus_jarj.organisaatio_en AS [Education provider], 
    d_alueluokitus_jarj.kunta_fi AS [Koul. järjestäjän kunta], d_alueluokitus_jarj.kunta_sv AS [Utbildningsanordnarens kommun], d_alueluokitus_jarj.kunta_en AS [Municipality of the education provider], 
    d_alueluokitus_jarj.maakunta_fi AS [Koul. järjestäjän maakunta], d_alueluokitus_jarj.maakunta_sv AS [Utbildningsanordnarens landskap], d_alueluokitus_jarj.maakunta_en AS [Region of the education provider], 
    d_alueluokitus_jarj.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta, d_alueluokitus_jarj.avi_fi AS [Koul. järjestäjän AVI], d_alueluokitus_jarj.avi_sv AS [Utbildningsanordnarens RFV-område], 
    d_alueluokitus_jarj.avi_en AS [AVI area of the education provider], d_alueluokitus_jarj.jarjestys_avi_koodi AS jarj_koul_jarj_avi, d_alueluokitus_jarj.ely_fi AS [Koul. järjestäjän ELY], 
    d_alueluokitus_jarj.ely_sv AS [Utbildningsanordnarens NMT-område], d_alueluokitus_jarj.ely_en AS [ELY area of the education provider], d_alueluokitus_jarj.jarjestys_ely_koodi AS jarj_koul_jarj_ely, 
    d_ika.ika_fi AS Ikä, d_ika.ika_sv AS Ålder, d_ika.ika_en AS Age, d_ika.ikaryhma3_fi AS Ikäryhmä, d_ika.ikaryhma3_sv AS Åldersgrupp, d_ika.ikaryhma3_en AS [Age group], 
    d_ika.jarjestys_ikaryhma3 AS jarj_ikaryhma, d_kieli.kieli_fi AS Äidinkieli, d_kieli.kieli_sv AS Modersmål, d_kieli.kieli_en AS [Mother tongue], d_sukupuoli.sukupuoli_fi AS Sukupuoli, 
    d_sukupuoli.sukupuoli_sv AS Kön, d_sukupuoli.sukupuoli_en AS GENDer, d_sukupuoli.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d_organisaatioluokitus_jarj.organisaatio_koodi AS [Koodit Koulutuksen järjestäjä]
	,d_organisaatioluokitus_oppilaitos.organisaatio_koodi AS [Koodit Oppilaitos]

FROM  dw.f_koski_amm_opiskelijavuodet_painotetut f INNER JOIN
dw.d_sukupuoli AS d_sukupuoli ON d_sukupuoli_id = d_sukupuoli.id INNER JOIN
dw.d_kieli AS d_kieli ON d_kieli_aidinkieli_id = d_kieli.id INNER JOIN
dw.d_ika AS d_ika ON d_ika_id = d_ika.id INNER JOIN
dw.d_koulutusluokitus ON d_koulutusluokitus_id = dw.d_koulutusluokitus.id INNER JOIN
dw.d_organisaatioluokitus AS d_organisaatioluokitus_oppilaitos ON d_organisaatioluokitus_oppilaitos_id = d_organisaatioluokitus_oppilaitos.id INNER JOIN
dw.d_kytkin AS d_kytkin_oppisopimuskoulutus ON d_kytkin_oppisopimuskoulutus_id = d_kytkin_oppisopimuskoulutus.id INNER JOIN
dw.d_kytkin AS d_kytkin_vankilaopetus ON d_kytkin_vankilaopetus_id = d_kytkin_vankilaopetus.id INNER JOIN
dw.d_kytkin AS d_kytkin_henkilostokoulutus ON d_kytkin_henkilostokoulutus_id = d_kytkin_henkilostokoulutus.id INNER JOIN
dw.d_kytkin AS d_kytkin_tyovoimakoulutus ON d_kytkin_tyovoimakoulutus_id = d_kytkin_tyovoimakoulutus.id INNER JOIN
dw.d_alueluokitus AS d_alueluokitus_oppilaitos ON d_organisaatioluokitus_oppilaitos.kunta_koodi = d_alueluokitus_oppilaitos.kunta_koodi INNER JOIN
dw.d_organisaatioluokitus AS d_organisaatioluokitus_jarj ON d_organisaatioluokitus_jarj_id = d_organisaatioluokitus_jarj.id INNER JOIN
dw.d_alueluokitus AS d_alueluokitus_jarj ON d_organisaatioluokitus_jarj.kunta_koodi = d_alueluokitus_jarj.kunta_koodi INNER JOIN
dw.d_erityisopetus AS d_erityisopetus ON d_erityisopetus_id = d_erityisopetus.id INNER JOIN
dw.d_kalenteri AS d_kalenteri ON d_kalenteri_tilastokuukausi_id = d_kalenteri.id INNER JOIN
dw.d_majoitus AS d_majoitus ON d_majoitus_id = d_majoitus.id INNER JOIN
dw.d_kytkin AS d_kytkin ON d_osa_aikaisuus_id = d_kytkin.id INNER JOIN
dw.d_suorituksen_tyyppi AS d_suorituksen_tyyppi ON d_suorituksen_tyyppi_id = d_suorituksen_tyyppi.id INNER JOIN
dw.d_ammatillisen_tutkinnon_kustannusryhma AS d_kustannusryhma ON d_kustannusryhma_id = d_kustannusryhma.id INNER JOIN
dw.d_opintojenrahoitus AS d_opintojenrahoitus ON d_opintojenrahoitus_id = d_opintojenrahoitus.id INNER JOIN
dw.d_osaamisala AS d20 ON d20.id = f.d_osaamisala_id INNER JOIN
dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id


WHERE (f.tilastovuosi < YEAR(getdate()) OR (d_kalenteri.vuosi = YEAR(getdate()) AND d_kalenteri.kuukausi < MONTH(getdate())))

