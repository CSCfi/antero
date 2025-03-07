USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_amm_opiskelijat_ja_tutkinnot]    Script Date: 26.5.2021 11:12:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















ALTER VIEW [dw].[v_koski_amm_opiskelijat_ja_tutkinnot] AS

SELECT --TOP 1000
	 [Tilastovuosi]
	,[Tilastokuukausi] = d14.kuukausi_fi
	,[pv_kk] = DAY(EOMONTH(d14.paivays))
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieliryhma1_fi
	,[Ikä] = d3.ikaryhma6_fi
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Kansalaisuus] = CASE WHEN d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_fi WHEN d22.maatjavaltiot2_koodi != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END
	,[Kansalaisuus (maanosa)] = d22.maanosa0_fi
	,[Tutkintotyypin ryhmä] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
			WHEN d24.kytkin_koodi = 1 THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyypin_ryhma_fi
		END  
   
	,[Tutkintotyyppi] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' THEN 'VALMA'
			WHEN d4.koulutusluokitus_fi like '%TELMA%' THEN 'TELMA' 
			WHEN d24.kytkin_koodi = 1 THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyyppi_fi
		END
	
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
	,[Suorituskieli] = d23.kieli_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Kustannusryhmä] = d18.selite_fi 
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_ryhma_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6a.kytkin_fi 
			when 'Kyllä' then 'Oppisopimuskoulutus' 
			when 'Ei' then 'Ei oppisopimuskoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Koulutussopimus] = 
		case d6b.kytkin_fi 
			when 'Kyllä' then 'Koulutussopimus' 
			when 'Ei' then 'Ei koulutussopimus' 
			else 'Tieto puuttuu' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_fi 
			when 'Kyllä' then 'Vankilaopetus' 
			when 'Ei' then 'Ei vankilaopetus' 
			else 'Tieto puuttuu' 
		end
	,[Henkilöstökoulutus] =	
		case d8.kytkin_fi 
			when 'Kyllä' then 'Henkilöstökoulutus' 
			when 'Ei' then 'Ei henkilöstökoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Työvoimakoulutus] = 
		case d19b.kytkin_fi 
			when 'Kyllä' then 'Työvoimakoulutus' 
			when 'Ei' then 'Ei työvoimakoulutus' 
			else 'Tieto puuttuu' 
		end

	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen järjestäjä] = d11.organisaatio_fi
	,[Toimipiste] = d21.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Oppilaitoksen opetuskieli] = d5.oppilaitoksenopetuskieli_fi
	,[Oppilaitostyyppi] = d5.oppilaitostyyppi_fi
	,[Koul. järjestäjän kunta] = d12.kunta_fi 
	,[Koul. järjestäjän maakunta] = d12.maakunta_fi 
	,[Koul. järjestäjän ELY] = d12.ely_fi 
	,[Koul. järjestäjän AVI] = d12.avi_fi  

	,[Oppisopimuksen suoritusosuus] = oppisopimus_osuus
	,[Koulutussopimuksen suoritusosuus] = koulutussopimus_osuus
	,[Oppisopimus/Koulutussopimus] =
		CASE
			WHEN d6a.kytkin_koodi = 1 and d6b.kytkin_koodi = 1 THEN 'Oppisopimus ja koulutussopimus'
			WHEN d6a.kytkin_koodi = 1 and d6b.kytkin_koodi = 0 THEN 'Oppisopimus, ei koulutussopimusta'
			WHEN d6a.kytkin_koodi = 0 and d6b.kytkin_koodi = 1 THEN 'Koulutussopimus, ei oppisopimusta'
			WHEN d6a.kytkin_koodi = 0 and d6b.kytkin_koodi = 0 THEN 'Ei oppisopimusta, ei koulutussopimusta'
			ELSE 'Tieto puuttuu'
		END

	,oppija_oid
	,opiskeluoikeus_oid

	,ryhma

	--Mittarit
	,opiskelija = opiskelijat
	,uusi_opiskelija = uudet_opiskelijat
	,uusi_opiskelija_rahoitus = uudet_opiskelijat_rahoitus
	,opiskelijat_netto = opiskelijat_netto
	,tutkinnon_suorittanut = tutkinnot
	,opiskelijavuodet
	,eronnut_opiskelija = eronnut
    ,[jatkaa_kj]
    ,[jatkaa_oppilaitos]
    ,[jatkaa_tutkintotyyppi]
    ,[jatkaa_ammatillinen]
    ,[jatkaa_yleissivistava]
    ,[jatkaa_valmentava]
    ,[jatkaa_lukio_valmentava]
    ,[jatkaa_amm_valmentava]
    ,[jatkaa_muu_ammatillinen]
	,[jatkaa_amm_tutkintokoulutus]
    ,[jatkaa_tutkinto_boo]
    ,[jatkaa_koulutusala_taso3_boo]
    ,[jatkaa_koulutusala_taso2_boo]
    ,[jatkaa_koulutusala_taso1_boo]
    ,[jatkaa_koulutusmuoto_boo]
    ,[jatkaa_amm_yleissiv_boo]
    ,[jatkaa_toinen_aste_boo]
    ,[jatkaa_koulutusjarjestelma_boo]
	--Koodit
	,[Koodit Koulutuksen järjestäjä] = d11.organisaatio_koodi 
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20.koodi
	,[Koodit Oppisopimuskoulutus] = d6a.kytkin_koodi
	,[Koodit Koulutussopimus] = d6b.kytkin_koodi

	--Järjestykset
	,d18.jarjestys_koodi AS jarj_kustannusryhma
	,d19.jarjestys_koodi AS jarj_rahoitusmuoto
	,d14.kuukausi AS jarj_tilastokuukausi
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d3.jarjestys_ikaryhma6 AS jarj_ika
	,d2.jarjestys_kieliryhma1 AS jarj_aidinkieli
	,CASE d22.maatjavaltiot2_fi WHEN 'Suomi' THEN 1 ELSE 2 END AS jarj_kansalaisuus
	,d4.jarjestys_koulutusalataso1_koodi AS jarj_koulutusala_taso1
	,d4.jarjestys_koulutusalataso2_koodi AS jarj_koulutusala_taso2
	,d4.jarjestys_koulutusalataso3_koodi AS jarj_koulutusala_taso3
	,d6a.jarjestys_kytkin_koodi as jarj_opso
	,d6b.jarjestys_kytkin_koodi as jarj_koso
	,d7.jarjestys_kytkin_koodi as jarj_vankila
	,d8.jarjestys_kytkin_koodi as jarj_henkilosto
	,d9.jarjestys_kytkin_koodi as jarj_tyovoima
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi
	,d5.jarjestys_oppilaitoksenopetuskieli_koodi AS jarj_oppilaitoksen_opetuskieli
	,d5.jarjestys_oppilaitostyyppi_koodi AS jarj_oppilaitostyyppi
	,d13.jarjestys_erityisopetus_ryhma AS jarj_erityisopetus
	,d15.jarjestys_majoitus_koodi as jarj_majoitus
	,CASE 
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d24.kytkin_koodi = 1 THEN '92'
		ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	END AS jarj_tutkintotyypin_ryhma
	,CASE 
		WHEN d4.koulutusluokitus_fi like '%VALMA%' THEN '90'
		WHEN d4.koulutusluokitus_fi like '%TELMA%' THEN '91'
		WHEN d24.kytkin_koodi = 1 THEN '92'
		ELSE d4.jarjestys_tutkintotyyppi_koodi
	END AS jarj_tutkintotyyppi
	,[jarj_oppisopimus_koulutussopimus] =
		CASE
			WHEN d6a.kytkin_koodi = 1 and d6b.kytkin_koodi = 1 THEN 1
			WHEN d6a.kytkin_koodi = 1 and d6b.kytkin_koodi = 0 THEN 2
			WHEN d6a.kytkin_koodi = 0 and d6b.kytkin_koodi = 1 THEN 3
			WHEN d6a.kytkin_koodi = 0 and d6b.kytkin_koodi = 0 THEN 4
			ELSE 9
		END

