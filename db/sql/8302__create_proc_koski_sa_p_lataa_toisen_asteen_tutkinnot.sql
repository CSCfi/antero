USE [Koski_SA]
GO

DROP PROCEDURE IF EXISTS [sa].[p_lataa_toisen_asteen_tutkinnot]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_tuva_lasna_loma_jaksot]    Script Date: 20.11.2023 11:25:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [sa].[p_lataa_toisen_asteen_tutkinnot] AS

DROP TABLE IF EXISTS [sa].toisen_asteen_tutkinnot 

SELECT DISTINCT
	oo.oppija_oid
	,ps.koulutusmoduuli_koodiarvo
	,ps.suorituksen_tyyppi
	,vahvistus_paiva = cast(ps.vahvistus_paiva as date)
	,rnk = rank() over (partition by oppija_oid order by ps.vahvistus_paiva, ps.suorituksen_tyyppi, ps.koulutusmoduuli_koodiarvo desc)
INTO sa.toisen_asteen_tutkinnot
FROM [sa].[sa_koski_opiskeluoikeus] oo
JOIN [sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
--LEFT JOIN [sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.tila_koodiarvo = 'valmistunut'
WHERE ps.vahvistus_paiva is not null
AND	(
	ps.suorituksen_tyyppi in ('ammatillinentutkinto','ylioppilastutkinto','ibtutkinto','diatutkintovaihe')
	OR (ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12')
	--eb
)


CREATE NONCLUSTERED INDEX [NC_toisen_asteen_tutkinnot] ON [sa].toisen_asteen_tutkinnot
(
	oppija_oid
	,vahvistus_paiva
	,rnk
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
