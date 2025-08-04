USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_perusopetuksen_paattotodistuksen_keskiarvot]    Script Date: 31.7.2025 10.04.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_perusopetuksen_paattotodistuksen_keskiarvot] AS

DROP TABLE IF EXISTS sa.perusopetuksen_paattotodistuksen_keskiarvot

SELECT 
	q.master_oid
	,q.vahvistus_paiva
	,q.suorituksen_tyyppi

	,[opiskelee_toiminta_alueittain] = COALESCE(MAX(opiskelee_toiminta_alueittain), 0)
	,[oppiaineita_yksilollistetty_lkm] = COUNT(DISTINCT CASE WHEN yksilollistetty = 1 THEN koulutusmoduuli_koodiarvo END)
	
	,[keskiarvo_lahde] = 'KOSKI'
	,[keskiarvo] = cast(avg(cast(case when lasketaan_keskiarvoon=1 then arvosana end as decimal)) as decimal(10,5))
	,[keskiarvo_lukuaineet] = cast(avg(cast(case when lasketaan_keskiarvoon=1 and lukuaine=1 then arvosana end as decimal)) as decimal(10,5))
	,[keskiarvo_mukautettu] = cast(avg(cast(case when yksilollistetty=1 and lasketaan_keskiarvoon=1 then 5 when lasketaan_keskiarvoon=1 then arvosana end as decimal)) as decimal(10,5))
	,[keskiarvo_lukuaineet_mukautettu] = cast(avg(cast(case when lasketaan_keskiarvoon=0 or lukuaine=0 then null when yksilollistetty=1 then 5 else arvosana end as decimal)) as decimal(10,5))
	
	--ks. lopun update
	,[keskiarvo_kategoria] = cast(null as int)
	,[keskiarvo_kategoria_lukuaineet] = cast(null as int)
	,[keskiarvo_kategoria_mukautettu] = cast(null as int)
	,[keskiarvo_kategoria_lukuaineet_mukautettu] = cast(null as int)
	--tuotetaan myös ODW:n yksilöllistämistä vastaava tieto
	,[oppiaineita_yksilollistetty_lukuaineet_ka] = coalesce(count(distinct case when yksilollistetty=1 and lasketaan_keskiarvoon=1 and lukuaine=1 then koulutusmoduuli_koodiarvo end), 0)
	,[oppiaineita_lukuaineet_ka] = coalesce(count(distinct case when lasketaan_keskiarvoon=1 and lukuaine=1 then koulutusmoduuli_koodiarvo end), 0)
	,[yksilollistaminen] = cast(null as varchar(50)) --Ei / Osin / Kokonaan / Alueittain

	,rnk = RANK() OVER (PARTITION BY master_oid ORDER BY vahvistus_paiva)
	,rnk_suorituksen_tyyppi = RANK() OVER (PARTITION BY master_oid, suorituksen_tyyppi ORDER BY vahvistus_paiva)

INTO sa.perusopetuksen_paattotodistuksen_keskiarvot

