USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 9.3.2022 16:46:31 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 9.3.2022 16:46:31 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 9.3.2022 16:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] AS' 
END
GO







ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] @minVuosi int = 2018, @maxVuosi int = NULL AS



--4 §
--Tutkintojen ja tutkinnon osien kustannusryhmän määräytyminen
--Tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, johon tutkinnon osa tutkinnon perusteiden mukaisesti kuuluu.
--Ammatillisesta koulutuksesta annetun lain 13 §:n 2 momentissa tarkoitetut yhteiset tutkinnon osat kuuluvat kuitenkin kustannusryhmään 1.

--Jos tutkinnon osa voi tutkinnon perusteiden mukaisesti kuulua useaan tutkintoon, jotka kuuluvat eri kustannusryhmiin,
--tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, jota opiskelija suorittaa.
--Jos opiskelijan tavoitteena on suorittaa vain tutkinnon osa tai osia, tässä momentissa tarkoitettu tutkinnon osa kuuluu kustannusryhmään 1.

-- Erityistä: neljällä tutkinnolla on kahteen kustannusryhmään kuuluvia osaamisaloja, joten niiden kustannusryhmiä ei haeta kr-taulusta,
-- ..poikkeavat osaamisalat liputetaan laatukontrollia varten sisemmässä kyselyssä, ulommassa kyselyssä..
-- .. kovakoodataan poikkeukset tutkinnon varsinaisesta kustannusryhmästä, case when t.osaamisala_koodiarvo in.....
-- 12.3 päivitetty Sepon lisäykset poikkeaviin osaamisalakoodeihin, meili torstai 7. maaliskuuta 2019 15.09
-- 13.3 toimipiste_nimi pudotettu pois, sisältää historiatietoa eli samalla oidilla voi olla useita nimiversioita, sotkee raportin
-- 2.4. kustannusryhmä liputettu poikkeavaksi jos ei suorita koko tutkintoa

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,lisatiedot_koulutusvienti
		,koulutustoimija_oid
		,vanha_koulutustoimija_oid
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
	AND lisatiedot_koulutusvienti = 0
)

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

SELECT

	t.toimipiste_oid,
	t.oppilaitos_oid,
	t.koulutustoimija_oid,
	t.koulutustoimija_oid_hist,
	t.koulutustoimija_oid_pihvi,
	t.koulutustoimija_oid_pihvi_hist,
	t.opiskeluoikeus_oid,
	t.ylempi_opiskeluoikeus_oid,
	t.paatason_suoritus_id,
	coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo) AS tutkinto_koodi, 
	osaamisala_koodiarvo, --t.osaamisala_koodiarvo,
	--tutkinto_ja_osaamisala_koodi, --t.tutkinto_ja_osaamisala_koodi,
	--atok.tutkinto_ja_osaamisala_koodi as eper_tutkinto_ja_osaamisala_koodi,

	t.diaarinumero,
	NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
	NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
	t.suorituksen_tyyppi,
	t.suorituskieli_koodiarvo,

	case
		WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
		else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
	end 
	AS kustannusryhma_koodi,

	--atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
	t.suorittaa_koko_tutkintoa,
	kl.tutkintotyyppi_koodi,
	kl.tutkintotyyppi_fi,
	kl.koulutusluokitus_fi,
	t.vahvistus_paiva,
	t.vahvistus_paiva_muokattu
	,t.vahvistus_paiva_muokattu_kuori
	--,case
	--	WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
	--	else coalesce(sa1.kustannusryhma_koodi, sa3.kustannusryhma_koodi)
	--end 
	--AS kustannusryhma_koodi_uusi

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

