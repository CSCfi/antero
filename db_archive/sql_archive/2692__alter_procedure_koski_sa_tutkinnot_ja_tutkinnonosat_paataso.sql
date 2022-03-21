USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 9.12.2019 14:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] @minVuosi int, @maxVuosi int = NULL AS



--4 §
--Tutkintojen ja tutkinnon osien kustannusryhmän määräytyminen
--Tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, johon tutkinnon osa tutkinnon perusteiden mukaisesti kuuluu.
--Ammatillisesta koulutuksesta annetun lain 13 §:n 2 momentissa tarkoitetut yhteiset tutkinnon osat kuuluvat kuitenkin kustannusryhmään 1.

--Jos tutkinnon osa voi tutkinnon perusteiden mukaisesti kuulua useaan tutkintoon, jotka kuuluvat eri kustannusryhmiin,
--tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, jota opiskelija suorittaa.
--Jos opiskelijan tavoitteena on suorittaa vain tutkinnon osa tai osia, tässä momentissa tarkoitettu tutkinnon osa kuuluu kustannusryhmään 1.


-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen, CSC ##
-- Logiikka: poimitaan tutkintotyypin koodilla rajaten PT, AT ja EAT tutkinnot ja liitetään niihin kustannusryhmät
-- Sitten tähän kyselyyn liitetään..
		-- .. suoritustason tieto [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]..
		-- .. ja koulutustoimijatieto [dw].[v_amos_spl_koski_suorite_organisaatio_linkki]..
		-- .. suodatetaan pois ei-vos-suoritukset [dw].[v_amos_spl_sa_koski_osasuoritus_pl_eivos]..
		-- .. ja kootaan kuutioon ladattavaksi ensin ilman organisaatiota [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot]..
		-- .. ja sitten organisaation linkittäen [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot_laajat]
		-- .. suorituskykysyistä osatuloksia ladataan samannimisiin materialisoituihin näkymiin ..
		-- .. tämä tehdään Jobissa, myöhemmin ehkä PDI:llä /jhe 25.3.2019
 -- aikarajaus: vahvistuspäivä päätason suorituksella tarkasteluvuoden aikana TAI
 -- osasuorituksella arviointipäivä tarkasteluvuoden aikana
 -- eli liputa tässä vahvistuspäivä ja osasuorituksessa arviointipäivä..
 -- rajaus jos ainakin toinen täyttää ehdon

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
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)


SELECT DISTINCT
        t.toimipiste_oid,
		t.koulutustoimija_oid,
        t.opiskeluoikeus_oid,
		t.ylempi_opiskeluoikeus_oid,
		t.paatason_suoritus_id,
        coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo) AS tutkinto_koodi , --AP 16.6.2019 null-käsittely lisätty
        NULL AS osaamisala_koodiarvo, --t.osaamisala_koodiarvo,
	-- 9.5 jhe yhdistelmavain lisätty
        NULL AS tutkinto_ja_osaamisala_koodi, --t.tutkinto_ja_osaamisala_koodi,
		atok.tutkinto_ja_osaamisala_koodi as eper_tutkinto_ja_osaamisala_koodi,

	-- 12.5 diaarinumero ja yhdistelmäavaimet lisätty
		t.diaarinumero,
		--t.diaarinumero_space,
		NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
		NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
		t.suorituksen_tyyppi,

		case
			WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
			else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
		end 
		AS kustannusryhma_koodi,

        atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
        t.suorittaa_koko_tutkintoa,

		kl.tutkintotyyppi_koodi,
        kl.tutkintotyyppi_fi,
        kl.koulutusluokitus_fi,
        t.vahvistus_paiva,
		t.vahvistus_paiva_muokattu

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]


FROM   (

		SELECT
			
			replace(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero,
			ps.toimipiste_oid,
			coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
			ps.opiskeluoikeus_oid,
			oo.sisaltyy_opiskeluoikeuteen_oid as ylempi_opiskeluoikeus_oid,
			ps.paatason_suoritus_id,
			CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
			END 
			AS suorittaa_koko_tutkintoa,
			ps.koulutusmoduuli_koodiarvo,

			ps.osaamisala_koodiarvo,

			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
			END AS tutkinto_ja_osaamisala_koodi,

			ps.suorituksen_tyyppi,

			ps.vahvistus_paiva,
			
			CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END 
			AS vahvistus_paiva_muokattu

		FROM CTE AS oo
		LEFT JOIN koski_sa.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid

		WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
		AND oo.lisatiedot_koulutusvienti = 0
		AND year(ps.vahvistus_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
				

) AS t

LEFT JOIN (SELECT DISTINCT tutkinto_ja_osaamisala_koodi, tutkinto_kustannusryhma_koodi FROM dbo.kustannusryhma_tutkinto_ja_osaamisala) atok on atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

GO
USE [ANTERO]