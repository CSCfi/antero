USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 22.7.2020 17:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS

-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen ##
-- Logiikka: poimitaan osasuoritukset opiskeluoikeuksittain..
-- .. toiseen opiskeluoikeuteen sisältyvät suoritukset niputetaan emo-oikeuden eli ylemmän osasuorituksen alle
-- .. tätä varten on luotu uusi raportointikäsite "suoritustason_tunniste", jolla suoritusten kpl-määrä voidaan laskea
-- Aikarajaus tehdään arviointipäivän avulla, mutta tässä kyselyssä ei karsita rivejä, ainoastaan liputetaan osuminen raportointivuoteen..
-- .. varsinainen aikarajaus tehdään kun osasuoritus yhdistetään päätason tauluun, jonka vahvistus_paiva -arvo on vaihtoehtoinen hyväksymiskriteeri
-- Yhteinen tutkinnonosa liputetaan täällä myöhempää kustannusryhmittelyä varten


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
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
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
       coalesce(CASE
					WHEN kuuluu_kaatoluokkaan = 1 THEN t.osasuoritus_id
					ELSE t.ylempi_osasuoritus_id
				END
	   ,t.osasuoritus_id) AS suoritustason_tunniste,
       arviointi_paiva,
       arviointi_paiva_muokattu,
	   usean_tutkinnon_tutkinnonosa,
	   usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
	   kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
	   tutkinto_johon_tutkinnonosa_kuuluu,
	   osaamisala_johon_tutkinnonosa_kuuluu,
	   yhteinen_tutkinnon_osa,
	   toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
       kuuluu_kaatoluokkaan,
       koulutus_moduuli_laajuus_alle_yhden,
	   koulutusmoduuli_koodiarvo,
	   koulutusmoduuli_koodiarvo_paataso,
	   koulutusmoduuli_koodiarvo_numeerinen,
	   --laajuus_puuttuu_eperusteista,
----------------------------------------
    --jhe 23.5 korvataan kosken laajuustieto eper-tiedolla jos se on saatavana
	--.. näytetään myös alkuperäinen arvo
	--.. huom. vanhojen tutkintojen osalta laajuus määritellään diaarinumeron perusteella
	--.. seuraavassa kyselyssä: [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot]
	-- jhe 23.5 Sepon speksi 21.5: jos suorituksen laajuus haetaan koskesta ja arvo ei ole välillä 5-15..
	-- oikaistaan ohjelmallisesti, arvo<5=0, arvo<15=15
	  laajuus_puuttuu_eperusteista,

 	COALESCE(
		CASE
      --ensisijaisesti laajuus eperusteista
      -- jhe 23.5, ei löydy kaikkia laajuuksia epersta?
	  --laajuus_puuttuu_eperusteista=0 then ep_tutkinnonosa_laajuus
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
	--koulutusmoduuli_laajuus_yksikko

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
		CASE
			WHEN os.arviointi_paiva < oo.alkamispaiva THEN oo.alkamispaiva
			WHEN os.arviointi_paiva > oo.paattymispaiva THEN oo.paattymispaiva
			ELSE os.arviointi_paiva
		END AS arviointi_paiva_muokattu,

		os.arviointi_hyvaksytty,
		CASE
			WHEN os.koulutusmoduuli_laajuus_arvo < 1 THEN 1
			ELSE 0
		END AS koulutus_moduuli_laajuus_alle_yhden,
		os.koulutusmoduuli_laajuus_arvo,
		os.koulutusmoduuli_laajuus_yksikko,

		ep.tutkinnonosa_laajuus as ep_tutkinnonosa_laajuus,
		os.koulutusmoduuli_koodiarvo,
		kl.koulutusluokitus_koodi as koulutusmoduuli_koodiarvo_paataso,
		os.koulutusmoduuli_koodiarvo_numeerinen,
		--os.ep_usean_tutkinnon_tutkinnonosa,
		-- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
		-- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
		coalesce(epu.kuuluu_useaan_tutkintoon,0) as usean_tutkinnon_tutkinnonosa,
		coalesce(epu.kuuluu_eri_kustannusryhmiin,0) as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma as kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
		coalesce(epu.tutkinto_koodi,'') as tutkinto_johon_tutkinnonosa_kuuluu,
		coalesce(epu.osaamisala_koodi,'') AS osaamisala_johon_tutkinnonosa_kuuluu,

		CASE
			WHEN os.koulutusmoduuli_koodiarvo IN (
			'101053', '101054', '101055', '101056',
			'400012', '400013', '400014' )
			AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1

			ELSE 0
		END AS yhteinen_tutkinnon_osa,

		

		CASE
			WHEN os.data LIKE '%{_tutkinto_:%' THEN 1
			ELSE 0
		END AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa,

		CASE
			WHEN os.koulutusmoduuli_koodiarvo IN ( '1', '2' ) AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 1
			ELSE 0
		END AS kuuluu_kaatoluokkaan,

		---------------------
		--jhe 23.5.2019 Juho mikkosen speksi 21.5., so. suoritustyyppien laajuutta ei löydy eperusteista..
		--..käytetään koskeen kirjattua arvoa, tässä ensin ominaisuuden liputus:
		--AP 17.10.2019 muutettu Juhon uuden speksin mukaan

		CASE

		-- yhteinen tutkinnonosa
			WHEN os.koulutusmoduuli_koodiarvo IN ('101053', '101054', '101055', '101056', '400012', '400013', '400014') 
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat'
				THEN 1
		/*
			WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi = 'ammatillinenkorkeakouluopintoja'
				THEN 1

			WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi in ('ammatillinenlukionopintoja','ammatillinenmuitaopintovalmiuksiatukeviaopintoja','ammatillisentutkinnonosanosaalue')
				THEN 2
		*/
		--kaatoluokka 
			WHEN os.koulutusmoduuli_koodiarvo IN ('1', '2')	AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus'
				THEN 3

			ELSE 0

		END as laajuus_puuttuu_eperusteista

		,ps.suorituksen_tyyppi

		,case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 0 end as suorittaa_koko_tutkintoa


	FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS os
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.paatason_suoritus_id = os.paatason_suoritus_id
	LEFT JOIN CTE AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--AP 1.10.2019 ao join linkitettyjen oikeuksien järjestäjän hakemiseen
	LEFT JOIN CTE AS so on so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid --and so.opiskeluoikeus_oid is not null
	--AP 23.6.2019 lisätty alla olevaan joiniin ehto rnk=1
	LEFT JOIN [Koski_SA].[dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet] as ep ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = ep.tutkinnonosa_koodi and rnk2=1
	--jhe 30.4 tuodaan ep:stä usean tutkinnonosan liputus
	LEFT JOIN [Koski_SA].[dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma] as epu ON try_cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = epu.tutkinnonosa_koodi

	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = ps.koulutusmoduuli_koodiarvo

	WHERE os.osasuoritus_hylataan = 0 
	AND kl.tutkintotyyppi_koodi IN ('02','19','20') --OR kl.koulutusluokitus_koodi IN ('999901','999903'))
	

) AS t

GO
USE [ANTERO]