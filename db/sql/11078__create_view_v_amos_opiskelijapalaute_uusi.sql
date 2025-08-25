USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_opiskelijapalaute_uusi] AS

--lisätty koulutusmuuttujia; huom. pisteitä lukuun ottamatta tiedot järjestäjätasolla.
 
SELECT 
	--
	f.generoitu
	,[Varainhoitovuosi] = right(f.rahoituskausi, 4) + 1
	,[Rahoituskausi (palautteet)] = f.rahoituskausi
	,d.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,d.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Tutkinto] = d1.koulutusluokitus_fi
	,[Koodit Tutkinto] = d1.koulutusluokitus_koodi
	,[Tutkintotyyppi] = d1.tutkintotyyppi_fi
	,[jarjestys Tutkintotyyppi] = d1.jarjestys_tutkintotyyppi_koodi
	,[Koulutusala, taso 1] = d1.koulutusalataso1_fi
	,[jarjestys Koulutusala, taso 1] = d1.jarjestys_koulutusalataso1_koodi
	--
	
	,[Suoritepäätös (viimeisin)] = case when d.sisaltyy_amos_spl = 1 then 'Kyllä' else 'Ei' end

	,[Kysely] = f.kysely
	,[Kyselyn kohderyhmä] = f.kysely_tarkenne

	,[Koulutuksen järjestäjä] = f.jarj
	,[Koulutuksen järjestäjän kunta] = d2.kunta_fi
	,[Koulutuksen järjestäjän maakunta] = d2.maakunta_fi

	--koodit
	,[Koodit Koulutuksen järjestäjä] = f.ytunnus

	--jarjestys
	,[jarj Koulutuksen järjestäjän maakunta] = d2.jarjestys_maakunta_koodi

	--apusarakkeet
	,f.kyselyn_kohteet_rahoitus
	,f.vastanneet_rahoitus
	,f.vastausosuus_rahoitus
	,f.katokorjauskerroin_rahoitus
	,q.pisteet
	,[painotetut_pisteet] = f.katokorjauskerroin_rahoitus * q.pisteet

FROM dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet f 

JOIN (select 2022 as min_vuosi) v ON v.min_vuosi < right(f.rahoituskausi, 4)

LEFT JOIN (

	SELECT 
		generoitu = 0
		,rahoituskausi = d3.rahoituskausi_amm
		,ytunnus = coalesce(d1.ytunnus_amos_spl, f2.koulutustoimija)
		,kysely = d2.kyselypohja_tarkenne_amis_fi
		,kysely_tarkenne = d2.kyselypohja_tarkenne_fi
		,f2.d_koulutusluokitus_id
		,pisteet = sum(cast(f2.numerovalinta as int))

	FROM dw.f_arvo_amis f2
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f2.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN dw.d_arvokyselykerta d2 ON d2.id = f2.d_arvokyselykerta_id
	LEFT JOIN dw.d_kalenteri d3 ON d3.id = f2.d_kalenteri_tunnus_luotu_id 
	LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f2.d_arvokysymys_id

	WHERE 1=1
	AND d3.paivays between '2022-07-01' and eomonth(dateadd(month, -3, getdate())) 
	AND d4.rahoitusmallikysymys = 1

	GROUP BY 
		d3.rahoituskausi_amm
		,coalesce(d1.ytunnus_amos_spl, f2.koulutustoimija)
		,d2.kyselypohja_tarkenne_amis_fi
		,d2.kyselypohja_tarkenne_fi
		,f2.d_koulutusluokitus_id

	UNION ALL

	SELECT 
		generoitu = 1
		,rahoituskausi = max(ca1.generoitava_rahoituskausi)
		,ytunnus = coalesce(d1.ytunnus_amos_spl, f2.koulutustoimija)
		,kysely = d2.kyselypohja_tarkenne_amis_fi
		,kysely_tarkenne = d2.kyselypohja_tarkenne_fi
		,f2.d_koulutusluokitus_id
		,pisteet = sum(cast(f2.numerovalinta as int))
		
	FROM dw.f_arvo_amis f2
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f2.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN dw.d_arvokyselykerta d2 ON d2.id = f2.d_arvokyselykerta_id
	LEFT JOIN dw.d_kalenteri d3 ON d3.id = f2.d_kalenteri_tunnus_luotu_id 
	LEFT JOIN dw.d_kalenteri d3b ON d3b.kalenteri_avain = dateadd(year, 1, case when d3.vuosi between 2000 and 2100 then d3.paivays end)
	LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f2.d_arvokysymys_id
	CROSS APPLY (
		select 
			generoitava_rahoituskausi = 
				case 
					when month(getdate()) - 3 > 6 then concat('01.07.', year(getdate()), ' - ', '30.06.', year(getdate()) + 1) 
					else concat('01.07.', year(getdate()) - 1, ' - ', '30.06.', year(getdate()))
				end
	) ca1
	CROSS APPLY (
		select 
			min_pvm = datefromparts(right(generoitava_rahoituskausi, 4) - 1, 7, 1)
			,max_pvm = datefromparts(right(generoitava_rahoituskausi, 4), 6, 30)
	) ca2
	CROSS APPLy (
		select 
			max_toteuma_pvm = least(eomonth(dateadd(month, -3, getdate())), max_pvm)
	) ca3

	WHERE 1=1
	AND (
		d3.paivays between min_pvm and max_toteuma_pvm
		OR (
			d3b.paivays > max_toteuma_pvm
			AND d3b.paivays <= max_pvm
		)
	)
	AND d4.rahoitusmallikysymys = 1

	GROUP BY 
		coalesce(d1.ytunnus_amos_spl, f2.koulutustoimija)
		,d2.kyselypohja_tarkenne_amis_fi
		,d2.kyselypohja_tarkenne_fi
		,f2.d_koulutusluokitus_id

) q 
	ON q.generoitu = f.generoitu
	AND q.rahoituskausi = f.rahoituskausi
	AND q.ytunnus = f.ytunnus
	AND q.kysely = f.kysely
	AND q.kysely_tarkenne = f.kysely_tarkenne

LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = f.ytunnus
LEFT JOIN dw.d_koulutusluokitus d1 on d1.id = q.d_koulutusluokitus_id
LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = coalesce(d.kunta_koodi, '-1')

GO
