USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 19.12.2022 16:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS

--DROP TABLE IF EXISTS [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,vanha_koulutustoimija_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)


INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

SELECT
	oppilaitos_oid,
	koulutustoimija_oid,
	koulutustoimija_oid_hist,
	opiskeluoikeus_oid,
	ylempi_opiskeluoikeus_oid,
	paatason_suoritus_id,
	coalesce(
		CASE
			WHEN kuuluu_kaatoluokkaan = 1 THEN t.osasuoritus_id
			ELSE t.ylempi_osasuoritus_id
		END
	,t.osasuoritus_id) AS suoritustason_tunniste,
	arviointi_paiva,
	arviointi_paiva_muokattu,
	arviointi_paiva_muokattu_kuori,
	usean_tutkinnon_tutkinnonosa,
	usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
	minimi_kustannusryhma,
	yhteinen_tutkinnon_osa,
	kuuluu_kaatoluokkaan,
	koulutus_moduuli_laajuus_alle_yhden,
	koulutusmoduuli_koodiarvo, --= try_cast(koulutusmoduuli_koodiarvo as bigint),
	koulutusmoduuli_koodiarvo_paataso,
	koulutusmoduuli_koodiarvo_numeerinen,
	laajuus_puuttuu_eperusteista,

	COALESCE(
		CASE
			when laajuus_puuttuu_eperusteista=0 then coalesce(ep_tutkinnonosa_laajuus, ep2_tutkinnonosa_laajuus, koulutusmoduuli_laajuus_arvo)
			--jos laajuus koskesta, hyväksytään vain sallituissa rajoissa
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] < 5 then 0
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] > 15 then 15
			when laajuus_puuttuu_eperusteista=2 and [koulutusmoduuli_laajuus_arvo] > 25 then 25
			when laajuus_puuttuu_eperusteista=3 then 0
			else [koulutusmoduuli_laajuus_arvo]
		END
	,ep_tutkinnonosa_laajuus, 0) AS koulutusmoduuli_laajuus_arvo

	,koulutusmoduuli_laajuus_arvo as koulutusmoduuli_laajuus_arvo_alkup
	,suorituksen_tyyppi
	,suorittaa_koko_tutkintoa
	,osaamisalat
	,osaamisala_max

--INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

