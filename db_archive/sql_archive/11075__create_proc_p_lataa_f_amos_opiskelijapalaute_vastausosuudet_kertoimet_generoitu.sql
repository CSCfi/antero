USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet_generoitu] AS

DECLARE @maxRahoituskausi varchar(24) = (select max(rahoituskausi) from dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet)
DECLARE @maxRahoituskausiEdellinen varchar(24) = (select max(rahoituskausi) from dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet where rahoituskausi != @maxRahoituskausi)
DECLARE @generoitavaRahoituskausi varchar(24) = case when month(getdate())-3 > 6 then @maxRahoituskausiEdellinen else @maxRahoituskausi end
DECLARE @minPvm date = (select datefromparts(right(@generoitavaRahoituskausi, 4) - 1, 7, 1))
DECLARE @maxPvm date = (select datefromparts(right(@generoitavaRahoituskausi, 4), 6, 30))
DECLARE @maxToteumaPvm date = least(eomonth(dateadd(month, -3, getdate())), @maxPvm)

DELETE FROM dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet
WHERE generoitu = 1

INSERT INTO dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet (	
	generoitu
	,[ytunnus]
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
SELECT 
	generoitu = 1
	,ytunnus_amos_spl
	,nimi_amos_spl
    ,[Rahoituskausi] = @generoitavaRahoituskausi
    ,[Kysely]
	,[Kysely tarkenne]
    ,[kyselyn_kohteet_arvo]
	,[Vahvistetut kyselyn kohteena olleet] = null
	,[Kyselyn kohteet (Rahoitus)] = [kyselyn_kohteet_arvo]
	,[vastaajat_arvo]
    ,[Vahvistetut vastanneet] = null
    ,[Vastaajat (Rahoitus)] = [vastaajat_arvo]
    ,[vastaajamaaran_lahde] = 'Vastanneet (Arvo)'
    ,[Vastausosuus_arvo]
	,[vastausosuus_rahoitus] = [Vastausosuus_arvo]
	,katokorjauskerroin_rahoitus = --katokorjauskerroin_arvo
		CASE
			WHEN vastausosuus_arvo >= 0.7 THEN 1.0 / vastausosuus_arvo
			WHEN vastausosuus_arvo <= 0.2 THEN (857.0/350.0)
			ELSE (1.0 / 0.7) + 2.04 * (0.7 - vastausosuus_arvo)
		END

	,katokorjauskerroin_arvo = 
		CASE
			WHEN vastausosuus_arvo >= 0.7 THEN 1.0 / vastausosuus_arvo
			WHEN vastausosuus_arvo <= 0.2 THEN (857.0/350.0)
			ELSE (1.0 / 0.7) + 2.04 * (0.7 - vastausosuus_arvo)
		END

FROM (

	SELECT 
		ytunnus_amos_spl
		,nimi_amos_spl
		,Kysely
		,[Kysely tarkenne]
		,kyselyn_kohteet_arvo = sum([kyselyn_kohteet_arvo])
		,vastaajat_arvo = sum([vastaajat_arvo])
		,Vastausosuus_arvo = cast(nullif(sum([vastaajat_arvo]),0) * 1.0 / (nullif(sum([kyselyn_kohteet_arvo]),0) * 1.0) as decimal(20,18))
		
	FROM (

		SELECT
			coalesce(jl.ytunnus_amos_spl, f.koulutustoimija)	AS 'ytunnus_amos_spl'
			,jl.nimi_amos_spl
			,d5.kyselypohja_tarkenne_amis_fi					AS 'Kysely'
			,d5.kyselypohja_tarkenne_fi							AS 'Kysely tarkenne'
			,f2.kyselyn_kohteet_arvo
			,vastaajat_arvo = count(distinct f.vastaajaid)

		FROM dw.f_arvo_amis AS f
		LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id AND d3.vuosi between 2000 and 2100
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl ON jl.ytunnus_avain = f.koulutustoimija
		LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
		LEFT JOIN (

			SELECT 
				coalesce(jl.ytunnus_amos_spl, f.ytunnus)	AS 'ytunnus_amos_spl'
				,kyselypohja_tarkenne_fi
				,SUM([vastaajatunnukset_lkm])				AS 'kyselyn_kohteet_arvo'

			FROM [dw].[f_arvo_luodut_vastaajatunnukset] f 
			LEFT JOIN dw.d_kalenteri kal ON kal.kalenteri_avain = f.kuukausi AND kal.vuosi between 2000 and 2100
			LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl ON jl.ytunnus_avain = f.ytunnus
			LEFT JOIN dw.d_arvokyselykerta akk ON akk.kyselykertaid = f.kyselykertaid

			WHERE kal.paivays between @minPvm and @maxToteumaPvm
				OR dateadd(year, 1, kal.paivays) between dateadd(day, 1, @maxToteumaPvm) and @maxPvm

			GROUP BY coalesce(jl.ytunnus_amos_spl, f.ytunnus), kyselypohja_tarkenne_fi

		) f2 
			ON f2.kyselypohja_tarkenne_fi = d5.kyselypohja_tarkenne_fi 
			AND f2.ytunnus_amos_spl = coalesce(jl.ytunnus_amos_spl, f.koulutustoimija) 

		WHERE d3.paivays between @minPvm and @maxToteumaPvm
			OR dateadd(year, 1, d3.paivays) between dateadd(day, 1, @maxToteumaPvm) and @maxPvm

		GROUP BY 
			coalesce(jl.ytunnus_amos_spl, f.koulutustoimija)
			,jl.nimi_amos_spl
			,d5.kyselypohja_tarkenne_amis_fi
			,d5.kyselypohja_tarkenne_fi
			,f2.kyselyn_kohteet_arvo

	) q1 

	GROUP BY q1.ytunnus_amos_spl, q1.nimi_amos_spl, Kysely, [Kysely tarkenne]

) q4

ORDER BY ytunnus_amos_spl

GO
