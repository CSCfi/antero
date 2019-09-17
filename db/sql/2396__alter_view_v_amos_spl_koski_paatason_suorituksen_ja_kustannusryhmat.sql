USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dw].[v_amos_spl_koski_paatason_suoritukset_ja_kustannusryhmat]
as


--drop table [dw].[f_amos_spl_koski_paatason_suoritukset_ja_kustannusryhmat]
--go
--select distinct *
--into [dw].[f_amos_spl_koski_paatason_suoritukset_ja_kustannusryhmat]
--from [dw].[v_amos_spl_koski_paatason_suoritukset_ja_kustannusryhmat]





-- jhe 13.3.2019, 25.3.2019, 2.4.2019, 23.4.2019,5.5.2019, 8.5.2019, 9.5.2019, 10.5.2019, 12.5.2019, 23.5.2019, 24.5.2019, 27.5.2019, 28.5.2019, 12.6.2019
--
--23.4.2019 /jhe
--Tässä kyselyssä määritetään kustannusryhmät päätason suorituksille. Tutkinnon osien kohdalta kr:ia oikaistaan edelleen kyselyssä
--[dw].[v_amos_spl_suoritepaatoslaskennan_tiedot]

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
SELECT distinct
         t.toimipiste_oid,
         t.opiskeluoikeus_oid,
		 t.paatason_suoritus_id,
         tutkinto_koodi = coalesce(kl.uusi_eat_koodi, atok.tutkinto_koodi, t.koulutusmoduuli_koodiarvo), --AP 16.6.2019 null-käsittely lisätty
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


		 -- uusi sääntö 8.5.2019 alkaen
		 -- AP 16.6.2019 else korvattu
		 case
			WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
			--else isnull(atok.osaamisala_kustannusryhma_koodi, atok.tutkinto_kustannusryhma_koodi)
			else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
		end AS kustannusryhma_koodi,
         -- poikkeava_kustannus_ryhma,
         -- atk.kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
         atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
         t.suorittaa_koko_tutkintoa,
         --t.suorittaa_nayttotutkintoa,
		 -- jhe 5.5.2019 Tutkintotyypin ryhmä, käsite Karin raporttimallista..
		 --..'TUTKINTOTYYPIN RYHMÄ' (Pitäisi keksiä tälle parempi termi!). Saa arvoja: Perustutkintokoulutus, Ammatti- ja erikoisammattitutkintokoulutus
		 -- huom. sama päättely on myös piirrekyselyssä


		 kl.tutkintotyyppi_koodi,
         kl.tutkintotyyppi_fi,
         kl.koulutusluokitus_fi,
         t.vahvistus_paiva,
         t.vahvistus_paiva_on,
		 vahvistus_paiva_kohdevuonna
 FROM   (

		SELECT DISTINCT
   --12.5.2019 diaarinumero haettava data-kentän jsonista, per mikkonen email pe 10.5.2019 11.21
--						 ltrim(rtrim(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''))) as diaarinumero_space,
			replace(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero,
			ps.toimipiste_oid,
            ps.opiskeluoikeus_oid,
            ps.paatason_suoritus_id,
            CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
            END AS suorittaa_koko_tutkintoa,
			--ps.koulutusmoduuli_koodiarvo,
            CASE
				WHEN ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				ELSE ps.koulutusmoduuli_koodiarvo
            END AS koulutusmoduuli_koodiarvo,

            ps.osaamisala_koodiarvo,
			--AP 16.6.2019 muutettu alla olevaa päättelyä
			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
				--WHEN ps.osaamisala_koodiarvo IS NOT NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN CAST(ps.tutkinto_koodiarvo AS varchar(20)) + '_' + CAST(ps.osaamisala_koodiarvo AS varchar(20))
				--ELSE CAST(ps.koulutusmoduuli_koodiarvo AS varchar(20)) + '_' + CAST(ps.osaamisala_koodiarvo AS varchar(20))
			END AS tutkinto_ja_osaamisala_koodi,

			ps.suorituksen_tyyppi,
			-- AP 11.9.2019 lisätty case
            CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END AS vahvistus_paiva,

			CASE
				WHEN year(vahvistus_paiva)=2018 --year(getdate())-1
					THEN 1
				ELSE 0
			END AS vahvistus_paiva_kohdevuonna,

            CASE
				WHEN vahvistus_paiva IS NULL THEN 0
				ELSE 1
            END AS vahvistus_paiva_on

    --        ,CASE
				--WHEN year(vahvistus_paiva)=year(getdate())-1 THEN 1
				--ELSE 0
    --        END AS vahvistus_paiva_kohdevuonna

          FROM koski_sa.sa.sa_koski_paatason_suoritus ps
		  -- AP 11.9.2019 lisätty ao join
		INNER JOIN (
			SELECT
				opiskeluoikeus_oid
				,sisaltyy_opiskeluoikeuteen_oid
				,oppilaitos_oid
				,alkamispaiva
				,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
			FROM koski_sa.sa.sa_koski_opiskeluoikeus
		) AS oo ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid

		  --jhe 12.5 lisätty rajoitus vahvistuspäivä ei saa olla tyhjä, 28.5 disabloitu
		  --where vahvistus_paiva is not null
		  --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on ”nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."
           WHERE ps.suorituksen_tyyppi like '%ammatillinen%'
		   --AND
		   --(ps.suorituksen_tyyppi <> 'nayttotutkintoonvalmistavakoulutus')

) AS t
-- AP 16.6.2019 lisätty kaksi joinia
left JOIN dw.v_amos_spl_tutkinto_ja_osaamisala_kustannusryhma atok ON atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
left join sa.sa_amos_osaamisala_kustannusryhma sa1 on sa1.osaamisala_koodi=t.tutkinto_ja_osaamisala_koodi
left JOIN dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
left join sa.sa_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi=coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE 1=1
and kl.tutkintotyyppi_koodi IN ( '02', '19', '20' ) --  ( '02', '09', '19', '20' )
--AP 20.6.2019 lisätty ao ehto
