USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 23.8.2020 19:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] as


DROP TABLE sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,tutkinnonosa_koodi = os_koulutusmoduuli_koodiarvo
	--,tutkinto_koodi = COALESCE(NULLIF(ps_koulutusmoduuli_koodiarvo,'999904'), tutkinto_koodiarvo)
	--,osaamisala_koodi = osaamisala_koodiarvo

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps_koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,os_koulutusmoduuli_koodiarvo = os.koulutusmoduuli_koodiarvo

	FROM Koski_SA.sa.sa_koski_paatason_suoritus ps
	inner join Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and osatutkinto = 1
	left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join Koski_SA.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa'

	where ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' 
	and year(ooa.loppu) >= 2018 
	and ooa.tila in ('loma','lasna','valmistunut')

) q

GO
USE ANTERO