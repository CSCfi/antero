USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 27.5.2025 14.56.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat] AS

/*
 Katsotaan oppija_oideittain samana päivänä alkaneet opiskeluoikeudet.
 Valittujen kriteerien perusteella valitaan yksi opiskeluoikeus, joka on rahoituksen kannalta relevantein.

 --Ensisijaisesti valitaan se opiskeluoikeus, joka vaikuttaa rahoitukseen (Muokattu katsomaan d_opintojenrahoitus taulusta vaikuttaako rahoitukseen JK 19.5.2025)
 --Sen jälkeen valitaan pisimpään jatkunut/yhä voimassa oleva. 
 --Sen jälkeen muu-kuin-näyttötutkintoonvalmistava. 
 --Sen jälkeen osa-aikaisuusprosentin mukaan.
 --Sen jälkeen valmistumisen mukaan (valmistunut vs keskeyttänyt/eronnut)
 --Jos edellä mainituilla kriteereillä ei saada valittua niin sitten randomisti.
*/

TRUNCATE TABLE sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat
;

WITH suorituksen_tyyppi AS (
	SELECT 
		 opiskeluoikeus_oid
		,suorituksen_tyyppi
		,rnk
	FROM (
		SELECT 
			sa1.opiskeluoikeus_oid
			,suorituksen_tyyppi
			,RANK() OVER (PARTITION BY sa1.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi, koulutusmoduuli_koodiarvo) rnk
		FROM sa.sa_koski_paatason_suoritus sa1
		join sa.sa_koski_opiskeluoikeus sa2 on sa2.opiskeluoikeus_oid=sa1.opiskeluoikeus_oid
		where sa2.koulutusmuoto = 'ammatillinenkoulutus' or (sa2.tuva_jarjestamislupa = 'ammatillinen' and sa2.alkamispaiva > '2022-07-31')
	) q2
	WHERE rnk = 1
), 

opiskeluoikeudet AS (
	SELECT 
		opiskeluoikeus_oid
		,oppija_oid
		,alkamispaiva
		,rn = ROW_NUMBER() OVER (
			PARTITION BY oppija_oid, alkamispaiva 
			ORDER BY perusrahoitus desc, perusrahoitus2 desc, paattymispvm desc, suorituksen_tyyppi desc, osa_aikaisuus desc, valmistunut desc, opiskeluoikeus_oid
		) 
	FROM (
		SELECT DISTINCT
			oo.opiskeluoikeus_oid
			,oo.oppija_oid
			,oo.alkamispaiva
			,suorituksen_tyyppi=case when ps.suorituksen_tyyppi ='nayttotutkintoonvalmistavakoulutus' then 0 else 1 end
			--,max(coalesce(ooa1.opintojen_rahoitus,6)) as rahoitus1
			,min(coalesce(ra.sisaltyy_okm_perusrahoitus, 0)) OVER(PARTITION BY oo.opiskeluoikeus_oid) as perusrahoitus
			,max(coalesce(ra.sisaltyy_okm_perusrahoitus, 0)) OVER(PARTITION BY oo.opiskeluoikeus_oid) as perusrahoitus2
			,avg(coalesce(ooa.osa_aikaisuus,0)) OVER(PARTITION BY oo.opiskeluoikeus_oid) as osa_aikaisuus
			,valmistunut=case when ooab.tila is not NULL then 1 else 0 end
			,coalesce(oo.paattymispaiva,'9999-12-31') as paattymispvm	
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		inner join suorituksen_tyyppi ps on ps.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
		--läsnä-tilat
		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid=oo.opiskeluoikeus_oid and ooa.tila='lasna'
		--valmistunut-tila (ei välttämättä löydy, siksi left join)
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooab on ooab.opiskeluoikeus_oid=oo.opiskeluoikeus_oid and ooab.tila='valmistunut'
		left join [ANTERO].[dw].[d_opintojenrahoitus] ra on ra.koodi=ooa.opintojen_rahoitus
		where (oo.koulutusmuoto = 'ammatillinenkoulutus' or (oo.tuva_jarjestamislupa = 'ammatillinen' and oo.alkamispaiva > '2022-07-31'))
		--rajataan pois muihin sisältyvät opiskeluoikeudet
		and oo.sisaltyy_opiskeluoikeuteen_oid is null 
		--rajataan pois tulevaisuudessa alkavat jaksot
		and ooa.alku < getdate() 
	) q
)

INSERT INTO sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat (oppija_oid, opiskeluoikeus_oid_hyvaksytaan)

SELECT DISTINCT
	 hyv.oppija_oid
	,opiskeluoikeus_oid_hyvaksytaan = hyv.opiskeluoikeus_oid
	--,opiskeluoikeus_oid_hylataan = hyl.opiskeluoikeus_oid
	
FROM (
	SELECT
		opiskeluoikeus_oid
		,oppija_oid
		,alkamispaiva
    FROM opiskeluoikeudet 
	WHERE rn = 1 
) hyv
inner join (
	SELECT 
		opiskeluoikeus_oid
		,oppija_oid
		,alkamispaiva
    FROM opiskeluoikeudet 
	WHERE rn > 1 
) hyl on hyv.oppija_oid=hyl.oppija_oid and hyl.alkamispaiva=hyv.alkamispaiva