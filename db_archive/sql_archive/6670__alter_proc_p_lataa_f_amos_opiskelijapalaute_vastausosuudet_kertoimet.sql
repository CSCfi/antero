USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]    Script Date: 17.11.2022 23:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet] AS

TRUNCATE TABLE dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet

INSERT INTO dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet (	
	[ytunnus]
	,[jarj]
	,[rahoituskausi]
	,[kysely]
	,[kysely_tarkenne]
	,[kyselyn_kohteet_arvo]
	,[kyselyn_kohteet_vahvistettu]
	,[kyselyn_kohteet_rahoitus]
	,[vastanneet_arvo]
	,[vastanneet_vahvistettu]
	,[vastanneet_rahoitus]
	,[vastaajamaaran_lahde]
	,[vastausosuus_arvo]
	,[vastausosuus_rahoitus]
	,[katokorjauskerroin_rahoitus]
	,[katokorjauskerroin_arvo]
)

SELECT DISTINCT 

	q4.[organisaatio_koodi]
	,ol.[organisaatio_fi]
    ,[Rahoituskausi]
    ,[Kysely]
	,[Kysely tarkenne]
    ,[kyselyn_kohteet_arvo]
	,[Vahvistetut kyselyn kohteena olleet]
	,[Kyselyn kohteet (Rahoitus)]
	,[vastaajat_arvo]
    ,[Vahvistetut vastanneet]
    ,[Vastaajat (Rahoitus)]
    ,[vastaajamaaran_lahde]
    ,[Vastausosuus_arvo]
	,[vastausosuus_rahoitus]
	,katokorjauskerroin_rahoitus = 
		CASE 
			WHEN Rahoituskausi = '01.07.2018 - 30.06.2019' THEN
				CASE
					WHEN vastausosuus_rahoitus >= 0.8 THEN 1.0 / vastausosuus_rahoitus
					ELSE 1 + ((15.0/16.0) * vastausosuus_rahoitus) - ((25.0/32.0) * vastausosuus_rahoitus * vastausosuus_rahoitus)
				END
			ELSE 
				CASE
					WHEN vastausosuus_rahoitus >= 0.7 THEN 1.0 / vastausosuus_rahoitus
					WHEN vastausosuus_rahoitus <= 0.2 THEN (857.0/350.0)
					ELSE (1.0 / 0.70000000000000) + 2.04 * (0.7 - vastausosuus_rahoitus)
				END
		END

	,katokorjauskerroin_arvo =
		CASE 
			WHEN Rahoituskausi = '01.07.2018 - 30.06.2019' THEN
				CASE
					WHEN vastausosuus_arvo >= 0.8 THEN 1.0 / vastausosuus_arvo
					ELSE 1 + ((15.0/16.0) * vastausosuus_arvo) - ((25.0/32.0) * vastausosuus_arvo * vastausosuus_arvo)
				END
			ELSE
				CASE
					WHEN vastausosuus_arvo >= 0.7 THEN 1.0 / vastausosuus_arvo
					WHEN vastausosuus_arvo <= 0.2 THEN (857.0/350.0)
					ELSE (1.0 / 0.70000000000000) + 2.04 * (0.7 - vastausosuus_arvo)
				END
		END
	
