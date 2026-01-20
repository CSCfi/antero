USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tyoelamapalaute] AS

--lisätty estimaattikauden generointi ja koulutusmuuttujia; huom. pisteitä lukuun ottamatta tiedot järjestäjätasolla.

/*
DECLARE @kysymyksia_tpk int = 9
DECLARE @kysymyksia_tpok int = 8

DECLARE @alku date = '2021-07-01'
DECLARE @loppu date = null --eomonth(dateadd(month, -1*viive, getdate()))
*/

SELECT 
	--
	generoitu
	,rahoituskausi = rahoituskausi_amm

	,d.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,d.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]

	,[Tutkinto] = d2.koulutusluokitus_fi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Tutkintotyyppi] = d2.tutkintotyyppi_fi
	,[jarjestys Tutkintotyyppi] = d2.jarjestys_tutkintotyyppi_koodi
	,[Koulutusala, taso 1] = d2.koulutusalataso1_fi
	,[jarjestys Koulutusala, taso 1] = d2.jarjestys_koulutusalataso1_koodi
	--

	,kysely_fi = kyselypohja_tarkenne_fi

	,koulutuksen_jarjestaja_fi = d.nimi_amos_spl
	,koulutuksen_jarjestajan_kunta_fi = d3.kunta_fi
	,koulutuksen_jarjestajan_maakunta_fi = d3.maakunta_fi
	,koulutuksen_jarjestajan_hyvinvointialue_fi = d3.hyvinvointialue_fi
	,koulutuksen_jarjestajan_avi_fi = d3.avi_fi
	,koulutuksen_jarjestajan_ely_fi = d3.ely_fi
	,koulutuksen_jarjestajan_opetuskieli_fi = d4.opetuskieli_fi

	,koodit_koulutuksen_jarjestaja = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)

	,jarjestys_koulutuksen_jarjestajan_maakunta = d3.jarjestys_maakunta_koodi
	,jarjestys_koulutuksen_jarjestajan_hyvinvointialue = d3.jarjestys_hyvinvointialue_koodi
	,jarjestys_koulutuksen_jarjestajan_avi = d3.jarjestys_avi_koodi
	,jarjestys_koulutuksen_jarjestajan_ely = d3.jarjestys_ely_koodi
	,jarjestys_koulutuksen_jarjestajan_opetuskieli = coalesce(nullif(d4.opetuskieli_koodi, '-1'), '99')

	,apusarake_kohteet = kohteet
	,apusarake_vastanneet = vastanneet
	,apusarake_vastausosuus = vastausosuus
	,apusarake_katokorjauskerroin = katokorjauskerroin
	,apusarake_keskiarvo = keskiarvo
	,apusarake_pisteet = pisteet
	,apusarake_painotetut_pisteet = katokorjauskerroin * pisteet

	,sisaltyy_amos_spl --jäädytysnäkymää varten

