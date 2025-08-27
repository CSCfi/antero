USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_toisen_asteen_tutkinnot] AS

DROP TABLE IF EXISTS sa.toisen_asteen_tutkinnot

SELECT DISTINCT
	h.oppija_oid
	,h.master_oid
	,ps.koulutusmoduuli_koodiarvo
	,ps.suorituksen_tyyppi
	,sektori = case ps.suorituksen_tyyppi when 'ammatillinentutkinto' then 'ammatillinen' else 'lukio' end
	,vahvistus_paiva = cast(ps.vahvistus_paiva as date)
	,oa.lukion_oppimaaran_vahvistus_paiva
	,rnk = rank() over (partition by h.master_oid order by ps.vahvistus_paiva, ps.suorituksen_tyyppi, ps.koulutusmoduuli_koodiarvo desc)
	,rnk_sektori = rank() over (partition by h.master_oid, case ps.suorituksen_tyyppi when 'ammatillinentutkinto' then 'ammatillinen' else 'lukio' end order by ps.vahvistus_paiva, ps.koulutusmoduuli_koodiarvo desc)
INTO sa.toisen_asteen_tutkinnot

FROM [sa].[sa_koski_henkilo] h 
LEFT JOIN [sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = h.oppija_oid
LEFT JOIN [sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
OUTER APPLY (
	SELECT lukion_oppimaaran_vahvistus_paiva = min(cast(ps2.vahvistus_paiva as date))
	FROM [sa].[sa_koski_henkilo] h2
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus] oo2 on oo2.oppija_oid = h2.oppija_oid
	LEFT JOIN [sa].[sa_koski_paatason_suoritus] ps2 on ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid
	WHERE h2.master_oid = h.master_oid
	AND ps2.suorituksen_tyyppi = 'lukionoppimaara'
) oa

WHERE ps.vahvistus_paiva is not null
AND (
	ps.suorituksen_tyyppi in ('ammatillinentutkinto','ylioppilastutkinto','ibtutkinto','diatutkintovaihe')
	OR (ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12')
	--eb
)


CREATE NONCLUSTERED INDEX [NC_toisen_asteen_tutkinnot] ON [sa].toisen_asteen_tutkinnot
(
	oppija_oid
	,master_oid
	,vahvistus_paiva
	,lukion_oppimaaran_vahvistus_paiva
	,rnk
	,rnk_sektori
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