FROM   (

	SELECT distinct
			
		diaarinumero = ps.perusteenDiaarinumero,
		ps.toimipiste_oid,
		oo.oppilaitos_oid,
		koulutustoimija_oid = coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid),
		koulutustoimija_oid_hist = case when so.koulutustoimija_oid is null then oo.vanha_koulutustoimija_oid else so.vanha_koulutustoimija_oid end,--coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid),
		koulutustoimija_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end,
		koulutustoimija_oid_pihvi_hist = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end,
		ps.opiskeluoikeus_oid,
		ylempi_opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid,
		ps.paatason_suoritus_id,
		suorittaa_koko_tutkintoa = 
			CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
			END,
		ps.koulutusmoduuli_koodiarvo,
		ps.osaamisala_koodiarvo,
		tutkinto_ja_osaamisala_koodi = 
			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
			END,
		ps.suorituksen_tyyppi,
		ps.suorituskieli_koodiarvo,
		ps.vahvistus_paiva,
		vahvistus_paiva_muokattu = 
			CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		vahvistus_paiva_muokattu_kuori = 
			CASE
				WHEN ps.vahvistus_paiva < so.alkamispaiva THEN so.alkamispaiva
				WHEN ps.vahvistus_paiva > so.paattymispaiva THEN so.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		rnk = RANK() OVER (PARTITION BY paatason_suoritus_id ORDER BY osaamisala_koodiarvo,(case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end))
	

	FROM CTE AS oo
	LEFT JOIN CTE AS oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
	LEFT JOIN sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
	--AND year(ps.vahvistus_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
				

) AS t

