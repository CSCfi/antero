USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_koski_osasuoritus_pl_eivos]    Script Date: 26.9.2019 12:10:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








alter view [dw].[v_amos_spl_koski_osasuoritus_pl_eivos] as
-- jhe 22-25.3.2019, 30.4.2019, 10.5.2019, 11.5.2019, 13.5, 23.5, 3.6 

-- tässä suodatetaan pois ne osasuoritukset ja opiskeluoikeudet.. 
-- .. jotka nkymässä [dw].[v_amos_spl_liputa_ei_vos_rahoitettu_koulutus]..
-- .. liputettiin ei kuuluviksi amos vos-rahoituksen piiriin
-- tuodaan eperusteista laajuudet, logiikkaa ehkä vielä tarkistettava Sepon kanssa, jhe 30.4
-- lisätty aikarajaus ja arviointi_hyvaksytty rajaus jo tähän vaiheeseen
/*
--faktataulun luonti

drop table [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]
select *
into [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]
from [dw].[v_amos_spl_koski_osasuoritus_pl_eivos]


select count(*) as lkm
from [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]

select top 10 *
from [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]

select count(*)  as opiskeluoikeuksia, '[dw].[v_amos_spl_koski_osasuoritus_pl_eivos]' as tbl
from (
select distinct [opiskeluoikeus_oid]
from
 [dw].[v_amos_spl_koski_osasuoritus_pl_eivos]) t



select top 100 *
from [dw].[v_amos_spl_koski_osasuoritus_pl_eivos]

select count(*) as lkm
from [dw].[v_amos_spl_koski_osasuoritus_pl_eivos]

*/


SELECT DISTINCT
	[osasuoritus_id]
	,[ylempi_osasuoritus_id]
	,[koulutusmoduuli_koodisto_ylempi]
	,[paatason_suoritus_id]
	,[opiskeluoikeus_oid]
	,[suorituksen_tyyppi]
	,[koulutusmoduuli_koodisto]
	,[koulutusmoduuli_koodiarvo]
	,[koulutusmoduuli_koodiarvo_numeerinen]

	  /* -- jhe 24.5 siirretty kyselyyn [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]
	  -- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
	  -- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
	  ,isnull(ep.usean_tutkinnon_tutkinnonosa,0) as ep_usean_tutkinnon_tutkinnonosa
	  */
	,[koulutusmoduuli_laajuus_yksikko]
	,[koulutusmoduuli_laajuus_arvo]
	,[koulutusmoduuli_paikallinen]
	,[koulutusmoduuli_pakollinen]
	,[vahvistus_paiva]
	,[arviointi_arvosana_koodiarvo]
	,[arviointi_arvosana_koodisto]
	,[arviointi_hyvaksytty]
	,[arviointi_paiva]
	,[nayton_arviointi_paiva]
	,[data]
	,[imp_created]
	,[source]
	,[username]
  FROM 

  (

	SELECT 
		os.osasuoritus_id, 
		os.ylempi_osasuoritus_id, 
		coalesce(os2.koulutusmoduuli_koodisto,'') as koulutusmoduuli_koodisto_ylempi,
		os.paatason_suoritus_id, 
		os.opiskeluoikeus_oid, 
		os.suorituksen_tyyppi, 
		os.koulutusmoduuli_koodisto,
		-- jhe 30.4 tuodaan ep tietoja, tutkintokoodi ja laajuus, 1.5 kytkentä pois toistaseksi, hukkaa 5% riveistä
		-- seuraavalla tasolla korvataan yhdistelmäavaimen tutkintokoodi_tutkinnonosakoodi avulla kosken laajuustieto
		-- yhdistelmäavain siksi, että sama tutkinnonosa voi olla eri laajuinen eri tutkinnoissa 
		--,ep.tutkintokoodi as ep_tutkinto_koodi, 
   
		os.koulutusmoduuli_koodiarvo, 
		--jhe 10.5 lisätään numeerinen koodiarvo kenttä
		cast(
		case 
			when isnumeric(os.koulutusmoduuli_koodiarvo)= 1 and os.koulutusmoduuli_koodiarvo not like '0%' and os.koulutusmoduuli_koodiarvo not like '%.%' then os.koulutusmoduuli_koodiarvo
			else NULL 
		end as varchar) as koulutusmoduuli_koodiarvo_numeerinen, 
		os.koulutusmoduuli_laajuus_arvo, 
		os.koulutusmoduuli_laajuus_yksikko, 
		os.koulutusmoduuli_paikallinen, 
		os.koulutusmoduuli_pakollinen, 
		os.vahvistus_paiva, 
		os.arviointi_arvosana_koodiarvo, 
		os.arviointi_arvosana_koodisto, 
		os.arviointi_hyvaksytty, 
		os.arviointi_paiva, 
		os.nayton_arviointi_paiva, 
		os.data, 
		os.imp_created, 
		os.source, 
		os.username 
	FROM Koski_SA.sa.sa_koski_osasuoritus AS os 

	INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid 

	--jhe 3.6.2019 eivos-suodatuksen korjaus
	LEFT OUTER JOIN (
		SELECT DISTINCT      
			osasuoritus_id, tieto
		FROM dw.d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus
		WHERE (tieto = 'osasuoritus')
	) AS eivos ON os.osasuoritus_id = eivos.osasuoritus_id

	--AP 23.6.2019 joinin muokkaus
	--LEFT OUTER JOIN [dw].[d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus] AS eivos ON eivos.osasuoritus_id = os.osasuoritus_id and eivos.tieto = 'osasuoritus'

	--AP 1.8.2019 join jolla haetaan ylemmän osasuorituksen koulutusmoduuli_koodisto
	LEFT JOIN Koski_SA.sa.sa_koski_osasuoritus os2 ON os2.osasuoritus_id = os.ylempi_osasuoritus_id

	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
	AND year(os.arviointi_paiva)= year(getdate())-1  
	AND os.arviointi_hyvaksytty = '1'
	--13.5.2019 jhe FYI laajuusykiköllä suodattaminen karsii riveistä n. 90%
	--AP 20.6.2019 nullit -> 6
	AND coalesce(os.koulutusmoduuli_laajuus_yksikko,6) = '6'
	AND (eivos.osasuoritus_id IS NULL)
	--AP 9.7.2019 lisätty ao ehto
	--Seppo 8.7.2019: "Tutkinnon osien määrässä tai osaamispisteissä ei huomioda sellaisia osasuorituksia joiden tyyppi on ammatillisentutkinnonosaapienempikokonaisuus."
	AND os.suorituksen_tyyppi != 'ammatillisentutkinnonosaapienempikokonaisuus'

) t 

/* -- jhe 24.5 siirretty kyselyyn [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]
--jhe 30.4 tuodaan ep:stä liputus
LEFT JOIN [Koski_SA].[sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat] as ep 
ON t.koulutusmoduuli_koodiarvo_numeerinen = ep.tutkinnonosa_koodi
*/

