USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi] AS

--lopulta K1.12d poimitaan rahoituskausittain, mikä tuolloin huomioitava alla sekä jatkolatausten liitoksissa.

TRUNCATE TABLE sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi

INSERT INTO sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi (
	suorituskausi
	,ytunnus
	,tutktyyppi
	,tutk_pohjakoul
	,tutk_ei_pohjakoul
	,tutk_yhteensa
	,pk_osuus
	,ei_pk_osuus
	,tutk_pohjakoul_kaikki
	,tutk_ei_pohjakoul_kaikki
	,tutk_yhteensa_kaikki
	,pk_osuus_kaikki
	,ei_pk_osuus_kaikki
	,source
)

SELECT
	suorituskausi
	,ytunnus
	,tutktyyppi
	,tutk_pohjakoul = sum(pohjak_lkm)
	,tutk_ei_pohjakoul = sum(ei_pohjak_lkm) 
	,tutk_yhteensa = sum(yhteensa_lkm)
	,pk_osuus = case when sum(yhteensa_lkm) > 0 then sum(pohjak_lkm) / sum(yhteensa_lkm) end
	,ei_pk_osuus = case when sum(yhteensa_lkm) > 0 then sum(ei_pohjak_lkm) / sum(yhteensa_lkm) end
	--järjestäjäkohtaisen tiedon puuttuessa käytetään koko jakaumaa
	,tutk_pohjakoul_kaikki = sum(sum(pohjak_lkm)) over (partition by suorituskausi, tutktyyppi)
	,tutk_ei_pohjakoul_kaikki = sum(sum(ei_pohjak_lkm)) over (partition by suorituskausi, tutktyyppi)
	,tutk_yhteensa_kaikki = sum(sum(yhteensa_lkm)) over (partition by suorituskausi, tutktyyppi)
	,pk_osuus_kaikki = sum(sum(pohjak_lkm)) over (partition by suorituskausi, tutktyyppi) / sum(sum(yhteensa_lkm)) over (partition by suorituskausi, tutktyyppi)
	,ei_pk_osuus_kaikki = sum(sum(ei_pohjak_lkm)) over (partition by suorituskausi, tutktyyppi) / sum(sum(yhteensa_lkm)) over (partition by suorituskausi, tutktyyppi)
	,source = 'p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi'

FROM (

	SELECT 
		suorituskausi = concat('01.07.', tilv-1, ' - ', '30.06.', tilv)
		,ytunnus = coalesce(ytunnus_amos_spl, jarj)
		,tutktyyppi = 
			case 
				when tutk like '%_pt_%' then '02'
				else '19_20'
			end

		,pohjak_lkm = cast(
			case
				when tutk like 'ei_pohjakoul%' or pohjakoul_yo = '1' then 0
				else lkm
			end
		as decimal(20,10))
		,ei_pohjak_lkm = cast(
			case
				when tutk like 'ei_pohjakoul%' or pohjakoul_yo = '1' then lkm
				else 0
			end 
		as decimal(20,10))
		,yhteensa_lkm = cast(lkm as decimal(20,10))
 
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
			,[ei_pohjakoul_at_eat_kr1]
			,[ei_pohjakoul_at_eat_kr2]
			,[ei_pohjakoul_at_eat_kr3]
			,[ei_pohjakoul_at_eat_kr4]
			,[ei_pohjakoul_at_eat_kr5]
			,[pohjakoul_pt_kr1]
			,[pohjakoul_pt_kr2]
			,[pohjakoul_pt_kr3]
			,[pohjakoul_pt_kr4]
			,[pohjakoul_pt_kr5]
			,[pohjakoul_at_eat_kr1]
			,[pohjakoul_at_eat_kr2]
			,[pohjakoul_at_eat_kr3]
			,[pohjakoul_at_eat_kr4]
			,[pohjakoul_at_eat_kr5]
		)
	) as unPvt

) q

GROUP BY suorituskausi, ytunnus, tutktyyppi

GO