--LEFT JOIN (SELECT DISTINCT tutkinto_ja_osaamisala_koodi, tutkinto_kustannusryhma_koodi FROM dbo.kustannusryhma_tutkinto_ja_osaamisala) atok on atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi and year(vahvistus_paiva) between year(sa1.alkupvm)and year(coalesce(sa1.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and year(vahvistus_paiva) between year(sa2.alkupvm) and year(coalesce(sa2.loppupvm,'9999-12-31'))
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi sa3 on sa3.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE rnk=1

GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 9.3.2022 16:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS' 
END
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS

-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen ##
-- Logiikka: poimitaan osasuoritukset opiskeluoikeuksittain..
-- .. toiseen opiskeluoikeuteen sisältyvät suoritukset niputetaan emo-oikeuden eli ylemmän osasuorituksen alle
-- .. tätä varten on luotu uusi raportointikäsite "suoritustason_tunniste", jolla suoritusten kpl-määrä voidaan laskea
-- Aikarajaus tehdään arviointipäivän avulla, mutta tässä kyselyssä ei karsita rivejä, ainoastaan liputetaan osuminen raportointivuoteen..
-- .. varsinainen aikarajaus tehdään kun osasuoritus yhdistetään päätason tauluun, jonka vahvistus_paiva -arvo on vaihtoehtoinen hyväksymiskriteeri
-- Yhteinen tutkinnonosa liputetaan täällä myöhempää kustannusryhmittelyä varten


DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

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

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

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
	kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
	tutkinto_johon_tutkinnonosa_kuuluu,
	osaamisala_johon_tutkinnonosa_kuuluu,
	yhteinen_tutkinnon_osa,
	--toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
	kuuluu_kaatoluokkaan,
	koulutus_moduuli_laajuus_alle_yhden,
	koulutusmoduuli_koodiarvo,
	koulutusmoduuli_koodiarvo_paataso,
	koulutusmoduuli_koodiarvo_numeerinen,
	laajuus_puuttuu_eperusteista,

	COALESCE(
		CASE
			when laajuus_puuttuu_eperusteista=0 then isnull(ep_tutkinnonosa_laajuus, koulutusmoduuli_laajuus_arvo)
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
	--,usean_tutkinnon_tutkinnonosa_usea_kustannusryhma_uusi
	--,kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

FROM   (

	SELECT 
		oo.oppilaitos_oid,
		coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) AS koulutustoimija_oid,
		coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid) AS koulutustoimija_oid_hist,
		os.opiskeluoikeus_oid AS opiskeluoikeus_oid,
		coalesce(oo.sisaltyy_opiskeluoikeuteen_oid, '') AS ylempi_opiskeluoikeus_oid,
		os.paatason_suoritus_id,
		os.osasuoritus_id,
		os.ylempi_osasuoritus_id,
		os.arviointi_paiva,
		--AP 2.8.2019 tällä varmistetaan se, että arviointipäivä mappaantuu myöhemmin johonkin aikajaksoon
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
		os.koulutusmoduuli_koodiarvo,
		coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as koulutusmoduuli_koodiarvo_paataso,
		os.koulutusmoduuli_koodiarvo_numeerinen,
		--os.ep_usean_tutkinnon_tutkinnonosa,
		-- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
		-- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
		coalesce(epu.kuuluu_useaan_tutkintoon,0) as usean_tutkinnon_tutkinnonosa,
		coalesce(epu.kuuluu_eri_kustannusryhmiin,0) as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma as kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
		epu.tutkinto_koodi as tutkinto_johon_tutkinnonosa_kuuluu,
		nullif(epu.osaamisala_koodi,'0') AS osaamisala_johon_tutkinnonosa_kuuluu,

		yhteinen_tutkinnon_osa = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN (
				'101053', '101054', '101055', '101056',
				'400012', '400013', '400014' )
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1

				ELSE 0
			END,
		--toisesta_tutkinnosta_sisallytetty_tutkinnonosa =
		--	CASE
		--		WHEN os.data LIKE '%{_tutkinto_:%' THEN 1
		--		ELSE 0
		--	END,

		kuuluu_kaatoluokkaan = 
			CASE
				WHEN os.koulutusmoduuli_koodiarvo IN ( '1', '2' ) AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 1
				ELSE 0
			END,

		---------------------
		--jhe 23.5.2019 Juho mikkosen speksi 21.5., so. suoritustyyppien laajuutta ei löydy eperusteista..
		--..käytetään koskeen kirjattua arvoa, tässä ensin ominaisuuden liputus:
		--AP 17.10.2019 muutettu Juhon uuden speksin mukaan

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

		,suorittaa_koko_tutkintoa = case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 0 end

		--,usean_tutkinnon_tutkinnonosa_usea_kustannusryhma_uusi = coalesce(epu.kuuluu_eri_kustannusryhmiin_uusi,0)
		--,kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi = epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma_uusi


	FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS os
	LEFT JOIN (
		select
			suorituksen_tyyppi
			,paatason_suoritus_id
			,koulutusmoduuli_koodiarvo
		from (
			select distinct 
				paatason_suoritus_id
				,suorituksen_tyyppi
				,koulutusmoduuli_koodiarvo
				,rnk = rank() over (partition by paatason_suoritus_id order by suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo)
			from sa.sa_koski_paatason_suoritus
		) q
		where rnk=1
	) ps on ps.paatason_suoritus_id = os.paatason_suoritus_id
	LEFT JOIN CTE AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--AP 1.10.2019 ao join linkitettyjen oikeuksien järjestäjän hakemiseen
	LEFT JOIN CTE AS so on so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	--AP 23.6.2019 lisätty alla olevaan joiniin ehto rnk=1
	LEFT JOIN [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet] as ep ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = ep.tutkinnonosa_koodi and rnk2=1
	--jhe 30.4 tuodaan ep:stä usean tutkinnonosan liputus
	LEFT JOIN [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma] as epu ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = epu.tutkinnonosa_koodi and year(os.arviointi_paiva) between year(coalesce(epu.alkupvm,'1900-01-01')) and year(coalesce(epu.loppupvm,'9999-12-31'))

	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = ps.koulutusmoduuli_koodiarvo

	WHERE os.osasuoritus_hylataan = 0 
	AND kl.tutkintotyyppi_koodi IN ('02','19','20') --OR kl.koulutusluokitus_koodi IN ('999901','999903'))
	

) AS t

GO
USE ANTERO