FROM   (

	SELECT --top 100000
		oo.oppilaitos_oid,
		coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) AS koulutustoimija_oid,
		coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid) AS koulutustoimija_oid_hist,
		os.opiskeluoikeus_oid AS opiskeluoikeus_oid,
		coalesce(oo.sisaltyy_opiskeluoikeuteen_oid, '') AS ylempi_opiskeluoikeus_oid,
		os.paatason_suoritus_id,
		os.osasuoritus_id,
		os.ylempi_osasuoritus_id,
		os.arviointi_paiva,
		arviointi_paiva_muokattu =
			CASE
				WHEN os.arviointi_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN os.arviointi_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE os.arviointi_paiva
			END,
		arviointi_paiva_muokattu_kuori =
			CASE
				WHEN os.arviointi_paiva < so.alkamispaiva THEN so.alkamispaiva
				WHEN os.arviointi_paiva > so.paattymispaiva THEN so.paattymispaiva
				ELSE os.arviointi_paiva
			END,
		os.arviointi_hyvaksytty,
		koulutus_moduuli_laajuus_alle_yhden = 
			CASE
				WHEN os.koulutusmoduuli_laajuus_arvo < 1 THEN 1
				ELSE 0
			END,
		os.koulutusmoduuli_laajuus_arvo,
		os.koulutusmoduuli_laajuus_yksikko,

		ep.tutkinnonosa_laajuus as ep_tutkinnonosa_laajuus,
		ep2.tutkinnonosa_laajuus as ep2_tutkinnonosa_laajuus,
		os.koulutusmoduuli_koodiarvo,
		coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as koulutusmoduuli_koodiarvo_paataso,
		ca.koulutusmoduuli_koodiarvo_numeerinen,

		--epu.kuuluu_useaan_tutkintoon as usean_tutkinnon_tutkinnonosa,
		--epu.kuuluu_eri_kustannusryhmiin as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		--epu.minimi_kustannusryhma,
		null as usean_tutkinnon_tutkinnonosa,
		null as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		null as minimi_kustannusryhma,

		yhteinen_tutkinnon_osa = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN (
				'101053', '101054', '101055', '101056',
				'400012', '400013', '400014' )
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1

				ELSE 0
			END,

		kuuluu_kaatoluokkaan = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN ( '1', '2' ) AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 1
				ELSE 0
			END,

		laajuus_puuttuu_eperusteista = 
			CASE
				--yhteinen tutkinnonosa
				WHEN os.koulutusmoduuli_koodiarvo IN ('101053', '101054', '101055', '101056', '400012', '400013', '400014') AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1
				/*
				WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi = 'ammatillinenkorkeakouluopintoja' THEN 1
				WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi in ('ammatillinenlukionopintoja','ammatillinenmuitaopintovalmiuksiatukeviaopintoja','ammatillisentutkinnonosanosaalue')	THEN 2
				*/
				--kaatoluokka 
				WHEN os.koulutusmoduuli_koodiarvo IN ('1', '2')	AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 3
				ELSE 0
			END

		,ps.suorituksen_tyyppi

		,ca.suorittaa_koko_tutkintoa
		,osaamisalat
		,osaamisala_max

	FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS os
	LEFT JOIN CTE AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--AP 1.10.2019 ao join linkitettyjen oikeuksien järjestäjän hakemiseen
	LEFT JOIN CTE AS so on so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	OUTER APPLY (
		SELECT 
			suorituksen_tyyppi
			,perusteenDiaarinumero
			,koulutusmoduuli_koodiarvo
			,osaamisalat = concat(min(ca.osaamisala),'|',max(ca.osaamisala))
			,osaamisala_max = max(ca.osaamisala) --raportilla näytettävä
		FROM sa.sa_amm_paatason_suoritus ps
		OUTER APPLY (SELECT osaamisala = cast(case when os.arviointi_paiva between coalesce(ps.osaamisala_alku,'1900-01-01') and coalesce(ps.osaamisala_loppu,'9999-12-31') then osaamisala_koodiarvo end as int)) ca
		WHERE 1=1
		and ps.paatason_suoritus_id = os.paatason_suoritus_id
		GROUP BY suorituksen_tyyppi,perusteenDiaarinumero,koulutusmoduuli_koodiarvo
	) ps
	OUTER APPLY (
		select 
			koulutusmoduuli_koodiarvo_numeerinen = try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as int)
			,suorittaa_koko_tutkintoa = case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 0 end
	) ca
	LEFT JOIN dbo.eperusteet_tutkinnonosa_osaamisala_laajuus ep ON ca.koulutusmoduuli_koodiarvo_numeerinen = ep.tutkinnonosa_koodi and ps.perusteenDiaarinumero = ep.diaarinumero and rn_osaamisala = 1
	--valinnaisia tutkinnon osia varten toinen join koska tutkinnon osa voi olla toisesta tutkinnosta
	LEFT JOIN dbo.eperusteet_tutkinnonosa_osaamisala_laajuus ep2 ON ca.koulutusmoduuli_koodiarvo_numeerinen = ep2.tutkinnonosa_koodi and ep2.rn2_osaamisala = 1
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = ps.koulutusmoduuli_koodiarvo

	WHERE os.osasuoritus_hylataan = 0 
	AND kl.tutkintotyyppi_koodi IN ('02','19','20')
	
) AS t


--kustannusryhmän määräytymiseen vaikuttavien kenttien laskenta
SELECT distinct
	ost.id
	,tutkinto_lkm = dense_rank() over (partition by ost.id order by os.tutkinto_koodi) + dense_rank() over (partition by ost.id order by os.tutkinto_koodi desc) - 1
	,min_kr_oa = min(okr.kustannusryhma_koodi) over (partition by ost.id)
	,min_kr = min(kr) over (partition by ost.id)
	,max_kr = max(kr) over (partition by ost.id)
	,po_maks = max(case when os.osaamisala_koodi in (select value from STRING_SPLIT(osaamisalat,'|')) and okr.kustannusryhma_koodi is not null and suorittaa_koko_tutkintoa=1 then 1 else 0 end) over (partition by ost.id)
INTO #temp_to_kr
FROM [Koski_SA].[sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] ost
INNER JOIN dbo.eperusteet_tutkinnonosa_osaamisala_laajuus os on os.tutkinnonosa_koodi = koulutusmoduuli_koodiarvo_numeerinen and arviointi_paiva between os.voimassaoloalkaa and coalesce(os.siirtymapaattyy, os.voimassaololoppuu)
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = os.tutkinto_koodi
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = os.osaamisala_koodi and arviointi_paiva between okr.alkupvm and coalesce(okr.loppupvm, '9999-12-31')
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and arviointi_paiva between tkr.alkupvm and coalesce(tkr.loppupvm, '9999-12-31') and tkr.kustannusryhma_koodi != 'vt'
OUTER APPLY (
	SELECT 
		kr = coalesce(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
) ca
WHERE yhteinen_tutkinnon_osa = 0 and ost.koulutusmoduuli_koodiarvo_numeerinen is not null


update sa.temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset 
set 
	usean_tutkinnon_tutkinnonosa = case when tutkinto_lkm > 1 then 1 else 0 end
	,usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = case when tutkinto_lkm > 1 and min_kr != max_kr then 1 else 0 end
	,minimi_kustannusryhma = case when po_maks = 1 and tutkinto_lkm = 1 then min_kr_oa else min_kr end
from #temp_to_kr t2
where temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset.id = t2.id

drop table if exists #temp_to_kr
