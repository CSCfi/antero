USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute] AS

--sis. estimaattikauden generointi, poisrajattu vanhan mallin kuutiosta
--sis. koodiarvoja id:eiden sijaan, jotta voidaan prosessoida kuutiot muiden rahoitusperusteiden yhteydessä

BEGIN 

	DROP TABLE IF EXISTS dw.f_amos_opiskelijapalaute;

	SELECT 
		generoitu
		,rahoituskausi_amm
		,vuosi
		,kuukausi

		,ytunnus
		,organisaatio_oppilaitos_koodi
		,kyselyid
		,koulutusluokitus_koodi

		,kohteet
		,vastanneet
		,pisteet
		,vastausosuus
		,katokorjauskerroin = cast(
			case 
				when rahoituskausi_amm = '01.07.2018 - 30.06.2019' then
					case
						when vastausosuus >= 0.8 then 1.0 / vastausosuus
						else 1.0 + (15.0 / 16.0 * vastausosuus) - (25.0 / 32.0 * vastausosuus * vastausosuus)
					end
				when rahoituskausi_amm in ('01.07.2019 - 30.06.2020', '01.07.2020 - 30.06.2021', '01.07.2021 - 30.06.2022', '01.07.2022 - 30.06.2023', '01.07.2023 - 30.06.2024') then
					case
						when vastausosuus >= 0.7 then 1.0 / vastausosuus
						when vastausosuus <= 0.2 then (857.0 / 350.0)
						else 1.0 / 0.70000000000000 + 2.04 * (0.7 - vastausosuus)
					end
				else 
					case
						when vastausosuus >= 0.6 then 1.0 / vastausosuus
						else 1.0 / 0.60000000000000 + 2.0 * (0.6 - vastausosuus)
					end
			end
			as decimal(15,14)
		)
	
	INTO dw.f_amos_opiskelijapalaute

	FROM (

		SELECT 
			generoitu
			,rahoituskausi_amm
			,vuosi
			,kuukausi

			,ytunnus
			,organisaatio_oppilaitos_koodi
			,kyselyid
			,koulutusluokitus_koodi

			,kohteet
			,vastanneet
			,pisteet
			,vastausosuus = 
				cast(
					1.0 
					* sum(vastanneet) over (
						partition by 
							generoitu, 
							rahoituskausi_amm, 
							kyselypohja_tarkenne_fi, 
							ytunnus
					)
					/ sum(kohteet) over (
						partition by 
							generoitu, 
							rahoituskausi_amm, 
							kyselypohja_tarkenne_fi, 
							ytunnus
					)
					as decimal(15,14)
				)

		FROM (

			SELECT 
				generoitu = 0
				,d3.rahoituskausi_amm
				,d3.vuosi
				,d3.kuukausi
		
				,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,organisaatio_oppilaitos_koodi = d2.organisaatio_koodi
				,d5.kyselyid
				,d5.kyselypohja_tarkenne_fi
				,d7.koulutusluokitus_koodi
	
				,kohteet = max(f2.vastaajatunnukset_lkm)
				,vastanneet = count(distinct f.vastaajaid)
				,pisteet = sum(case when d4.rahoitusmallikysymys = 1 then cast(numerovalinta as decimal) else 0.0 end)

			FROM dw.f_arvo_amis AS f
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
			LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.id = f.d_organisaatio_oppilaitos_id
			LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
			LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id
			LEFT JOIN dw.d_arvokyselykerta d5 ON d5.id = f.d_arvokyselykerta_id
			LEFT JOIN dw.d_koulutusluokitus d7 ON d7.id = f.d_koulutusluokitus_id
			LEFT JOIN dw.d_arvovastaus_koulutustausta p ON p.vastaajaid = f.vastaajaid
			LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 
				ON f2.kyselyid = d5.kyselyid
				AND coalesce(f2.oppilaitoskoodi, f2.ytunnus) = coalesce(nullif(d2.organisaatio_koodi, '-1'), d1.ytunnus_avain)
				AND coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi
				AND year(f2.kuukausi) = d3.vuosi and month(f2.kuukausi) = d3.kuukausi

			WHERE 1=1
			AND d3.paivays between datefromparts(2021,7,1) and eomonth(dateadd(month, -3, getdate()))
			AND coalesce(p.priorisointi_vastaajaid,1) = 1

			GROUP BY 
				d3.rahoituskausi_amm
				,d3.vuosi
				,d3.kuukausi
				,coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,d2.organisaatio_koodi
				,d5.kyselyid
				,d5.kyselypohja_tarkenne_fi
				,d7.koulutusluokitus_koodi

			UNION ALL
			
			SELECT 
				generoitu = 1
				,rahoituskausi_amm = max(ca1.generoitava_rahoituskausi)
				,vuosi = case when d3.paivays between min_pvm and max_toteuma_pvm then d3.vuosi else d3b.vuosi end
				,d3.kuukausi
		
				,ytunnus = coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,organisaatio_oppilaitos_koodi = d2.organisaatio_koodi
				,d5.kyselyid
				,d5.kyselypohja_tarkenne_fi
				,d7.koulutusluokitus_koodi
	
				,kohteet = max(f2.vastaajatunnukset_lkm)
				,vastanneet = count(distinct f.vastaajaid)
				,pisteet = sum(case when d4.rahoitusmallikysymys = 1 then cast(numerovalinta as decimal) else 0.0 end)

			FROM dw.f_arvo_amis AS f
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
			LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.id = f.d_organisaatio_oppilaitos_id
			LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
			LEFT JOIN dw.d_kalenteri d3b ON d3b.kalenteri_avain = dateadd(year, 1, case when d3.vuosi between 2000 and 2100 then d3.paivays end)
			LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id
			LEFT JOIN dw.d_arvokyselykerta d5 ON d5.id = f.d_arvokyselykerta_id
			LEFT JOIN dw.d_koulutusluokitus d7 ON d7.id = f.d_koulutusluokitus_id
			LEFT JOIN dw.d_arvovastaus_koulutustausta p ON p.vastaajaid = f.vastaajaid
			LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 
				ON f2.kyselyid = d5.kyselyid
				AND coalesce(f2.oppilaitoskoodi, f2.ytunnus) = coalesce(nullif(d2.organisaatio_koodi, '-1'), d1.ytunnus_avain)
				AND coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi
				AND year(f2.kuukausi) = d3.vuosi and month(f2.kuukausi) = d3.kuukausi

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
			AND coalesce(p.priorisointi_vastaajaid,1) = 1

			GROUP BY 
				case when d3.paivays between min_pvm and max_toteuma_pvm then d3.vuosi else d3b.vuosi end
				,d3.kuukausi
				,coalesce(d1.ytunnus_amos_spl, d1.ytunnus_avain)
				,d2.organisaatio_koodi
				,d5.kyselyid
				,d5.kyselypohja_tarkenne_fi
				,d7.koulutusluokitus_koodi

		) q

	) q2

END

GO
