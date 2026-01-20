USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 31.7.2025 10.46.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF @@SERVERNAME like '%pvipu%'
EXEC (
'
ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS

DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

SELECT 
	vuosi
	,kuukausi
	,sukupuoli = h.sukupuoli
	,aidinkieli = h.aidinkieli
	,ika = vuosi - year(h.syntymaaika)
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,oppilaitos_oid_pihvi
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi_koodi = ca.suorituksen_tyyppi_koodi
	,osaamisala_koodiarvo
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
	,tutkinnot = count(distinct ca.oppija_opiskeluoikeus) --opiskeluoikeus huomioitu niitä ei-duplikaatteja varten, joissa vain tutkintonimikkeissä eroja. JS 6.10.2023
	,tutkinnon_osat = count(distinct suoritustason_tunniste)
	,osaamispisteet = sum(koulutusmoduuli_laajuus_arvo)

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
LEFT JOIN sa.sa_koski_henkilo_master h ON h.master_oid = f.master_oid
OUTER APPLY (
	SELECT 
		suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when ''ammatillinentutkinto'' then 1 when ''ammatillinentutkintoosittainen'' then 2 else -1 end
		,oppija_opiskeluoikeus = case when paataso = 1 and suorituksen_tyyppi = ''ammatillinentutkinto'' then concat(f.master_oid,''|'',f.opiskeluoikeus_oid) end
) ca

WHERE 1=1
AND duplikaatti = 0 
AND paallekkainen_tuva = 0

GROUP BY
	vuosi
	,kuukausi
	,h.sukupuoli
	,h.aidinkieli
	,year(h.syntymaaika)
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,oppilaitos_oid_pihvi
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,ca.suorituksen_tyyppi_koodi
	,osaamisala_koodiarvo
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
'
)

GO
