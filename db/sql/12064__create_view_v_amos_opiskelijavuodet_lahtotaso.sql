USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_opiskelijavuodet_lahtotaso] AS 

SELECT 
	[Varainhoitovuosi] = v.varainhoitovuosi
	,[Rahoituskausi] = v.[rahoituskausi]
	,[Tilastokausi] = v.tarkastelukausi
	,[Tilastovuosi] = v.[tilv]
	
	,[Järjestäjärakenne] = case when d1.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	
	,[Ikäryhmä] = d0.ika
	,[Ikä (maksuttomuusraja)] = case when v.ikar20 in ('1','2') then '20 tai alle' when v.ikar20 = '3' then '21 tai yli' else 'Tieto puuttuu' end
	,[Maksuttomuus (rahoitus)] = case when v.[maksuttomuuden_piirissa] = '1' then 'Maksuton (rahoitus)' else 'Ei maksuton (rahoitus)' end
	,[Äidinkieli] = case v.aikielir1 when 'fs' then 'suomi (sis. saame)' when 'sv' then 'ruotsi' else 'muut kielet' end

	,[Koulutuksen järjestäjä] = v.[jarjnim]
	,d1.[Toiminnanohjauksen kokeilu]
	,d1.[Koul. järjestäjän PILKE-alue (kokeilu)]
	--,[Koul. järj. opetuskieli] = coalesce(d1c.opetuskieli_fi, 'Tieto puuttuu')
	,[Koul. järj. maakunta] = d2.maakunta_fi
	,[Koul. järj. kunta] = d2.kunta_fi
	
	,[Koulutuksen alkamisvuosi] = v.[alvv]
	,[Tutkintotyyppi] = 
		case [tutktyyp]
			when '1' then 'Ammatillinen perustutkinto'
			when '2' then 'Ammattitutkinto'
			when '3' then 'Erikoisammattitutkinto'
			when '4' then 'Muu ammatillinen koulutus'
			when '5' then 'Valmentava koulutus'
		end
	,[Tutkintotyyppi (rahoitus)] =
		case
			when [tutktyyp] = '1' or ([tutktyyp] in ('2','3') and d5.tyovoimakoulutus = 1) then 'Pt, työvoimak. at, työvoimak. eat'
			when [tutktyyp] in ('2','3') and d5.tyovoimakoulutus = 0 then 'At (pl. työvoimak.), eat (pl. työvoimak.)'
			when [tutktyyp] = '4' then 'Muu amm. koulutus'
			when [tutktyyp] = '5' then 'Valmentava koulutus'
		end
	,[Tutkinto] = d4.koulutusluokitus_fi
	,[Koulutusala, taso 1] = case when d4.koulutusalataso1_fi like 'Muut %' then 'Tieto puuttuu' else d4.koulutusalataso1_fi end
    ,[Koulutusala, taso 2] = case when d4.koulutusalataso2_fi like 'Muut %' then 'Tieto puuttuu' else d4.koulutusalataso2_fi end
	,[Koulutusala, taso 3] = case when d4.koulutusalataso3_fi like 'Muut %' then 'Tieto puuttuu' else d4.koulutusalataso3_fi end
	,[Rahoitusmuoto] = d5.selite_fi
	,[Kustannusryhmä] = d6.selite_fi
	
	--pohjakoulutusmuuttujat
	,[Pohjakoulutus (Suomessa)] = 
		case 
			when v.[pohjakoulutus] = '3' then 'On pohjakoulutus, korkeakoulututkinto (Suomessa)'
			when v.[pohjakoulutus] = '2' then 'On pohjakoulutus, alempi kuin korkeakoulututkinto (Suomessa)'
			when v.[pohjakoulutus] = '1' then 'Ei pohjakoulutusta (Suomessa)'
		end
	,[Pohjakoul. taso (Suomessa)] = v.[kaste_t2ni_e]
	,[Pohjakoul. ala (Suomessa)] = v.[kala_t2ni_e]
	,[Pohjakoulutus (ulkomailla)] =
		case
			when v.[pohjakoulutus_ulkom] = '3' then 'On pohjakoulutus, korkeakoulututkinto (ulkomailla)'
			when v.[pohjakoulutus_ulkom] = '2' then 'On pohjakoulutus, alempi kuin korkeakoulututkinto (ulkomailla)'
			when v.[pohjakoulutus_ulkom] = '1' then 'Ei pohjakoulutusta (ulkomailla)'
		end
	,[Pohjakoul. taso (ulkomailla)] = v.[kaste_t2ni_e_ulkom]
	,[Pohjakoul. ala (ulkomailla)] = v.[kala_t2ni_e_ulkom]

	--johdetut pohjakoulutusmuuttujat, yhdistetyissä Suomi priorisoitu; tarvittaessa siirretään koodien muodostus jo lähdenäkymään
	,[Pohjakoulutus (lähtötaso)] =
		case v.pohjakoulutus_lahtotaso
			when 'lt_1' then 'Korkeakoulututkinto'
			when 'lt_2' then 'Muu kuin korkeakoulututkinto'
			when 'lt_3' then 'Ei pohjakoulutusta, tutk.koul. & muu'
			when 'lt_4' then 'Ei pohjakoulutusta, TUVA/VALMA'
			when 'lt_5' then 'Ei pohjakoulutusta, TELMA'
		end
	,[Pohjakoulutus (yhdistetty)] = 
		case
			when v.[pohjakoulutus_ulkom] = '3' or v.[pohjakoulutus] = '3' then 'On pohjakoulutus, korkeakoulututkinto (yhdistetty)'
			when v.[pohjakoulutus_ulkom] = '2' or v.[pohjakoulutus] = '2' then 'On pohjakoulutus, alempi kuin korkeakoulututkinto (yhdistetty)'
			when v.[pohjakoulutus_ulkom] = '1' and v.[pohjakoulutus] = '1' then 'Ei pohjakoulutusta (yhdistetty)'
		end
	,[Pohjakoul. taso (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kaste_t2ni_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kaste_t2ni_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kaste_t2ni_e_ulkom]
		end
	,[Pohjakoul. ala (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kala_t2ni_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kala_t2ni_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kala_t2ni_e_ulkom]
		end
	,[Korkeimman tutkinnon suoritusmaa] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon'
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then 'Suomi'
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then 'Ulkomaat'
		end
	,[Lähtötasoluokka] = 
		case v.pohjakoulutus_lahtotaso
			when 'lt_1' then 'Korkeakoulututkinto'
			when 'lt_2' then 'Muu kuin korkeakoulututkinto'
			when 'lt_3' then 'Ei pohjakoulutusta, tutk.koul. & muu'
			when 'lt_4' then 'Ei pohjakoulutusta, TUVA/VALMA'
			when 'lt_5' then 'Ei pohjakoulutusta, TELMA'
		end
	,[Lähtötasokerroin] = v.pohjakoulutus_lahtotaso_kerroin
	--
	,[Perusop. suoritusvuosi] = -1
	,[Perusop. yksilöllistäminen] = 'Tieto puuttuu'
	,[Perusop. keskiarvoluokka] = 'Tieto puuttuu'

	--
	,[Koodit Koulutuksen järjestäjä] = d1.ytunnus_amos_spl
	,[Koodit Tutkinto] = v.[koulk]

	--
	,[jarjestys Äidinkieli] = case v.aikielir1 when 'fs' then 1 when 'sv' then 2 else 3 end
	,d1.[jarjestys Toiminnanohjauksen kokeilu]
	,d1.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	--,[jarjestys Koul. järj. opetuskieli] = coalesce(10 + d1c.opetuskieli_koodi, 99)
	,[jarjestys Koul. järj. maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys Tutkintotyyppi] = v.[tutktyyp]
	,[jarjestys Tutkintotyyppi (rahoitus)] =
		case
			when [tutktyyp] = '1' or ([tutktyyp] in ('2','3') and d5.tyovoimakoulutus = 1) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when [tutktyyp] in ('2','3') and d5.tyovoimakoulutus = 0 then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
			when [tutktyyp] = '4' then 3 --'Muu amm. koulutus'
			when [tutktyyp] = '5' then 4 --'Valmentava koulutus'
		end
	,[jarjestys Koulutusala, taso 1] = left(d4.jarjestys_koulutusalataso1_koodi, 2)
	,[jarjestys Koulutusala, taso 2] = left(d4.jarjestys_koulutusalataso2_koodi, 3)
	,[jarjestys Koulutusala, taso 3] = left(d4.jarjestys_koulutusalataso3_koodi, 4)
	,[jarjestys Rahoitusmuoto] = d5.jarjestys_koodi
	,[jarjestys Kustannusryhmä] = d6.jarjestys_koodi
	,[jarjestys Pohjakoul. taso (Suomessa)] = coalesce(nullif(v.[kaste_t2_e], '99'), '00')
	,[jarjestys Pohjakoul. ala (Suomessa)] = v.[kala_t2_e]
	,[jarjestys Pohjakoul. taso (ulkomailla)] = coalesce(nullif(v.[kaste_t2_e_ulkom], '99'), '00')
	,[jarjestys Pohjakoul. ala (ulkomailla)] = v.[kala_t2_e_ulkom]
	,[jarjestys Pohjakoulutus (lähtötaso)] = v.pohjakoulutus_lahtotaso
	,[jarjestys Pohjakoul. taso (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then coalesce(nullif(v.[kaste_t2_e], '99'), '00')
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kaste_t2_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kaste_t2_e_ulkom]
		end
	,[jarjestys Pohjakoul. ala (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kala_t2_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kala_t2_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kala_t2_e_ulkom]
		end
	,[jarjestys Lähtötasoluokka] = v.pohjakoulutus_lahtotaso
	,[jarjestys Perusop. yksilöllistäminen] = 9
	,[jarjestys Perusop. keskiarvoluokka] = 99

	--
	,apusarake_lahtotasokerroin = v.pohjakoulutus_lahtotaso_kerroin
	,apusarake_opv_ei_maksuton_kerroin = ca2.opv_ei_maksuton_kerroin
    ,[apusarake_opiskelijavuodet] = v.opiskelijavuodet
	,[apusarake_opiskelijavuodet_painotettu] = v.pohjakoulutus_lahtotaso_kerroin * v.opiskelijavuodet
	,[apusarake_opiskelijavuodet_skaalauskerroin] = 1.0 --cast(ca2.opiskelijavuodet_live as decimal(14,9)) / cast(ca.opiskelijavuodet as decimal(14,9))

FROM [dw].[v_TK_K1_16_sis_estimaatti] v 
LEFT JOIN VipunenTK.dbo.d_ika d0 --jäädytyksessä ANTERO_master
	ON d0.ika_avain = coalesce('ikar8_' + v.[ikar8], '-1')
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.ytunnus_avain = v.jarj
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_koodi = v.jarj
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d1c ON d1c.organisaatio_koodi = v.jarj
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = coalesce(d1b.kunta_koodi, '-1')
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = coalesce(v.koulk, '-1')
LEFT JOIN dw.d_opintojenrahoitus d5 ON d5.koodi = v.rahoitus
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d6 ON d6.koodi = coalesce(v.kustannusryhma, '-1')
/*
--tarvittaessa livetilastoon skaalamiseen
CROSS APPLY (
	SELECT 
		opiskelijavuodet = sum(opiskelijavuodet)

	FROM [dw].[v_TK_K1_16_sis_estimaatti] t
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki t2 ON t2.ytunnus_avain = t.jarj

	WHERE 1=1
	AND coalesce(t.[maksuttomuuden_piirissa],'2') != '1' 
	AND t2.sisaltyy_amos_spl = 1
	AND t.[Varainhoitovuosi] = v.varainhoitovuosi
	AND t.tarkastelukausi = v.tarkastelukausi
	AND t.generoitu = v.generoitu
	AND t2.ytunnus_amos_spl = d1.ytunnus_amos_spl
) ca
*/
LEFT JOIN (
	SELECT 
		[Varainhoitovuosi]
		,Tilastokausi
		,[Toteuma/Estimaatti]
		,[Koodit Koulutuksen järjestäjä]

		,opv_ei_maksuton_kerroin = min(opv_ei_maksuton_kerroin)
		--,opiskelijavuodet_live = sum(painottamaton)

	FROM [dw].v_amos_opiskelijavuodet_uusi

	WHERE 1=1
	AND painotettu_lahtotaso > 0.0
	AND [Maksuttomuus (rahoitus)] = 'Ei maksuton (rahoitus)'
	AND [Hyväksytyt/hylätyt opiskelijavuodet] = 'Hyväksytään'
	AND sisaltyy_okm_perusrahoitus = 1
	AND [Järjestäjärakenne] = 'Viimeisin suoritepäätös'
	AND [Luvaton koulutus] = 'Ei luvaton, hyväksytty'
	AND [Luvanmukainen suorituskieli] in ('Luvassa mainittu suorituskieli', 'Muu ammatillinen koulutus')

	GROUP BY 
		[Varainhoitovuosi]
		,[Tilastokausi]
		,[Toteuma/Estimaatti]
		,[Koodit Koulutuksen järjestäjä]
) ca2
ON ca2.[Varainhoitovuosi] = v.varainhoitovuosi
AND ca2.Tilastokausi = v.tarkastelukausi
AND ca2.[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
AND ca2.[Koodit Koulutuksen järjestäjä] = d1.ytunnus_amos_spl

WHERE 1=1
AND coalesce(v.[maksuttomuuden_piirissa],'2') != '1' 
AND d1.sisaltyy_amos_spl = 1


UNION ALL


SELECT 
	[Varainhoitovuosi]
	,[Rahoituskausi]
	,[Tilastokausi]
    ,[Tilastovuosi]
	,[Järjestäjärakenne]
	,[Toteuma/Estimaatti]
    ,[Ikäryhmä]
    ,[Ikä (maksuttomuusraja)]
    ,[Maksuttomuus (rahoitus)]
    ,[Äidinkieli] = coalesce(nullif(v2.[Äidinkieli (ryhmä)], 'tieto puuttuu'), 'Muut kielet')
    ,[Koulutuksen järjestäjä]
    ,[Toiminnanohjauksen kokeilu]
    ,[Koul. järjestäjän PILKE-alue (kokeilu)]
    ,[Koul. järj. maakunta] = v2.[Koul. järjestäjän maakunta]
    ,[Koul. järj. kunta] = v2.[Koul. järjestäjän kunta]
    ,[Koulutuksen alkamisvuosi]
    ,[Tutkintotyyppi] = 
		case 
			when v2.[Tutkintotyyppi] in ('TUVA','TELMA') then 'Valmentava koulutus'
			when v2.[Tutkintotyyppi] = 'Muu ammatillinen koulutus' then 'Muu ammatillinen koulutus'
			when v2.Tutkinto = 'Tieto puuttuu' then 'Ammatillinen perustutkinto' --linkittymättömät tutk. osaa pien. raportilla näin
			else 
				case v2.Tutkintotyyppi
					when 'Ammatilliset perustutkinnot' then 'Ammatillinen perustutkinto'
					when 'Ammattitutkinnot' then 'Ammattitutkinto'
					when 'Erikoisammattitutkinnot' then 'Erikoisammattitutkinto'
				end
		end
    ,[Tutkintotyyppi (rahoitus)]
    ,[Tutkinto]
    ,[Koulutusala, taso 1]
    ,[Koulutusala, taso 2]
    ,[Koulutusala, taso 3]
    ,[Rahoitusmuoto]
    ,[Kustannusryhmä]
    ,[Pohjakoulutus (Suomessa)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. taso (Suomessa)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. ala (Suomessa)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoulutus (ulkomailla)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. taso (ulkomailla)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. ala (ulkomailla)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoulutus (lähtötaso)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoulutus (yhdistetty)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. taso (yhdistetty)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Pohjakoul. ala (yhdistetty)] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Korkeimman tutkinnon suoritusmaa] = 'Tieto puuttuu, Maksuton (rahoitus)'
    ,[Lähtötasoluokka] = v2.[Perusop. keskiarvoluokka 2]
	,[Lähtötasokerroin] = v2.opv_kerroin_keskiarvoluokka
	,[Perusop. suoritusvuosi]
	,[Perusop. yksilöllistäminen]
	,[Perusop. keskiarvoluokka] = v2.[Perusop. keskiarvoluokka 2]
    ,[Koodit Koulutuksen järjestäjä]
    ,[Koodit Tutkinto]
    ,[jarjestys Äidinkieli] = coalesce(nullif(v2.jarj_aidinkieli_ryhma, 99999), 3)
    ,[jarjestys Toiminnanohjauksen kokeilu]
    ,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
    ,[jarjestys Koul. järj. maakunta] = v2.jarj_koul_jarj_maakunta
    ,[jarjestys Tutkintotyyppi] = 
		CASE 
			when v2.[Tutkintotyyppi] in ('TUVA','TELMA') then '5' --'Valmentava koulutus'
			when v2.[Tutkintotyyppi] = 'Muu ammatillinen koulutus' then '4' --'Muu ammatillinen koulutus'
			WHEN v2.Tutkinto = 'Tieto puuttuu' THEN '1' --'Ammatillinen perustutkinto' (linkittymättömät tutk. osaa pien. raportilla näin)
			ELSE 
				CASE v2.Tutkintotyyppi
					WHEN 'Ammatilliset perustutkinnot' THEN '1' --'Ammatillinen perustutkinto'
					WHEN 'Ammattitutkinnot' THEN '2' --'Ammattitutkinto'
					WHEN 'Erikoisammattitutkinnot' THEN '3' --'Erikoisammattitutkinto'
				END
		END
    ,[jarjestys Tutkintotyyppi (rahoitus)]
    ,[jarjestys Koulutusala, taso 1] = v2.jarj_koulutusala_taso1
    ,[jarjestys Koulutusala, taso 2] = v2.jarj_koulutusala_taso2
    ,[jarjestys Koulutusala, taso 3] = v2.jarj_koulutusala_taso3
    ,[jarjestys Rahoitusmuoto] = v2.jarj_rahoitusmuoto
    ,[jarjestys Kustannusryhmä] = v2.jarj_kustannusryhma
    ,[jarjestys Pohjakoul. taso (Suomessa)] = '99'
    ,[jarjestys Pohjakoul. ala (Suomessa)] = '99'
    ,[jarjestys Pohjakoul. taso (ulkomailla)] = '99'
    ,[jarjestys Pohjakoul. ala (ulkomailla)] = '99'
    ,[jarjestys Pohjakoulutus (lähtötaso)] = '99'
    ,[jarjestys Pohjakoul. taso (yhdistetty)] = '99'
    ,[jarjestys Pohjakoul. ala (yhdistetty)] = '99'
	,[jarjestys Lähtötasoluokka] = cast(v2.jarj_perusop_keskiarvoluokka_2 as varchar)
	,[jarjestys Perusop. yksilöllistäminen] = v2.jarj_perusop_yksilollistaminen
	,[jarjestys Perusop. keskiarvoluokka] = v2.jarj_perusop_keskiarvoluokka_2

    ,[apusarake_lahtotasokerroin] = v2.opv_kerroin_keskiarvoluokka
	,apusarake_opv_ei_maksuton_kerroin = 1.0
    ,[apusarake_opiskelijavuodet] = sum(v2.painottamaton)
	,[apusarake_opiskelijavuodet_painotettu] = sum(painotettu_lahtotaso)
	,[apusarake_opiskelijavuodet_skaalauskerroin] = 1.0

FROM [dw].v_amos_opiskelijavuodet_uusi v2

WHERE 1=1
AND painotettu_lahtotaso > 0.0
AND [Maksuttomuus (rahoitus)] = 'Maksuton (rahoitus)'
AND [Hyväksytyt/hylätyt opiskelijavuodet] = 'Hyväksytään'
AND sisaltyy_okm_perusrahoitus = 1
AND [Järjestäjärakenne] = 'Viimeisin suoritepäätös'
AND [Luvaton koulutus] = 'Ei luvaton, hyväksytty'
AND [Luvanmukainen suorituskieli] in ('Luvassa mainittu suorituskieli', 'Muu ammatillinen koulutus')

GROUP BY 
	[Varainhoitovuosi]
	,[Rahoituskausi]
	,[Tilastokausi]
    ,[Tilastovuosi]
	,[Järjestäjärakenne]
	,[Toteuma/Estimaatti]
    ,[Ikäryhmä]
    ,[Ikä (maksuttomuusraja)]
    ,[Maksuttomuus (rahoitus)]
    ,v2.[Äidinkieli (ryhmä)]
    ,[Koulutuksen järjestäjä]
    ,[Toiminnanohjauksen kokeilu]
    ,[Koul. järjestäjän PILKE-alue (kokeilu)]
    ,v2.[Koul. järjestäjän maakunta]
    ,v2.[Koul. järjestäjän kunta]
    ,[Koulutuksen alkamisvuosi]
    ,[Tutkintotyyppi]
    ,[Tutkintotyyppi (rahoitus)]
    ,[Tutkinto]
    ,[Koulutusala, taso 1]
    ,[Koulutusala, taso 2]
    ,[Koulutusala, taso 3]
    ,[Rahoitusmuoto]
    ,[Kustannusryhmä]
	,v2.[Perusop. keskiarvoluokka 2]
	,v2.opv_kerroin_keskiarvoluokka
	,[Perusop. suoritusvuosi]
	,[Perusop. yksilöllistäminen]
	,v2.[Perusop. keskiarvoluokka 2]
    ,[Koodit Koulutuksen järjestäjä]
    ,[Koodit Tutkinto]
    ,v2.jarj_aidinkieli_ryhma
    ,[jarjestys Toiminnanohjauksen kokeilu]
    ,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
    ,v2.jarj_koul_jarj_maakunta
    ,v2.jarj_tutkintotyyppi
    ,[jarjestys Tutkintotyyppi (rahoitus)]
    ,v2.jarj_koulutusala_taso1
    ,v2.jarj_koulutusala_taso2
    ,v2.jarj_koulutusala_taso3
    ,v2.jarj_rahoitusmuoto
    ,v2.jarj_kustannusryhma
	,v2.jarj_perusop_keskiarvoluokka_2
	,v2.jarj_perusop_yksilollistaminen
	
GO
