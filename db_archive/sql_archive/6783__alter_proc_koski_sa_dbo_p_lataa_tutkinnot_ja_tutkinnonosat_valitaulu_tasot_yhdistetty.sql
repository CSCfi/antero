USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 5.12.2022 17:18:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS


--TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

--INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]


SELECT 
	vuosi
	,kuukausi
	,sukupuoli = h.sukupuoli
	,aidinkieli = h.aidinkieli
	,ika = ca.ika
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
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
	,tutkinnot = count(distinct ca.tutkinto)
	,tutkinnon_osat = count(distinct suoritustason_tunniste)
	,osaamispisteet = sum(koulutusmoduuli_laajuus_arvo)

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
LEFT JOIN sa.sa_koski_henkilo h ON h.oppija_oid = f.oppija_oid
OUTER APPLY (
	SELECT 
		ika = vuosi-year(replace(syntymaaika,190,200))
		,suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
		,tutkinto = case when paataso = 1 and suorituksen_tyyppi = 'ammatillinentutkinto' then f.oppija_oid end
) ca

GROUP BY
	vuosi
	,kuukausi
	,h.sukupuoli
	,h.aidinkieli
	,ca.ika
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
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