FROM (

	SELECT 
		generoitu
		,rahoituskausi_amm
		,kyselypohja_tarkenne_fi
		,ytunnus
		,d_koulutusluokitus_id

		,kohteet
		,vastanneet
		,pisteet
		,keskiarvo = null /*
			case 
				when pisteet = 0 or vastanneet = 0 then null 
				else 1.0 
					* pisteet 
					/ vastanneet 
					/ (case kyselypohja_tarkenne_fi when 'Työelämäpalaute: työpaikkakysely' then 9/*@kysymyksia_tpk*/ when 'Työelämäpalaute: työpaikkaohjaajan kysely' then 8/*@kysymyksia_tpok*/ end)
			end
		*/	
		--järjestäjäkohtaiset
		,vastausosuus
		,katokorjauskerroin = cast(
			case when kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely' then 
				case 
					when vastausosuus >= 0.7 then 1.0 * 1/vastausosuus
					when vastausosuus <= 0.2 then 1.0 * 857/350
					else 1.0 * 1/0.7 + 2.04 * (0.7 - vastausosuus)
				end
			end
			as decimal(15,14)
		)

	FROM (

		SELECT 
			generoitu
			,rahoituskausi_amm
			,kyselypohja_tarkenne_fi
			,ytunnus
			,d_koulutusluokitus_id

			--tunnusluvut määritetään päivien mukaan
			,kohteet = 1.0 * sum(tyopaikkajakson_kesto)
			,vastanneet = 1.0 * sum(vastattu * tyopaikkajakson_kesto)
			,vastausosuus = --järjestäjäkohtainen; lisättävä mahdolliset uudet luokittelumuuttujat ositukseen
				cast(
					1.0 
					* sum(sum(vastattu * tyopaikkajakson_kesto)) over (partition by generoitu, rahoituskausi_amm, kyselypohja_tarkenne_fi, ytunnus)
					/ sum(sum(tyopaikkajakson_kesto)) over (partition by generoitu, rahoituskausi_amm, kyselypohja_tarkenne_fi, ytunnus)
					as decimal(15,14)
				)
			,pisteet = cast(sum(pisteet) as decimal(12,4))

		FROM (

			--muodostetaan perusjoukko sekä summataan pisteet vastaajatunnuksittain (eli karsitaan kysymykset)
			SELECT 
				generoitu = 0
				,d3.rahoituskausi_amm
				,kyselypohja_tarkenne_fi = case when t.yrittajat_tpk = 1 then 'Työelämäpalaute: työpaikkakysely' else d5.kyselypohja_tarkenne_fi end
				,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,f.d_koulutusluokitus_id
				,f.vastaajatunnus
		
				,pisteet = cast(
					cast((case when t.yrittajat_tpk = 1 then 1.0 * 9/8 /*@kysymyksia_tpk/@kysymyksia_tpok*/ else 1.0 end) as decimal(4,3))
					* sum(case when d4.rahoitusmallikysymys = 1 then 1.0 * numerovalinta * tyopaikkajakson_kesto else 0.0 end)
					as decimal(12,4)
				)
				,tyopaikkajakson_kesto = 1.0 * max(tyopaikkajakson_kesto)
				,vastattu = max(case when d4.rahoitusmallikysymys = 1 and vastaajaid is not null then 1 else 0 end)

			FROM dw.f_arvo_amis_tep f
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
			LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_jakso_paattynyt_id = d3.id
			LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
			LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
			LEFT JOIN dw.d_oppisopimuksen_perusta d12 ON d12.id = f.d_oppisopimuksen_perusta_id
			--monistetaan ohjaajakyselystä yrittäjien jaksot myös työpaikkakyselyyn
			LEFT JOIN (select yrittajat_tpk = 1 union select 0) t ON d12.koodi = 2 and d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely'
			CROSS APPLY (
				select
					viive = 
						case
							when d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkakysely' then --maalis-/syyskuussa edellinen puolivuotisjakso
								case
									when month(getdate()) between 3 and 8 then month(getdate()) 
									else (month(getdate())+6) % 12 
								end
							when d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely' then 3
						end
			) ca

			WHERE 1=1
			AND d3.paivays between datefromparts(2021,7,1) /*@alku*/ and /*coalesce(@loppu,*/ eomonth(dateadd(month, -1*viive, getdate()))--)
			AND f.vastaajatunnus is not null

			GROUP BY 
				d3.rahoituskausi_amm
				,t.yrittajat_tpk
				,d5.kyselypohja_tarkenne_fi
				,coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,f.d_koulutusluokitus_id
				,vastaajatunnus

			UNION ALL
			
			SELECT 
				generoitu = 1
				,rahoituskausi_amm = max(ca1.generoitava_rahoituskausi)
				,kyselypohja_tarkenne_fi = case when t.yrittajat_tpk = 1 then 'Työelämäpalaute: työpaikkakysely' else d5.kyselypohja_tarkenne_fi end
				,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,f.d_koulutusluokitus_id
				,f.vastaajatunnus
		
				,pisteet = cast(
					cast((case when t.yrittajat_tpk = 1 then 1.0 * 9/8 /*@kysymyksia_tpk/@kysymyksia_tpok*/ else 1.0 end) as decimal(4,3))
					* sum(case when d4.rahoitusmallikysymys = 1 then 1.0 * numerovalinta * tyopaikkajakson_kesto else 0.0 end)
					as decimal(12,4)
				)
				,tyopaikkajakson_kesto = 1.0 * max(tyopaikkajakson_kesto)
				,vastattu = max(case when d4.rahoitusmallikysymys = 1 and vastaajaid is not null then 1 else 0 end)
				
			FROM dw.f_arvo_amis_tep f 
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
			LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_jakso_paattynyt_id
			LEFT JOIN dw.d_kalenteri d3b ON d3b.kalenteri_avain = dateadd(year, 1, case when d3.vuosi between 2000 and 2100 then d3.paivays end)
			LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
			LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
			LEFT JOIN dw.d_oppisopimuksen_perusta d12 ON d12.id = f.d_oppisopimuksen_perusta_id
			--monistetaan ohjaajakyselystä yrittäjien jaksot myös työpaikkakyselyyn
			LEFT JOIN (select yrittajat_tpk = 1 union select 0) t ON d12.koodi = 2 and d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely'
			CROSS APPLY (
				select
					viive = 
						case
							when d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkakysely' then --maalis-/syyskuussa edellinen puolivuotisjakso
								case
									when month(getdate()) between 3 and 8 then month(getdate()) 
									else (month(getdate())+6) % 12 
								end
							when d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely' then 3
						end
			) ca
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
					max_toteuma_pvm = least(eomonth(dateadd(month, -1*viive, getdate())), max_pvm)
			) ca3

			WHERE 1=1
			AND (
				d3.paivays between min_pvm and max_toteuma_pvm
				OR (
					d3b.paivays > max_toteuma_pvm
					AND d3b.paivays <= max_pvm
				)
			)
			AND f.vastaajatunnus is not null

			GROUP BY 
				t.yrittajat_tpk
				,d5.kyselypohja_tarkenne_fi
				,coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,f.d_koulutusluokitus_id
				,vastaajatunnus

		) q1

		GROUP BY 
			generoitu
			,rahoituskausi_amm
			,kyselypohja_tarkenne_fi
			,ytunnus
			,d_koulutusluokitus_id

		HAVING sum(tyopaikkajakson_kesto) > 0.0

	) q2

) q3

LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON d.ytunnus_avain = q3.ytunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.id = q3.d_koulutusluokitus_id
LEFT JOIN dw.d_alueluokitus d3 ON d3.kunta_koodi = coalesce(d.kunta_koodi, '-1')
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d4 ON d4.organisaatio_koodi = q3.ytunnus

GO
