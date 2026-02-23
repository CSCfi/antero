USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_palautteet_esilataus] AS

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_palautteet]

SELECT
	defaultorder = 
		row_number() over (
			order by 
				varainhoitovuosi desc,
				[Koulutuksen järjestäjä],
				tilastokausi desc, tilastovuosi desc, tilastokuukausi desc, kysely, [Kyselyn kohderyhmä]
		)
	
	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
	,oppilaitos
	,toimipiste
	
	,varainhoitovuosi
	,rahoituskausi
	,tilastovuosi
	,tilastokuukausi = nullif([jarjestys Tilastokuukausi], '99')

	,kysely
	,kyselyn_kohderyhma = [Kyselyn kohderyhmä]

	,tutkinto
	
	--k/e
	,huomioidaan_rahoituksessa_kylla_ei = cast(case when [Järjestäjärakenne] = 'Viimeisin suoritepäätös'then 1 else 0 end as bit)
	,jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei = cast(case when [Järjestäjärakenne] = 'Viimeisin suoritepäätös' then 1 else 0 end as bit)
	,toiminnanohjauksen_kokeilu_kylla_ei = cast(case when left([Toiminnanohjauksen kokeilu], 2) = 'Ei' or [Toiminnanohjauksen kokeilu] = 'Tieto puuttuu' then 0 else 1 end as bit)

	--koodit
	,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu = case when right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) in ('P','I','L','K','E') then right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) end
	,koodit_koulutuksen_jarjestaja = [Koodit Koulutuksen järjestäjä]
	,koodit_oppilaitos = [Koodit Oppilaitos]
	,koodit_toimipiste_oid = [Koodit Toimipiste (OID)]
	,koodit_tutkinto = [Koodit Tutkinto]
	
	--lkm
    ,kyselyn_kohteet_lkm = kohteet
	,vastanneet_lkm = vastanneet
	,pisteet_lkm = pisteet
	,painotetut_pisteet_lkm = painotetut_pisteet
	,kyselyn_rahoitusosuus = cast(null as decimal(30,29))

INTO [dw].[api_amm_rahoitus_palautteet]

FROM [ANTERO].[dw].[v_amos_palautteet]

WHERE [Toteuma/Estimaatti] = 'Toteuma'
;


UPDATE t
SET kyselyn_rahoitusosuus = 
		case 
			when coalesce(painotetut_pisteet_lkm, pisteet_lkm) > 0.0
			then cast(coalesce(painotetut_pisteet_lkm, pisteet_lkm) as decimal(15,7))
				/ cast(
					case kysely
						when 'Aloituskysely' then sum_aloituskysely
						when 'Päättökysely' then sum_paattokysely
						when 'Työpaikkaohjaajakysely' then sum_tyopaikkaohjaajakysely
						when 'Työpaikkakysely' then sum_tyopaikkakysely
					end
					as decimal(20,7)
				)
		end

FROM [dw].[api_amm_rahoitus_palautteet] t
OUTER APPLY (
	SELECT 
		sum_aloituskysely = sum(case when kysely = 'Aloituskysely' then coalesce(painotetut_pisteet_lkm, pisteet_lkm) end)
		,sum_paattokysely = sum(case when kysely = 'Päättökysely' then coalesce(painotetut_pisteet_lkm, pisteet_lkm) end)
		,sum_tyopaikkaohjaajakysely = sum(case when kysely = 'Työpaikkaohjaajakysely' then coalesce(painotetut_pisteet_lkm, pisteet_lkm) end)
		,sum_tyopaikkakysely = sum(case when kysely = 'Työpaikkakysely' then coalesce(painotetut_pisteet_lkm, pisteet_lkm) end)
	FROM [dw].[api_amm_rahoitus_palautteet]	
	
	WHERE 1=1
	AND varainhoitovuosi = t.varainhoitovuosi
	AND huomioidaan_rahoituksessa_kylla_ei = 1 
) q

WHERE t.huomioidaan_rahoituksessa_kylla_ei = 1

GO
