USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hoivaavustajat]    Script Date: 29.7.2025 17.43.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_sa_hoivaavustajat] AS

/*
Hoiva-avustajan pätevyyteen vaadittavat tutkinnon osat per tutkintoperusteiden diaarinumero:
1) OPH-5085-2021
- 106233 Kasvun ja osallisuuden edistäminen (25 osp) 
- 106228 Ikääntyvien osallisuuden edistäminen (35 osp)
2) OPH-4417-2023
- 107502 Asiakkaan kohtaaminen ja ohjaaminen, 20 osp
- 107520 Hyvinvoinnin ja toimintakyvyn edistäminen, 25 osp
- 107510 Asiakkaan toimintakyvyn vahvistaminen, 15 osp

Pätevöityneiltä katsotaan myös mahdollinen valmistuminen tutkinnosta 371101 Sosiaali- ja terveysalan perustutkinto.
*/

DROP TABLE IF EXISTS sa.sa_hoivaavustajat

SELECT
	pat.master_oid
	
	,tutkinnon_perusteiden_voimaantulo = 
		case 
			when pvm_107502_107520_107510 <= coalesce(pvm_106233_106228, '9999-01-01') then '1.8.2024'
			when pvm_106233_106228 < coalesce(pvm_107502_107520_107510, '9999-01-01') then '1.8.2022'
		end

	,paatason_suoritus_id_patevyys = 
		case
			when pvm_107502_107520_107510 <= coalesce(pvm_106233_106228, '9999-01-01') then 
				case pvm_107502_107520_107510
					when pvm_107510 then paatason_suoritus_id_107510
					when pvm_107502 then paatason_suoritus_id_107502
					when pvm_107520 then paatason_suoritus_id_107520
				end
			when pvm_106233_106228 < coalesce(pvm_107502_107520_107510, '9999-01-01') then 
				case pvm_106233_106228
					when pvm_106228 then paatason_suoritus_id_106228
					when pvm_106233 then paatason_suoritus_id_106233
				end
		end
	,paatason_suoritus_id_tutkinto = tutk.paatason_suoritus_id

	,pvm_patevyys = least(pvm_107502_107520_107510, pvm_106233_106228)
	,pvm_tutkinto = tutk.vahvistus_paiva

INTO sa.sa_hoivaavustajat

FROM (

	--pätevyys
	SELECT 
		master_oid
		,[paatason_suoritus_id_106233] = min([paatason_suoritus_id_106233])
		,[paatason_suoritus_id_106228] = min([paatason_suoritus_id_106228])
		,[paatason_suoritus_id_107502] = min([paatason_suoritus_id_107502])
		,[paatason_suoritus_id_107520] = min([paatason_suoritus_id_107520])
		,[paatason_suoritus_id_107510] = min([paatason_suoritus_id_107510])
		,[pvm_106233] = min([pvm_106233])
		,[pvm_106228] = min([pvm_106228])
		,[pvm_106233_106228] = 
			case 
				when min([pvm_106233]) is not null and min([pvm_106228]) is not null 
				then greatest(min([pvm_106233]), min([pvm_106228])) 
			end
		,[pvm_107502] = min([pvm_107502])
		,[pvm_107520] = min([pvm_107520])
		,[pvm_107510] = min([pvm_107510])
		,[pvm_107502_107520_107510] = 
			case 
				when min([pvm_107502]) is not null and min([pvm_107520]) is not null and min([pvm_107510]) is not null 
				then greatest(min([pvm_107502]), min([pvm_107520]), min([pvm_107510])) 
			end

	FROM (
		
		SELECT
			oo.master_oid

			--106233
			,[paatason_suoritus_id_106233] = case when os.koulutusmoduuli_koodiarvo = '106233' then os.paatason_suoritus_id end
			,[pvm_106233] = case when os.koulutusmoduuli_koodiarvo = '106233' then os.arviointi_paiva end
			,[rn_106233] = 
				row_number() over (
					partition by oo.master_oid 
					order by 
						(case when os.koulutusmoduuli_koodiarvo = '106233' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

			--106228
			,[paatason_suoritus_id_106228] = case when os.koulutusmoduuli_koodiarvo = '106228' then os.paatason_suoritus_id end
			,[pvm_106228] = case when os.koulutusmoduuli_koodiarvo = '106228' then os.arviointi_paiva end
			,[rn_106228] = 
				row_number() over (
					partition by oo.master_oid 
					order by 
						(case when os.koulutusmoduuli_koodiarvo = '106228' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

			--107502
			,[paatason_suoritus_id_107502] = case when os.koulutusmoduuli_koodiarvo = '107502' then os.paatason_suoritus_id end
			,[pvm_107502] = case when os.koulutusmoduuli_koodiarvo = '107502' then os.arviointi_paiva end
			,[rn_107502] = 
				row_number() over (
					partition by oo.master_oid 
					order by 
						(case when os.koulutusmoduuli_koodiarvo = '107502' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

			--107520
			,[paatason_suoritus_id_107520] = case when os.koulutusmoduuli_koodiarvo = '107520' then os.paatason_suoritus_id end
			,[pvm_107520] = case when os.koulutusmoduuli_koodiarvo = '107520' then os.arviointi_paiva end
			,[rn_107520] = 
				row_number() over (
					partition by oo.master_oid 
					order by 
						(case when os.koulutusmoduuli_koodiarvo = '107520' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

			--107510
			,[paatason_suoritus_id_107510] = case when os.koulutusmoduuli_koodiarvo = '107510' then os.paatason_suoritus_id end
			,[pvm_107510] = case when os.koulutusmoduuli_koodiarvo = '107510' then os.arviointi_paiva end
			,[rn_107510] = 
				row_number() over (
					partition by oo.master_oid 
					order by 
						(case when os.koulutusmoduuli_koodiarvo = '107510' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

		FROM [sa].[sa_koski_osasuoritus] os
		JOIN sa.sa_koski_paatason_suoritus ps ON ps.paatason_suoritus_id = os.paatason_suoritus_id
		JOIN sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

		WHERE 1=1
		AND os.koulutusmoduuli_koodiarvo in ('106233', '106228', '107502', '107520', '107510')
		AND os.koulutusmoduuli_koodisto = 'tutkinnonosat'
		AND os.suorituksen_tyyppi = 'ammatillisentutkinnonosa'
		AND os.arviointi_paiva is not null
		AND os.arviointi_hyvaksytty = 1

	) q

	WHERE rn_106233 = 1 OR rn_106228 = 1 OR rn_107502 = 1 OR rn_107520 = 1 OR rn_107510 = 1 

	GROUP BY master_oid

	HAVING (
		min([pvm_106233]) is not null 
		AND min([pvm_106228]) is not null
	)
	OR (
		min([pvm_107502]) is not null 
		AND min([pvm_107520]) is not null 
		AND min([pvm_107510]) is not null
	)

) pat

LEFT JOIN (

	--tutkinto
	SELECT 
		oo.master_oid
		,ps.paatason_suoritus_id
		,ps.vahvistus_paiva
		,rn = row_number() over (partition by oo.master_oid order by ps.vahvistus_paiva, ps.paatason_suoritus_id)

	FROM sa.sa_koski_paatason_suoritus ps
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

	WHERE 1=1
	AND ps.koulutusmoduuli_koodiarvo = '371101' 
	AND ps.koulutusmoduuli_koodisto = 'koulutus' 
	AND ps.suorituksen_tyyppi = 'ammatillinentutkinto' 
	AND ps.vahvistus_paiva is not null

) tutk ON tutk.master_oid = pat.master_oid AND tutk.rn = 1

GO
