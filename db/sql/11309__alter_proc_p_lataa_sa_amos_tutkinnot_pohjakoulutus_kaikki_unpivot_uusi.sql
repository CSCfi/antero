USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi] AS

TRUNCATE TABLE sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi

INSERT INTO sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi (
	rahoituskausi
	,suorituskausi
	,ytunnus
	,tutk_pohjakoul
	,tutk_ei_pohjakoul
	,tutk_yhteensa
	,pk_osuus
	,ei_pk_osuus
	,pk_osuus_kaikki
	,ei_pk_osuus_kaikki
	,source
)

SELECT 
	rahoituskausi
	,suorituskausi = tutkinnon_suorituskausi
	,ytunnus
	,tutk_pohjakoul = sum(pohjak_lkm)
	,tutk_ei_pohjakoul = sum(ei_pohjak_lkm) 
	,tutk_yhteensa = sum(yhteensa_lkm)
	,pk_osuus = cast(case when sum(yhteensa_lkm) > 0 then 1.0 * sum(pohjak_lkm) / sum(yhteensa_lkm) end as decimal(15,14))
	,ei_pk_osuus = cast(case when sum(yhteensa_lkm) > 0 then 1.0 * sum(ei_pohjak_lkm) / sum(yhteensa_lkm) end as decimal(15,14))
	--järjestäjäkohtaisen tiedon puuttuessa käytetään koko jakaumaa
	,pk_osuus_kaikki = cast(1.0 * sum(sum(pohjak_lkm)) over (partition by rahoituskausi, tutkinnon_suorituskausi) / sum(sum(yhteensa_lkm)) over (partition by rahoituskausi, tutkinnon_suorituskausi) as decimal(15,14))
	,ei_pk_osuus_kaikki = cast(1.0 * sum(sum(ei_pohjak_lkm)) over (partition by rahoituskausi, tutkinnon_suorituskausi) / sum(sum(yhteensa_lkm)) over (partition by rahoituskausi, tutkinnon_suorituskausi) as decimal(15,14))
	,source = 'p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi'

FROM (

	SELECT 
		rahoituskausi
		,tutkinnon_suorituskausi
		,ytunnus = coalesce(ytunnus_amos_spl, jarj)
		,pohjak_lkm = 
			case
				when tutk like 'ei_pohjakoul%' --or pohjakoul_yo = '1' 
					then 0
				else lkm
			end
		,ei_pohjak_lkm = 
			case
				when tutk like 'ei_pohjakoul%' --or pohjakoul_yo = '1' 
					then lkm
				else 0
			end 
		,yhteensa_lkm = lkm
 
	FROM [dw].[v_TK_K1_12d] v
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.jarj
	UNPIVOT
	(
		lkm for tutk in (
			[ei_pohjakoul_pt_kr1]
			,[ei_pohjakoul_pt_kr2]
			,[ei_pohjakoul_pt_kr3]
			,[ei_pohjakoul_pt_kr4]
			,[ei_pohjakoul_pt_kr5]
			,[ei_pohjakoul_pt_kr6]
			,[ei_pohjakoul_pt_kr7]
			,[ei_pohjakoul_at_eat_kr1]
			,[ei_pohjakoul_at_eat_kr2]
			,[ei_pohjakoul_at_eat_kr3]
			,[ei_pohjakoul_at_eat_kr4]
			,[ei_pohjakoul_at_eat_kr5]
			,[ei_pohjakoul_at_eat_kr6]
			,[ei_pohjakoul_at_eat_kr7]
			,[pohjakoul_pt_kr1]
			,[pohjakoul_pt_kr2]
			,[pohjakoul_pt_kr3]
			,[pohjakoul_pt_kr4]
			,[pohjakoul_pt_kr5]
			,[pohjakoul_pt_kr6]
			,[pohjakoul_pt_kr7]
			,[pohjakoul_at_eat_kr1]
			,[pohjakoul_at_eat_kr2]
			,[pohjakoul_at_eat_kr3]
			,[pohjakoul_at_eat_kr4]
			,[pohjakoul_at_eat_kr5]
			,[pohjakoul_at_eat_kr6]
			,[pohjakoul_at_eat_kr7]
		)
	) as unPvt

) q

WHERE yhteensa_lkm > 0

GROUP BY 
	rahoituskausi
	,tutkinnon_suorituskausi
	,ytunnus

GO
