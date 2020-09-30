USE [Koski_SA]
GO


/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 15.9.2020 9:03:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS


--TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

--INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]


SELECT 
	vuosi
	,kuukausi
	,sukupuoli = 
		CASE 
			WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '2' 
			WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '1' 
			ELSE NULL 
		END
	,aidinkieli = h.aidinkieli
	,ika = vuosi-YEAR(REPLACE(syntymaaika,190,200))
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
	,paatason_suoritus_id
	,tutkinto = case when paataso=1 and suorituksen_tyyppi = 'ammatillinentutkinto' then opiskeluoikeus_oid else null end
	,tutkinnon_osa = suoritustason_tunniste
	,laajuus = koulutusmoduuli_laajuus_arvo
	,kustannusryhma_koodi_uusi

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
LEFT JOIN sa.sa_koski_henkilo h ON h.oppija_oid = f.oppija_oid


GO
USE ANTERO

