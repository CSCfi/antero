USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 23.8.2020 19:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus] as


DROP INDEX IF EXISTS [NonClusteredIndex-20200704-203941] ON [sa].[temp_opiskelijavuodet_paatason_suoritus]


DROP TABLE sa.temp_opiskelijavuodet_paatason_suoritus


SELECT
	 ps.opiskeluoikeus_oid
	,paatason_suoritus_id
	,ps.suorituksen_tyyppi
	,ps.koulutusmoduuli_koodiarvo
	,ps.koulutusmoduuli_koodisto
	,ps.tutkinto_koodiarvo
	,ps.osaamisala_koodiarvo
	,koulutusluokitus_koodi = case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo else null end --k.koulutusluokitus_koodi
	,kustannusryhma_oa = null --okr.kustannusryhma_koodi
	,kustannusryhma_tutk = null --tkr.kustannusryhma_koodi
	,ps.toimipiste_oid
	,rnk

INTO sa.temp_opiskelijavuodet_paatason_suoritus

FROM 
(

	SELECT distinct
		 pts.opiskeluoikeus_oid
		,paatason_suoritus_id
		,suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo
		,koulutusmoduuli_koodisto
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,RANK() OVER (PARTITION BY pts.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
	FROM [Koski_SA].sa.sa_koski_paatason_suoritus pts
	INNER JOIN Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid

) ps  
--LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
----kustannusryhmä
--LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi)

WHERE ps.rnk = 1


CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203941] ON [sa].[temp_opiskelijavuodet_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC
)
INCLUDE ( 	[suorituksen_tyyppi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
USE ANTERO