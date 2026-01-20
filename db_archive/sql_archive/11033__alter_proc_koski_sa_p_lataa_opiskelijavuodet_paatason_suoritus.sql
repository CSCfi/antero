USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] as

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_paatason_suoritus

SELECT
	 ps.opiskeluoikeus_oid
	,paatason_suoritus_id
	,ps.suorituksen_tyyppi
	,ps.koulutusmoduuli_koodiarvo
	,ps.koulutusmoduuli_koodisto
	,ps.tutkinto_koodiarvo
	,ps.osaamisala_koodiarvo
	,ps.suorituskieli_koodiarvo
	,koulutusluokitus_koodi = case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo else null end --k.koulutusluokitus_koodi
	,kustannusryhma_oa = okr.kustannusryhma_koodi
	,kustannusryhma_tutk = tkr.kustannusryhma_koodi
	,kustannusryhma_oa_uusi = okr_uusi.kustannusryhma_koodi
	,kustannusryhma_tutk_uusi = tkr_uusi.kustannusryhma_koodi
	,ps.toimipiste_oid
	,ps.perusteenDiaarinumero

INTO sa.temp_opiskelijavuodet_paatason_suoritus

FROM (

	SELECT --distinct
		 pts.opiskeluoikeus_oid
		,pts.paatason_suoritus_id
		,pts.suorituksen_tyyppi
		,pts.koulutusmoduuli_koodiarvo 
		,pts.koulutusmoduuli_koodisto
		,pts.suorituskieli_koodiarvo
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,perusteenDiaarinumero
		,oid.pvm
		--,ROW_NUMBER() OVER (PARTITION BY pts.opiskeluoikeus_oid ORDER BY pts.suorituksen_tyyppi,osaamisala_koodiarvo,pts.koulutusmoduuli_koodiarvo) as rnk
		,rnk = ROW_NUMBER() OVER (
			PARTITION BY pts.opiskeluoikeus_oid 
			ORDER BY pts.suorituksen_tyyppi
				,(case when oid.pvm between pts.osaamisala_alku and pts.osaamisala_loppu then pts.osaamisala_alku end) desc
				,(case when pts.osaamisala_loppu < oid.pvm then pts.osaamisala_loppu end) desc
				,(case when pts.osaamisala_alku < oid.pvm then pts.osaamisala_alku end) desc
				,pts.osaamisala_koodiarvo desc
				,pts.koulutusmoduuli_koodiarvo
		) 
	FROM sa.sa_koski_paatason_suoritus pts
	INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid
	--LEFT JOIN sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = pts.paatason_suoritus_id
	
) ps  
LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
--kustannusryhmä
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo and year(ps.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi) and year(ps.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))
--uudet
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi okr_uusi ON okr_uusi.osaamisala_koodi = ps.osaamisala_koodiarvo and year(ps.pvm) between year(okr_uusi.alkupvm) and year(coalesce(okr_uusi.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi tkr_uusi ON tkr_uusi.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi) and year(ps.pvm) between year(tkr_uusi.alkupvm) and year(coalesce(tkr_uusi.loppupvm,'9999-12-31'))

WHERE ps.rnk = 1


CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203941] ON [sa].[temp_opiskelijavuodet_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC
)
INCLUDE ( 	[suorituksen_tyyppi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]

GO