FROM  (
	
	SELECT 
		tilastovuosi
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_organisaatioluokitus_jarj_id
		,d_organisaatioluokitus_toimipiste_id
		,d_kytkin_oppisopimuskoulutus_id
		,d_kytkin_koulutussopimus_id
		,d_kytkin_vankilaopetus_id
		,d_kytkin_henkilostokoulutus_id
		,d_kytkin_tyovoimakoulutus_id
		,d_erityisopetus_id
		,d_kalenteri_id
		,d_majoitus_id
		,d_osa_aikaisuus_id
		,d_suorituksen_tyyppi_id
		,d_kustannusryhma_id
		,d_opintojenrahoitus_id
		,d_osaamisala_id
		,d_kieli_suorituskieli_id
		,d_kytkin_muu_ammatillinen_id
		,oppisopimus_osuus = 'Tieto puuttuu'
		,koulutussopimus_osuus = 'Tieto puuttuu'
		,oppija_oid
		,opiskeluoikeus_oid
		,opiskelijat = 1
		,uudet_opiskelijat = uusi
		,uudet_opiskelijat_rahoitus = uusi_rahoitus
		,eronnut
		,[jatkaa_kj]
		,[jatkaa_oppilaitos]
		,[jatkaa_tutkintotyyppi]
		,[jatkaa_ammatillinen]
		,[jatkaa_yleissivistava]
		,[jatkaa_valmentava]
		,[jatkaa_lukio_valmentava]
		,[jatkaa_amm_valmentava]
		,[jatkaa_muu_ammatillinen]
		,[jatkaa_amm_tutkintokoulutus]
		,d_keskeyttaminen_vaiheittainen_id
		,opiskelijat_netto = 0
		,tutkinnot = 0
		,opiskelijavuodet = 0
		,ryhma = 'opiskelijat'
	FROM dw.f_koski_amm_opiskelijat

	UNION ALL

	SELECT 
		tilastovuosi
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_organisaatioluokitus_jarj_id
		,d_organisaatioluokitus_toimipiste_id
		,d_kytkin_oppisopimuskoulutus_id
		,d_kytkin_koulutussopimus_id
		,d_kytkin_vankilaopetus_id
		,d_kytkin_henkilostokoulutus_id
		,d_kytkin_tyovoimakoulutus_id
		,d_erityisopetus_id
		,d_kalenteri_id
		,d_majoitus_id
		,d_osa_aikaisuus_id
		,d_suorituksen_tyyppi_id
		,d_kustannusryhma_id
		,d_opintojenrahoitus_id
		,d_osaamisala_id
		,d_kieli_suorituskieli_id
		,d_kytkin_muu_ammatillinen_id = -1
		,oppisopimus_osuus = 'Tieto puuttuu'
		,koulutussopimus_osuus = 'Tieto puuttuu'
		,oppija_oid = null
		,opiskeluoikeus_oid = null
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,uudet_opiskelijat_rahoitus = 0
		,eronnut = 0
		,[jatkaa_kj] = 0
		,[jatkaa_oppilaitos] = 0
		,[jatkaa_tutkintotyyppi] = 0
		,[jatkaa_ammatillinen] = 0
		,[jatkaa_yleissivistava] = 0
		,[jatkaa_valmentava] = 0
		,[jatkaa_lukio_valmentava] = 0
		,[jatkaa_amm_valmentava] = 0
		,[jatkaa_muu_ammatillinen] = 0
		,[jatkaa_amm_tutkintokoulutus] = 0
		,d_keskeyttaminen_vaiheittainen_id = -1
		,opiskelijat_netto = opiskelijat
		,tutkinnot = 0
		,opiskelijavuodet = 0
		,ryhma = 'opiskelijat_netto'
	FROM dw.f_koski_amm_opiskelijat_netto

	UNION ALL

	SELECT 
		tilastovuosi
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_organisaatioluokitus_jarj_id
		,d_organisaatioluokitus_toimipiste_id
		,d_kytkin_oppisopimuskoulutus_id
		,d_kytkin_koulutussopimus_id
		,d_kytkin_vankilaopetus_id
		,d_kytkin_henkilostokoulutus_id
		,d_kytkin_tyovoimakoulutus_id
		,d_erityisopetus_id
		,d_kalenteri_id
		,d_majoitus_id
		,d_osa_aikaisuus_id
		,d_suorituksen_tyyppi_id
		,d_kustannusryhma_id
		,d_opintojenrahoitus_id
		,d_osaamisala_id
		,d_kieli_suorituskieli_id
		,d_kytkin_muu_ammatillinen_id
		,oppisopimus_osuus
		,koulutussopimus_osuus
		,oppija_oid
		,opiskeluoikeus_oid
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,uudet_opiskelijat_rahoitus = 0
		,eronnut = 0
		,[jatkaa_kj] = 0
		,[jatkaa_oppilaitos] = 0
		,[jatkaa_tutkintotyyppi] = 0
		,[jatkaa_ammatillinen] = 0
		,[jatkaa_yleissivistava] = 0
		,[jatkaa_valmentava] = 0
		,[jatkaa_lukio_valmentava] = 0
		,[jatkaa_amm_valmentava] = 0
		,[jatkaa_muu_ammatillinen] = 0
		,[jatkaa_amm_tutkintokoulutus] = 0
		,d_keskeyttaminen_vaiheittainen_id = -1
		,opiskelijat_netto = 0
		,tutkinnot = 1
		,opiskelijavuodet = 0
		,ryhma = 'tutkinnot'
	FROM dw.f_koski_amm_tutkinnot
	/*
	UNION ALL

	SELECT 
		vuosi
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_organisaatioluokitus_jarj_id
		,d_organisaatioluokitus_toimipiste_id
		,d_kytkin_oppisopimuskoulutus_id
		,d_kytkin_koulutussopimus_id
		,d_kytkin_vankilaopetus_id
		,d_kytkin_henkilostokoulutus_id
		,d_kytkin_tyovoimakoulutus_id
		,d_erityisopetus_id
		,d_kalenteri_id
		,d_majoitus_id
		,d_osa_aikaisuus_id
		,d_suorituksen_tyyppi_id
		,d_kustannusryhma_id
		,d_opintojenrahoitus_id
		,d_osaamisala_id
		,d_kieli_suorituskieli_id
		,d_kytkin_muu_ammatillinen_id
		,oppisopimus_osuus = 'Tieto puuttuu'
		,koulutussopimus_osuus = 'Tieto puuttuu'
		,oppija_oid = NULL
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,opiskelijat_netto = 0
		,tutkinnot = 0
		,opiskelijavuodet = opiskelijavuodet * (oa_pros / 100.0)
		,ryhma = 'opso_koso'
	FROM dw.f_koski_amm_opiskelijavuodet_opso_koso
	*/
) f

LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kytkin d6a ON d6a.id = f.d_kytkin_oppisopimuskoulutus_id
LEFT JOIN dw.d_kytkin d6b ON d6b.id = f.d_kytkin_koulutussopimus_id
LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13 ON d13.id = f.d_erityisopetus_id
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_id
LEFT JOIN dw.d_majoitus d15 ON d15.id = f.d_majoitus_id
LEFT JOIN dw.d_kytkin d16 ON d16.id = f.d_osa_aikaisuus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d18 ON d18.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_opintojenrahoitus d19 ON d19.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kytkin d19b ON d19b.kytkin_koodi = d19.tyovoimakoulutus
LEFT JOIN dw.d_osaamisala d20 ON d20.id = f.d_osaamisala_id 
LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_kieli d23 ON d23.id = f.d_kieli_suorituskieli_id
LEFT JOIN dw.d_kytkin d24 ON d24.id = f.d_kytkin_muu_ammatillinen_id
LEFT JOIN dw.d_keskeyttaminen_vaiheittainen d25 ON d25.id = f.d_keskeyttaminen_vaiheittainen_id

WHERE tilastovuosi > 2018






















GO


USE ANTERO