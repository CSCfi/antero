USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 7.3.2023 20:45:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--exec [sa].[p_lataa_sa_hoivaavustajat]

CREATE OR ALTER PROCEDURE [sa].[p_lataa_sa_hoivaavustajat] AS

--Pätevyyteen vaaditaan tutkinnon osat 106233 ja 106228, ne suorittaneilta katsotaan myös mahdollinen valmistuminen tutkinnosta 371101.

DROP TABLE IF EXISTS sa.sa_hoivaavustajat

SELECT
	q2.oppija_oid
	,[paatason_suoritus_id_106233]
	,[paatason_suoritus_id_106228]
	,[paatason_suoritus_id_patevyys] = case when pvm_106233 > pvm_106228 then paatason_suoritus_id_106233 else paatason_suoritus_id_106228 end
	,[paatason_suoritus_id_tutkinto] = pts.paatason_suoritus_id
	,[pvm_106233]
	,[pvm_106228]
	,[pvm_patevyys] = case when pvm_106233 > pvm_106228 then pvm_106233 else pvm_106228 end --(select max(pvm) from (values (pvm_106233), (pvm_106228)) as v(pvm))
	,[pvm_tutkinto] = pts.vahvistus_paiva

INTO sa.sa_hoivaavustajat

FROM (

	--tutkinnon osat
	SELECT 
		oppija_oid
		,[paatason_suoritus_id_106233] = min([paatason_suoritus_id_106233])
		,[paatason_suoritus_id_106228] = min([paatason_suoritus_id_106228])
		,[pvm_106233] = min([pvm_106233])
		,[pvm_106228] = min([pvm_106228])

	FROM (
		
		SELECT
			oo.oppija_oid
			--106233
			,[paatason_suoritus_id_106233] = case when os.koulutusmoduuli_koodiarvo = '106233' then os.paatason_suoritus_id end
			,[pvm_106233] = case when os.koulutusmoduuli_koodiarvo = '106233' then os.arviointi_paiva end
			,[rn_106233] = 
				row_number() over (
					partition by oo.oppija_oid 
					order by (case when os.koulutusmoduuli_koodiarvo = '106233' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)
			--106228
			,[paatason_suoritus_id_106228] = case when os.koulutusmoduuli_koodiarvo = '106228' then os.paatason_suoritus_id end
			,[pvm_106228] = case when os.koulutusmoduuli_koodiarvo = '106228' then os.arviointi_paiva end
			,[rn_106228] = 
				row_number() over (
					partition by oo.oppija_oid 
					order by (case when os.koulutusmoduuli_koodiarvo = '106228' then os.arviointi_paiva else '9999-01-01' end)
						,os.osasuoritus_id
				)

		FROM [sa].[sa_koski_osasuoritus] os
		JOIN sa.sa_koski_paatason_suoritus ps on ps.paatason_suoritus_id = os.paatason_suoritus_id
		JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

		WHERE os.koulutusmoduuli_koodiarvo in ('106233', '106228')
			and os.koulutusmoduuli_koodisto = 'tutkinnonosat'
			and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa'
			and os.arviointi_paiva is not null
			and os.arviointi_hyvaksytty = 1
	) q1

	WHERE rn_106233 = 1 or rn_106228 = 1
	GROUP BY oppija_oid
	HAVING min([pvm_106233]) is not null AND min([pvm_106228]) is not null

) q2

LEFT JOIN (

	--tutkinto
	SELECT 
		o.oppija_oid
		,p.paatason_suoritus_id
		,p.vahvistus_paiva
		,rn = row_number() over (partition by o.oppija_oid order by p.vahvistus_paiva, p.paatason_suoritus_id)

	FROM sa.sa_koski_paatason_suoritus p
	JOIN sa.sa_koski_opiskeluoikeus o on o.opiskeluoikeus_oid = p.opiskeluoikeus_oid

	WHERE p.koulutusmoduuli_koodiarvo = '371101' 
		and p.koulutusmoduuli_koodisto = 'koulutus' 
		and p.suorituksen_tyyppi = 'ammatillinentutkinto' 
		and p.vahvistus_paiva is not null

) pts on pts.oppija_oid = q2.oppija_oid and pts.rn = 1


GO


