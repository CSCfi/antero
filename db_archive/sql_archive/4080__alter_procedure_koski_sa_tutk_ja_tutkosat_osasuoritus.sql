USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]    Script Date: 31.10.2020 17:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] @minVuosi int = 2018, @maxVuosi int = NULL AS

-- tässä suodatetaan pois ne osasuoritukset ja opiskeluoikeudet.. 
-- .. jotka nkymässä [dw].[v_amos_spl_liputa_ei_vos_rahoitettu_koulutus]..
-- .. liputettiin ei kuuluviksi amos vos-rahoituksen piiriin
-- tuodaan eperusteista laajuudet, logiikkaa ehkä vielä tarkistettava Sepon kanssa, jhe 30.4
-- lisätty aikarajaus ja arviointi_hyvaksytty rajaus jo tähän vaiheeseen


IF EXISTS (SELECT * FROM sys.indexes WHERE name='NonClusteredIndex-paataso_oid_osasuoritus' AND object_id = OBJECT_ID('sa.temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos'))
BEGIN
	DROP INDEX [NonClusteredIndex-paataso_oid_osasuoritus] ON [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]
END



TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]



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
	case when eivos.osasuoritus_id is not null then 1 else 0 end as osasuoritus_hylataan,
	coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
	os.data

FROM Koski_SA.sa.sa_koski_osasuoritus AS os 

LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid 
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid --and oo2.opiskeluoikeus_oid is not null

--jhe 3.6.2019 eivos-suodatuksen korjaus
LEFT OUTER JOIN (
	SELECT distinct
		osasuoritus_id
	FROM sa.temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus
	WHERE tieto = 'osasuoritus'
) AS eivos ON os.osasuoritus_id = eivos.osasuoritus_id

--AP 23.6.2019 joinin muokkaus
--LEFT OUTER JOIN [dw].[d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus] AS eivos ON eivos.osasuoritus_id = os.osasuoritus_id and eivos.tieto = 'osasuoritus'

--AP 1.8.2019 join jolla haetaan ylemmän osasuorituksen koulutusmoduuli_koodisto
LEFT JOIN Koski_SA.sa.sa_koski_osasuoritus os2 ON os2.osasuoritus_id = os.ylempi_osasuoritus_id

WHERE 1=1
AND oo.koulutusmuoto = 'ammatillinenkoulutus'
AND year(os.arviointi_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
AND coalesce(os.koulutusmoduuli_laajuus_yksikko,6) = '6'



CREATE NONCLUSTERED INDEX [NonClusteredIndex-paataso_oid_osasuoritus] ON [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]
(
	[paatason_suoritus_id] ASC,
	[opiskeluoikeus_oid] ASC,
	[osasuoritus_id] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
USE ANTERO