USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijapalaute] AS

SELECT 
	--uudet
	[Toteuma/Estimaatti] = case when f.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi] = right(f.rahoituskausi_amm, 4) + 1
	,[Järjestäjärakenne] = case when d1.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,d1.[Toiminnanohjauksen kokeilu]
	,d1.[jarjestys Toiminnanohjauksen kokeilu]
	,d1.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,d1.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	--

												--AIKAMUUTTUJAT
	,f.rahoituskausi_amm						AS 'Rahoituskausi'
											
												--KYSELYMUUTTUJAT
	,f.kyselypohja_tarkenne_amis_fi				AS 'Kysely'
	,f.kyselypohja_tarkenne_fi					AS 'Kyselyn kohderyhmä'  
	,d4.kysymys_fi								AS 'Kysymys'
	,d4.kysymysryhma_fi							AS 'Kysymysryhmä'

												---KOULUTUSTOIMIJA
	,d1.nimi_amos_spl							AS 'Koulutuksen järjestäjä'
	,d2b.maakunta_fi							AS 'Koul. järjestäjän maakunta'
	,d2b.kunta_fi								AS 'Koul. järjestäjän kunta'
	,d2b.avi_fi									AS 'Koul. järjestäjän AVI'
	,d2b.ely_fi									AS 'Koul. järjestäjän ELY'

												--KOODIMUUTTUJAT
	,f.ytunnus									AS 'Koodit Koulutuksen järjestäjä'

												--JÄRJESTYSMUUTTUJAT
	,d2b.jarjestys_avi_koodi					AS 'Järjestys jarj avi'
	,d2b.jarjestys_ely_koodi					AS 'Järjestys jarj ely'
	,d2b.jarjestys_maakunta_koodi				AS 'Järjestys jarj maakunta'
	,(select max(d.kysymysjarjestys) from dw.d_arvokysymys d where d.kysymys_fi = d4.kysymys_fi)
												AS 'Järjestys kysymys'
	,(select max(d.kysymysryhmajarjestys) from dw.d_arvokysymys d where d.kysymysryhma_fi = d4.kysymysryhma_fi)
												AS 'Järjestys kysymysryhma'

												--MUUT
	,f.numerovalinta_summa
	,keskiarvo = f.numerovalinta_ka
	,keskihajonta = f.numerovalinta_kh
	,vastausosuudet_kertoimet_avain = f3.avain

	FROM (

		SELECT
			generoitu = 0
			,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
			,d3.rahoituskausi_amm
			,d_arvokysymys_id
			,d2.kyselypohja_tarkenne_fi
			,d2.kyselypohja_tarkenne_amis_fi
			,numerovalinta_summa = sum(cast(numerovalinta as int))
			,numerovalinta_ka = avg(cast(numerovalinta as int) * 1.0)
			,numerovalinta_kh = stdevp(cast(numerovalinta as int))

		FROM dw.f_arvo_amis f
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
		LEFT JOIN dw.d_arvotiedonkeruu d2 ON d2.id = f.d_arvokysely_id
		LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
		LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id

		WHERE 1=1
		AND numerovalinta is not null
		--AND d1.sisaltyy_amos_spl = 1 
		AND d_kalenteri_tunnus_luotu_id != '-1' 
		AND d4.rahoitusmallikysymys = 1
		AND datediff(month,d3.paivays,getdate()) >= 3 

		GROUP BY 
			coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
			,d3.rahoituskausi_amm
			,d_arvokysymys_id
			,d2.kyselypohja_tarkenne_fi
			,d2.kyselypohja_tarkenne_amis_fi

		HAVING sum(cast(numerovalinta as int)) is not null


		UNION ALL


		SELECT
			generoitu = 1
			,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
			,rahoituskausi_amm = max(ca1.generoitava_rahoituskausi)
			,d_arvokysymys_id
			,d2.kyselypohja_tarkenne_fi
			,d2.kyselypohja_tarkenne_amis_fi
			,numerovalinta_summa = sum(cast(numerovalinta as int))
			,numerovalinta_ka = avg(cast(numerovalinta as int) * 1.0)
			,numerovalinta_kh = stdevp(cast(numerovalinta as int))

		FROM dw.f_arvo_amis f
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
		LEFT JOIN dw.d_arvotiedonkeruu d2 ON d2.id = f.d_arvokysely_id
		LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
		LEFT JOIN dw.d_kalenteri d3b ON d3b.kalenteri_avain = dateadd(year, 1, case when d3.vuosi between 2000 and 2100 then d3.paivays end)
		LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id
		CROSS APPLY (
			select 
				generoitava_rahoituskausi = 
					case --else yksinään jumittaa; tarvittaessa lisätään välitauluvaihe
						when month(getdate()) = 0 -- - 3 > 6 
							then concat('01.07.', year(getdate()), ' - ', '30.06.', year(getdate()) + 1) 
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
		AND numerovalinta is not null
		--AND d1.sisaltyy_amos_spl = 1 
		AND d_kalenteri_tunnus_luotu_id != '-1' 
		AND d4.rahoitusmallikysymys = 1
		AND (
			d3.paivays between min_pvm and max_toteuma_pvm
			OR (
				d3b.paivays > max_toteuma_pvm
				AND d3b.paivays <= max_pvm
			)
		)

		GROUP BY 
			coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
			,d_arvokysymys_id
			,d2.kyselypohja_tarkenne_fi
			,d2.kyselypohja_tarkenne_amis_fi

		HAVING sum(cast(numerovalinta as int)) is not null
	
	) f							
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.ytunnus_avain = f.ytunnus
	LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = f.ytunnus
	LEFT JOIN dw.d_alueluokitus d2b on d2b.kunta_koodi = coalesce(d2.kunta_koodi,-1)
	LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
	LEFT JOIN dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet f3 
		ON f3.rahoituskausi = f.rahoituskausi_amm 
		AND f3.ytunnus = f.ytunnus 
		AND f3.kysely_tarkenne = f.kyselypohja_tarkenne_fi
		AND f3.generoitu = f.generoitu

	WHERE 1=1

GO
