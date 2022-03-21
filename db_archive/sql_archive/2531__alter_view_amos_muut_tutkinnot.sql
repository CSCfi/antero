USE [ANTERO]
GO

/****** Object:  View [sa].[v_amos_muut_tutkinnot]    Script Date: 18.10.2019 15:41:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [sa].[v_amos_muut_tutkinnot] AS

SELECT  
	 [tilastovuosi] = q.vuosi
	--,[d_kalenteri_id] = coalesce(d7.id,'-1')
	--,[d_sukupuoli_id] = coalesce(d8.id,'-1')
	--,[d_kieli_aidinkieli_id] = coalesce(d9.id,'-1')
	--,[d_ika_id] = coalesce(d10.id,'-1')
	--,[d_osa_aikaisuus_id] = '-1'
	,[d_erityisopetus_id] = coalesce(d11.id,'-1')
	,[d_majoitus_id] = coalesce(d12.id,'-1')
	,[d_kytkin_oppisopimuskoulutus_id] = coalesce(d2.id,'-1')
	,[d_kytkin_vankilaopetus_id] = coalesce(d3.id,'-1')
	,[d_kytkin_henkilostokoulutus_id] = coalesce(d4.id,'-1')
	,[d_kytkin_tyovoimakoulutus_id] = coalesce(d5.id,'-1')
	--,[d_koulutusluokitus_id] = coalesce(d13.id,'-1')
	--,[d_organisaatioluokitus_oppilaitos_id] = coalesce(d14.id,'-1')
	,[d_organisaatioluokitus_jarj_id] = coalesce(d1.id,'-1')
	,[d_kustannusryhma_id] = coalesce(d6.id,'-1')
	--,[d_suorituksen_tyyppi_id] = coalesce(d15.id,'-1')
	,[d_opintojenrahoitus_id] = coalesce(d16.id,'-1')
	,[eioppis_eivankila] = V11S47
	,[henkilosto_eioppis_eivankila] = V11S77
	,[majoitus_eioppis_eivankila] = V11S87
	,[tyovoima_eioppis_eivankila] = V11S57
	,[tyovoima_henkilosto_eioppis_eivankila] = V11S67
	,[oppis] = V12S47
	,[henkilosto_oppis] = V12S77
	,[majoitus_oppis] = V12S87
	,[vankila] = V15S47
	--,[opiskelijavuodet_painottamaton] = sum(V11S47) + sum(V11S77) + sum(V11S87) + sum(V11S57) + sum(V11S67) + sum(V12S47) + sum(V12S77) + sum(V12S87) + sum(V15S47)
	/*,[opiskelijavuodet_painotettu] = (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and q.vuosi+2 = varainhoitovuosi) * 
									 (
									   ((sum(V11S47) + sum(V11S77) + sum(V11S87) + sum(V11S57) + sum(V11S67)) + (sum(V12S47) + sum(V12S77) + sum(V12S87)) + sum(V15S47))
									  + (sum(V11S77) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and q.vuosi+2 = varainhoitovuosi))
									  + (sum(V11S57) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and q.vuosi+2 = varainhoitovuosi))
									  + (sum(V11S67) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and q.vuosi+2 = varainhoitovuosi))
									  + (sum(V12S77) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and q.vuosi+2 = varainhoitovuosi))
									 )

									  + (sum(V11S87) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and q.vuosi+2 = varainhoitovuosi))
									  + (sum(V12S87) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and q.vuosi+2 = varainhoitovuosi))
									  + (sum(V15S47) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and q.vuosi+2 = varainhoitovuosi))
	*/								 
										

FROM (

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 0
			,tyovoima = 0
			,henkilosto = 0
			,majoitus = 1
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = V11S47 - V11S77 - V11S87 - V11S57
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V11S47 - V11S77 - V11S87 - V11S57 > 0

		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 0
			,tyovoima = 0
			,henkilosto = 1
			,majoitus = 1
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = V11S77
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V11S77 > 0

		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 0
			,tyovoima = 0
			,henkilosto = 0
			,majoitus = 2
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = V11S87
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V11S87 > 0
		
		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 0
			,tyovoima = 1
			,henkilosto = 0
			,majoitus = 1
			,rahoitus = 10
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = V11S57 - V11S67
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V11S57 - V11S67 > 0
		
		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 0
			,tyovoima = 1
			,henkilosto = 1
			,majoitus = 1
			,rahoitus = 10
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = V11S67
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V11S67 > 0
		
		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 1
			,tyovoima = 0
			,henkilosto = 0
			,majoitus = 1
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = V12S47 - V12S77 - V12S87
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V12S47 - V12S77 - V12S87 > 0

		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 1
			,tyovoima = 0
			,henkilosto = 1
			,majoitus = 1
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = V12S77
			,V12S87 = 0
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V12S77 > 0
		
		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 0
			,oppis = 1
			,tyovoima = 0
			,henkilosto = 0
			,majoitus = 2
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = V12S87
			,V15S47 = 0
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V12S87 > 0
		
		UNION ALL

		SELECT 
			 vuosi = 2018
			,ytunnus
			,vankila = 1
			,oppis = 0
			,tyovoima = 0
			,henkilosto = 0
			,majoitus = 1
			,rahoitus = 1
			,erityisopetus = 1
			,V11S47 = 0
			,V11S77 = 0
			,V11S87 = 0
			,V11S57 = 0
			,V11S67 = 0
			,V12S47 = 0
			,V12S77 = 0
			,V12S87 = 0
			,V15S47 = V15S47
		FROM [ANTERO].[sa].[sa_amos_muun_ammatillisen_koulutuksen_opiskelijavuodet_2018]
		WHERE V15S47 > 0



) q

LEFT JOIN dw.d_organisaatioluokitus d1  on d1.organisaatio_koodi = q.ytunnus
LEFT JOIN dw.d_kytkin d2 on d2.kytkin_koodi = q.oppis
LEFT JOIN dw.d_kytkin d3 on d3.kytkin_koodi = q.vankila
LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = q.henkilosto
LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = q.tyovoima
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d6 on d6.koodi = 'muu'
--LEFT JOIN dw.d_kalenteri d7 on d7.kalenteri_avain = '-1'
--LEFT JOIN dw.d_sukupuoli d8 on d8.sukupuoli_koodi = '-1'
--LEFT JOIN dw.d_kieli d9 on d9.kieli_koodi = '-1'
--LEFT JOIN dw.d_ika d10 on d10.ika_avain = '-1'
LEFT JOIN dw.d_erityisopetus d11 on d11.erityisopetus_koodi = q.erityisopetus
LEFT JOIN dw.d_majoitus d12 on d12.majoitus_koodi = q.majoitus
--LEFT JOIN dw.d_koulutusluokitus d13 on d13.koulutusluokitus_avain = '-1'
--LEFT JOIN dw.d_organisaatioluokitus d14 on d14.organisaatio_avain = '-1'
--LEFT JOIN dw.d_suorituksen_tyyppi d15 on d15.koodi = '-1'
LEFT JOIN dw.d_opintojenrahoitus d16 on d16.koodi = q.rahoitus

--GROUP BY q.vuosi,coalesce(d1.id,'-1'),coalesce(d2.id,'-1'),coalesce(d3.id,'-1'),coalesce(d4.id,'-1'),coalesce(d5.id,'-1'),coalesce(d6.id,'-1'),coalesce(d16.id,'-1')



