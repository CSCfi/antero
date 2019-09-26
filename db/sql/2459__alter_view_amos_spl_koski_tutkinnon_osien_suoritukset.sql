USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]    Script Date: 26.9.2019 12:16:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset] AS


--drop table [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]
--go
--select *
--into [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]
--from [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]




-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen ##
-- Logiikka: poimitaan osasuoritukset opiskeluoikeuksittain..
-- .. toiseen opiskeluoikeuteen sisältyvät suoritukset niputetaan emo-oikeuden eli ylemmän osasuorituksen alle
-- .. tätä varten on luotu uusi raportointikäsite "suoritustason_tunniste", jolla suoritusten kpl-määrä voidaan laskea
-- Aikarajaus tehdään arviointipäivän avulla, mutta tässä kyselyssä ei karsita rivejä, ainoastaan liputetaan osuminen raportointivuoteen..
-- .. varsinainen aikarajaus tehdään kun osasuoritus yhdistetään päätason tauluun, jonka vahvistus_paiva -arvo on vaihtoehtoinen hyväksymiskriteeri
-- Yhteinen tutkinnonosa liputetaan täällä myöhempää kustannusryhmittelyä varten
-- ## jhe 13.3.2019 ##
-- Lisätty ei-vos suodatus, ks. from
-- ## jhe 22.3.2019 ##
-- koodia siistitty
-- ## jhe 22.3.2019 ##
-- lisämääreitä yhteisiin tutkinnonosiin
-- ## jhe 24.4.2019, 30.4.2019 ##
-- koulutusmoduulin laajuusyksikkö mukaan
-- ## jhe 14.5.2019 ##
-- ## jhe 23.5.2019 ##

SELECT DISTINCT
       oppilaitos_oid,
       opiskeluoikeus_oid,
       paatason_suoritus_id,
       coalesce(CASE
					WHEN kuuluu_kaatoluokkaan = 1 THEN t.osasuoritus_id
					ELSE t.ylempi_osasuoritus_id
				END
	   ,t.osasuoritus_id) AS suoritustason_tunniste,
       arviointi_paiva,
       arviointi_paiva_kohdevuonna,
	   ep_usean_tutkinnon_tutkinnonosa,
	   yhteinen_tutkinnon_osa,
	   toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
       kuuluu_kaatoluokkaan,
       koulutus_moduuli_laajuus_alle_yhden,
	   koulutusmoduuli_koodiarvo,
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
			when laajuus_puuttuu_eperusteista=0 then isnull(ep_tutkinnonosa_laajuus,koulutusmoduuli_laajuus_arvo)
	  --jos laajuus koskesta, hyväksytään vain sallituissa rajoissa
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] < 5 then 0
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] > 15 then 15
			else [koulutusmoduuli_laajuus_arvo]
		END
	,0) AS koulutusmoduuli_laajuus_arvo,

    koulutusmoduuli_laajuus_arvo as koulutusmoduuli_laajuus_arvo_alkup
	--koulutusmoduuli_laajuus_yksikko

FROM   (

	SELECT DISTINCT
		oo.oppilaitos_oid,
		Isnull(oo.sisaltyy_opiskeluoikeuteen_oid, os.opiskeluoikeus_oid) AS opiskeluoikeus_oid,
		os.paatason_suoritus_id,
		os.osasuoritus_id,
		os.ylempi_osasuoritus_id,
		--AP 2.8.2019 tällä varmistetaan se, että arviointipäivä mappaantuu myöhemmin johonkin aikajaksoon
		CASE
			WHEN os.arviointi_paiva < oo.alkamispaiva THEN oo.alkamispaiva
			WHEN os.arviointi_paiva > oo.paattymispaiva THEN oo.paattymispaiva
			ELSE os.arviointi_paiva
		END AS arviointi_paiva,

		CASE
			WHEN Year(arviointi_paiva) = 2018 -- Year(Getdate()) - 1
        THEN 1
		  ELSE 0
		END AS arviointi_paiva_kohdevuonna,
		os.arviointi_hyvaksytty,
		CASE
			WHEN os.koulutusmoduuli_laajuus_arvo < 1 THEN 1
			ELSE 0
		END AS koulutus_moduuli_laajuus_alle_yhden,
		os.koulutusmoduuli_laajuus_arvo,
		os.koulutusmoduuli_laajuus_yksikko,

		ep.tutkinnonosa_laajuus as ep_tutkinnonosa_laajuus,
		os.koulutusmoduuli_koodiarvo,
		os.koulutusmoduuli_koodiarvo_numeerinen,
		--os.ep_usean_tutkinnon_tutkinnonosa,
		-- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
		-- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
		isnull(epu.usean_tutkinnon_tutkinnonosa,0) as ep_usean_tutkinnon_tutkinnonosa,

		CASE
			WHEN os.koulutusmoduuli_koodiarvo IN (
			'101053', '101054', '101055', '101056',
			'400012', '400013', '400014' )

		--Lisämääreet 24.4. palaverista, Juho Mikkonen, täsmennetty 29.4
			AND os.koulutusmoduuli_koodisto = 'tutkinnonosat'
			AND Year(os.arviointi_paiva) = 2018 --Year(Getdate()) - 1
		--/lisämääreet

			THEN 1
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

		CASE

		--AP 1.8.2019 eka ehto lisätty
			WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus'
			THEN 1

			WHEN os.suorituksen_tyyppi in (
				 'ammatillinenlukionopintoja'
				,'ammatillinenmuitaopintovalmiuksiatukeviaopintoja'
				,'ammatillinenkorkeakouluopintoja')
			THEN 1

		--kaatoluokka
			WHEN os.koulutusmoduuli_koodiarvo IN ('1', '2')
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus'
			THEN 1

		-- yhteinen tutkinnonosa
			WHEN os.koulutusmoduuli_koodiarvo IN ('101053', '101054', '101055', '101056', '400012', '400013', '400014')
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat'
				AND Year(os.arviointi_paiva) = 2018--Year(Getdate()) -1
			THEN 1

			ELSE 0

		END as laajuus_puuttuu_eperusteista


	---------------------



	FROM [dw].[f_amos_spl_koski_osasuoritus_pl_eivos] AS os
	--Koski_SA.sa.sa_koski_osasuoritus
	--korvataan taululla, josta karsittu ei-vos rahoituksen piiriin kuuluvat rivit
	-- jhe 25.3.2019

	INNER JOIN (
		SELECT
			opiskeluoikeus_oid
			,sisaltyy_opiskeluoikeuteen_oid
			,oppilaitos_oid
			,alkamispaiva
			,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
		FROM koski_sa.sa.sa_koski_opiskeluoikeus
	) AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--jhe 23.5 eper taas mukaan
	--AP 23.6.2019 lisätty alla olevaan joiniin ehto rnk=1
	LEFT JOIN [Koski_SA].[sa].[f_eperusteet_osaamisalat_tutkinnonosat_laajuudet] as ep ON cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = ep.tutkinnonosa_koodi and rnk2=1
	--jhe 30.4 tuodaan ep:stä usean tutkinnonosan liputus
	LEFT JOIN [Koski_SA].[sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat] as epu ON cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = epu.tutkinnonosa_koodi



) AS t