FROM (

	SELECT 
		 oo.master_oid
		,ps.vahvistus_paiva
		,ps.suorituksen_tyyppi
		,[opiskelee_toiminta_alueittain] = max(et.opiskelee_toiminta_alueittain)
		,os.koulutusmoduuli_koodiarvo
		,os.koulutusmoduuli_pakollinen
		,[lukuaine] = case when os.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU', 'FI', 'PS', 'OP', 'OPA', 'XX') then 1 else 0 end  --AOM? B3?
		-- huom. myös rajattu (CSCVIPUNEN-4538)
		,[yksilollistetty] = coalesce(max(0+coalesce(os.yksilollistetty_oppimaara,os.rajattu_oppimaara)), 0)
		--vain pakolliset hyväksytyt numeroarvosanat sekä yksilöllistetyt S-merkinnät keskiarvolaskentaan
		,[lasketaan_keskiarvoon] = max(
			case 
				when os.koulutusmoduuli_pakollinen = 1 
				and (
					os.arviointi_arvosana_koodiarvo in ('5','6','7','8','9','10')
					or (
						(os.yksilollistetty_oppimaara = 1 or os.rajattu_oppimaara = 1)
						and os.arviointi_arvosana_koodiarvo = 'S'
					)
				) 
				then 1
				else 0
			end
		)
		,[arvosana] = max(
			case 
				when os.koulutusmoduuli_pakollinen = 1 
				and (
					os.arviointi_arvosana_koodiarvo in ('5','6','7','8','9','10')
					or (
						(os.yksilollistetty_oppimaara = 1 or os.rajattu_oppimaara = 1)
						and os.arviointi_arvosana_koodiarvo = 'S'
					)
				) 
				then 0 + nullif(os.arviointi_arvosana_koodiarvo,'S')
			end
		)

	FROM [sa].[sa_koski_paatason_suoritus] ps
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus] oo ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos] et ON et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN [sa].[sa_koski_osasuoritus] os
		ON os.paatason_suoritus_id = ps.paatason_suoritus_id 
		AND os.suorituksen_tyyppi in ('perusopetuksenoppiaine', 'aikuistenperusopetuksenoppiaine', 'perusopetuksenlisaopetuksenoppiaine')
		AND os.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava'
		AND os.arviointi_hyvaksytty = 1

	WHERE 1=1
	AND ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara', 'perusopetuksenlisaopetus') --EB, ISH?
	AND ps.vahvistus_paiva is not null 

	GROUP BY oo.master_oid
		,ps.vahvistus_paiva
		,ps.suorituksen_tyyppi
		,os.koulutusmoduuli_koodiarvo
		,os.koulutusmoduuli_pakollinen

) q

GROUP BY q.master_oid
	,q.vahvistus_paiva
	,q.suorituksen_tyyppi
	

--päivitetään toiminta-alueittain opiskelleiden mukautetut keskiarvot
UPDATE sa.perusopetuksen_paattotodistuksen_keskiarvot
SET keskiarvo_mukautettu = 5
	,keskiarvo_lukuaineet_mukautettu = 5
WHERE [opiskelee_toiminta_alueittain] = 1

--päivitetään keskiarvojen (antero.dw.d_opintojen_kulku_keskiarvot) sekä yksilöllistämisen kategoriat
UPDATE sa.perusopetuksen_paattotodistuksen_keskiarvot
SET [keskiarvo_kategoria] = COALESCE(20 - CAST(keskiarvo / 0.5 as int), 99)
	,[keskiarvo_kategoria_lukuaineet] = COALESCE(20 - CAST(keskiarvo_lukuaineet / 0.5 as int), 99)
	,[keskiarvo_kategoria_mukautettu] = COALESCE(20 - CAST(keskiarvo_mukautettu / 0.5 as int), 99)
	,[keskiarvo_kategoria_lukuaineet_mukautettu] = COALESCE(20 - CAST(keskiarvo_lukuaineet_mukautettu / 0.5 as int), 99)
	,[yksilollistaminen] = 
		CASE
			WHEN [opiskelee_toiminta_alueittain] = 1 THEN 'Alueittain'
			WHEN [oppiaineita_yksilollistetty_lukuaineet_ka] = 0 THEN 'Ei'
			WHEN 2 * [oppiaineita_yksilollistetty_lukuaineet_ka] < [oppiaineita_lukuaineet_ka] THEN 'Osin' 
			WHEN 2 * [oppiaineita_yksilollistetty_lukuaineet_ka] >= [oppiaineita_lukuaineet_ka] THEN 'Kokonaan'
		END


CREATE NONCLUSTERED INDEX [NC_perusopetuksen_paattotodistuksen_keskiarvot] ON [sa].[perusopetuksen_paattotodistuksen_keskiarvot]
(
	master_oid
	,suorituksen_tyyppi
	,vahvistus_paiva
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO


