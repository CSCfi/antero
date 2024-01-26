USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_tyoelamapalaute]    Script Date: 29.9.2023 12:50:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dw].[v_amos_tyoelamapalaute] AS

/*
22.9.2023 JS: 
- luonnoksessa käytetty pyöristyserojen takia alta vain kohteet, vastanneet ja pisteet, loput lasketaan kuutiossa
- tehdään tarvittaessa latausproseduuri osaksi jobia transform-arvo, kuutio lisätään kutsuttavaan server agent jobiin
*/

/*
DECLARE @kysymyksia_tpk int = 9
DECLARE @kysymyksia_tpok int = 8

DECLARE @alku date = '2021-07-01'
DECLARE @loppu date = null --eomonth(dateadd(month, -1*viive, getdate()))
*/

SELECT 
	rahoituskausi = rahoituskausi_amm

	,kysely_fi = kyselypohja_tarkenne_fi

	,koulutuksen_jarjestaja_fi = d.nimi_amos_spl
	,koulutuksen_jarjestajan_kunta_fi = d3.kunta_fi
	,koulutuksen_jarjestajan_maakunta_fi = d3.maakunta_fi
	,koulutuksen_jarjestajan_hyvinvointialue_fi = d3.hyvinvointialue_fi
	,koulutuksen_jarjestajan_avi_fi = d3.avi_fi
	,koulutuksen_jarjestajan_ely_fi = d3.ely_fi
	,koulutuksen_jarjestajan_opetuskieli_fi = d4.opetuskieli_fi

	,koodit_koulutuksen_jarjestaja = d.ytunnus_amos_spl

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
	,apusarake_painotetut_pisteet = 1.0 * katokorjauskerroin * pisteet

FROM (

	SELECT 
		rahoituskausi_amm
		,kyselypohja_tarkenne_fi
		,ytunnus_amos_spl

		,kohteet
		,vastanneet
		,vastausosuus
		,pisteet
	
		,keskiarvo = 
			case when pisteet = 0 then null else 
				1.0 
				* pisteet 
				/ vastanneet 
				/ (case kyselypohja_tarkenne_fi when 'Työelämäpalaute: työpaikkakysely' then 9/*@kysymyksia_tpk*/ when 'Työelämäpalaute: työpaikkaohjaajan kysely' then 8/*@kysymyksia_tpok*/ end)
			end
		,katokorjauskerroin = 
			case when kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely' then 
				case 
					when vastausosuus >= 0.7 then 1.0 * 1/vastausosuus
					when vastausosuus <= 0.2 then 1.0 * 857/350
					else 1.0 * 1/0.7 + 2.04 * (0.7 - vastausosuus)
				end
			end

	FROM (

		SELECT 
			rahoituskausi_amm
			,kyselypohja_tarkenne_fi
			,ytunnus_amos_spl

			--tunnusluvut määritetään päivien mukaan
			,kohteet = 1.0 * sum(tyopaikkajakson_kesto)
			,vastanneet = 1.0 * sum(vastattu * tyopaikkajakson_kesto)
			,vastausosuus = 1.0 * sum(vastattu * tyopaikkajakson_kesto) / sum(tyopaikkajakson_kesto)
			,pisteet = 1.0 * sum(pisteet)

		FROM (

			--muodostetaan perusjoukko sekä summataan pisteet vastaajatunnuksittain (eli karsitaan kysymykset)
			SELECT 
				d3.rahoituskausi_amm
				,kyselypohja_tarkenne_fi = case when t.yrittajat_tpk = 1 then 'Työelämäpalaute: työpaikkakysely' else d5.kyselypohja_tarkenne_fi end
				,d1.ytunnus_amos_spl
				,f.vastaajatunnus
		
				,pisteet = 1.0 
					* (case when t.yrittajat_tpk = 1 then 1.0 * 9/8/*@kysymyksia_tpk/@kysymyksia_tpok*/ else 1.0 end) 
					* sum(case when d4.rahoitusmallikysymys = 1 then 1.0 * numerovalinta * tyopaikkajakson_kesto else 0.0 end)
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
			AND d1.sisaltyy_amos_spl = 1
			AND d3.paivays between datefromparts(2021,7,1)/*@alku*/ and /*coalesce(@loppu,*/ eomonth(dateadd(month, -1*viive, getdate()))--)
			AND f.vastaajatunnus is not null

			GROUP BY 
				d3.rahoituskausi_amm
				,t.yrittajat_tpk
				,d5.kyselypohja_tarkenne_fi
				,d1.ytunnus_amos_spl
				,vastaajatunnus

		) q1

		GROUP BY 
			rahoituskausi_amm
			,kyselypohja_tarkenne_fi
			,ytunnus_amos_spl

	) q2

) q3

LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON d.ytunnus_avain = q3.ytunnus_amos_spl
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_avain like 'koulutustoimija%' and d2.organisaatio_koodi = q3.ytunnus_amos_spl
LEFT JOIN dw.d_alueluokitus d3 ON d3.alueluokitus_avain like 'kunta%' and d3.kunta_koodi = coalesce(d2.kunta_koodi, '-1') --d.kunta_koodi?
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d4 ON d4.organisaatio_koodi = q3.ytunnus_amos_spl

GO
