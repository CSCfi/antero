USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_paatason_suoritus]    Script Date: 14.7.2021 16:53:07 ******/
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
	,koulutusluokitus_koodi = case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo else null end --k.koulutusluokitus_koodi
	,kustannusryhma_oa = okr.kustannusryhma_koodi
	,kustannusryhma_tutk = tkr.kustannusryhma_koodi
	,kustannusryhma_tutk_uusi = tkr_u.kustannusryhma_koodi
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
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,perusteenDiaarinumero
		,ROW_NUMBER() OVER (PARTITION BY pts.opiskeluoikeus_oid ORDER BY pts.suorituksen_tyyppi,osaamisala_koodiarvo,pts.koulutusmoduuli_koodiarvo) as rnk 
	FROM sa.sa_koski_paatason_suoritus pts
	INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = pts.opiskeluoikeus_oid
	--LEFT JOIN sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = pts.paatason_suoritus_id
	
) ps  
LEFT JOIN ANTERO.dw.d_koulutusluokitus k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
--kustannusryhmä
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi)
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u ON tkr_u.tutkinto_koodi = COALESCE(k.uusi_eat_koodi,k.koulutusluokitus_koodi)

WHERE ps.rnk = 1


CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203941] ON [sa].[temp_opiskelijavuodet_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC
)
INCLUDE ( 	[suorituksen_tyyppi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]

GO
USE [ANTERO]