--INTO dw.f_arvo_amis_vastausosuudet_kertoimet
FROM (
	SELECT 
		*
		,Vastausosuus_rahoitus = cast(nullif([Vastaajat (Rahoitus)],0) * 1.0 / (nullif([Kyselyn kohteet (Rahoitus)],0) * 1.0) as numeric(20,18))
		,Vastausosuus_arvo = cast(nullif([vastaajat_arvo],0) * 1.0 / (nullif([kyselyn_kohteet_arvo],0) * 1.0) as numeric(20,18))
			
	FROM (
		SELECT 
			*
			,[Kyselyn kohteet (Rahoitus)] = 
				CASE
					WHEN right([Rahoituskausi],4) > 2021 THEN [kyselyn_kohteet_arvo]
					ELSE [Vahvistetut kyselyn kohteena olleet]
				END
			,[Vastaajat (Rahoitus)] =
				CASE
					WHEN [Vahvistetut vastanneet] IS NULL THEN vastaajat_arvo
					WHEN vastaajat_arvo IS NULL THEN [Vahvistetut vastanneet] 
					WHEN [Vahvistetut vastanneet] <= vastaajat_arvo THEN [Vahvistetut vastanneet]
					WHEN [Vahvistetut vastanneet] > vastaajat_arvo THEN vastaajat_arvo
					ELSE 0 
				END
			,vastaajamaaran_lahde =
				CASE 
					WHEN [Vahvistetut vastanneet] IS NULL THEN 'Vastanneet (Arvo)'
					WHEN vastaajat_arvo IS NULL THEN 'Vastanneet (OPH)'
					WHEN [Vahvistetut vastanneet] = vastaajat_arvo THEN 'Sama'
					WHEN [Vahvistetut vastanneet] < vastaajat_arvo THEN 'Vastanneet (OPH)'
					WHEN [Vahvistetut vastanneet] > vastaajat_arvo THEN 'Vastanneet (Arvo)'
					ELSE 'Tuntematon' 
				END
		FROM (
			--vahvistettujen tietojen yhdistäminen arvon tietoihin
			SELECT distinct
				 organisaatio_koodi = ca2.org_koodi
				,Rahoituskausi = q1.Rahoituskausi
				,Kysely
				,[Kysely tarkenne]
				,kyselyn_kohteet_arvo = sum(kyselynkohteet_arvo)
				,[Vahvistetut kyselyn kohteena olleet] = sum([Vahvistetut kyselyn kohteena olleet])
				,vastaajat_arvo = sum(vastaajat_arvo)
				,[Vahvistetut vastanneet] = sum([Vahvistetut vastanneet] )
				
			FROM (
				--arvon tiedot
				SELECT distinct
					f.koulutustoimija
					,d3.rahoituskausi_amm						AS 'Rahoituskausi'
					,d5.kyselypohja_tarkenne_amis_fi			AS 'Kysely'
					,d5.kyselypohja_tarkenne_fi					AS 'Kysely tarkenne'
					,f2.kyselynkohteet_arvo
					,vastaajat_arvo = count(distinct vastaajaid)
				FROM dw.f_arvo_amis AS f
				LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
				LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
				LEFT JOIN (
					SELECT 
						kal.rahoituskausi_amm
						,f.ytunnus
						,kyselypohja_tarkenne_fi
						,SUM([vastaajatunnukset_lkm]) AS kyselynkohteet_arvo
					FROM [dw].[f_arvo_luodut_vastaajatunnukset] f 
					LEFT JOIN dw.d_kalenteri kal ON kal.kalenteri_avain = f.kuukausi
					LEFT JOIN dw.d_arvokyselykerta akk ON akk.kyselykertaid=f.kyselykertaid
					WHERE kal.rahoituskausi_amm is not null and datediff(month,kal.paivays,getdate()) >= 3 
					GROUP BY kal.rahoituskausi_amm, f.ytunnus, kyselypohja_tarkenne_fi
				) f2 ON f2.kyselypohja_tarkenne_fi = d5.kyselypohja_tarkenne_fi and f2.ytunnus = f.koulutustoimija and f2.rahoituskausi_amm = d3.rahoituskausi_amm --and coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi

				WHERE f.d_kalenteri_tunnus_luotu_id != '-1' and datediff(month,d3.paivays,getdate()) >= 3 
				GROUP BY f.koulutustoimija, d3.rahoituskausi_amm, d5.kyselypohja_tarkenne_amis_fi, d5.kyselypohja_tarkenne_fi, f2.kyselynkohteet_arvo
			) q1 

			LEFT JOIN [dw].[f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu] f3 ON f3.rahoituskausi = q1.Rahoituskausi AND f3.[Koulutuksen järjestäjän Y-tunnus] = q1.koulutustoimija
			CROSS APPLY (
				SELECT
					[Vahvistetut vastanneet] = 
						case 
							when q1.[Kysely tarkenne] = 'Aloittaneet' then f3.[Vastanneet (Aloitusvaiheenkysely)]
							when q1.[Kysely tarkenne] = 'Koko tutkinnon suorittaneet' then f3.[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]
							when q1.[Kysely tarkenne] = 'Tutkinnon osia suorittaneet' then f3.[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
						end
					,[Vahvistetut kyselyn kohteena olleet] = 
						case 
							when q1.[Kysely tarkenne] = 'Aloittaneet' then f3.[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]
							when q1.[Kysely tarkenne] = 'Koko tutkinnon suorittaneet' then f3.[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]
							when q1.[Kysely tarkenne] = 'Tutkinnon osia suorittaneet' then f3.[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
						end 
			) ca
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl ON jl.ytunnus_avain = q1.koulutustoimija
			CROSS APPLY (
				SELECT
					rahoituskausi_loppu = convert(date, right(q1.Rahoituskausi,10), 103)
			) ca1
			CROSS APPLY (
				SELECT
					org_koodi = case when cast(dateadd(year, -1, jl.voimaan_alkaen) as date) < ca1.rahoituskausi_loppu then jl.ytunnus_amos_spl else jl.ytunnus_avain end
			) ca2

			GROUP BY ca2.org_koodi,q1.Rahoituskausi,Kysely,[Kysely tarkenne]

		) q2 
	) q3
) q4
LEFT JOIN dw.d_organisaatioluokitus ol on ol.organisaatio_koodi = q4.organisaatio_koodi
ORDER BY q4.organisaatio_koodi, Rahoituskausi



UPDATE dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet
SET avain = CONCAT(id,'_',SUBSTRING(rahoituskausi,9,2))
