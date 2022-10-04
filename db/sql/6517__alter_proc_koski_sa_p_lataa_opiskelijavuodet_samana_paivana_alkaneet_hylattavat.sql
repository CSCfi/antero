USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 27.9.2022 17:27:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat] AS

/*
 Katsotaan oppija_oideittain samana päivänä alkaneet opiskeluoikeudet (huomioidaan maksimissaan kolme samaan aikaan alkanutta. Neljä samaan aikaan alkanutta on vain muutamalla opiskelijalla. Niiden osalta päättely ei välttämättä tuota täysin oikeaa lopputulosta, mutta ehtojen määrä neljässä tapauksessa on liian suuri). 
 Valittujen kriteerien perusteella valitaan yksi opiskeluoikeus (joka on rahoituksen kannalta relevantein). 
 Sen jälkeen katsotaan riveittäin onko opiskeluoikeus sama kuin kyseisen oppijan valittu opiskeluoikeus. 
 Lopputuloksena lista hylättävistä opiskeluoikeuksista, jotka liitetään tauluun temp_opiskelijavuodet_opiskeluoikeus_oidit (ks. sen proseduuri).

 --Juhon ja Sepon speksi: 
 --Ensisijaisesti valitaan se opiskeluoikeus, joka vaikuttaa rahoitukseen (hylätään "muuta kautta rahoitetut" ja "työnantajan kokonaan rahoittamat").
 --Sen jälkeen valitaan pisimpään jatkunut/yhä voimassa oleva. 
 --Sen jälkeen muu-kuin-näyttötutkintoonvalmistava. 
 --Sen jälkeen osa-aikaisuusprosentin mukaan.
 --Sen jälkeen valmistumisen mukaan (valmistunut vs keskeyttänyt/eronnut)
 --Jos edellä mainituilla kriteereillä ei saada valittua niin sitten randomisti. Jos päädytään viimeiseen kohtaan, kyse on luultavasti siitä, että opiskelijalle on vahingossa luotu tuplaoikeus.
*/

TRUNCATE TABLE sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat
;

WITH suorituksen_tyyppi AS (
	SELECT 
		 opiskeluoikeus_oid
		,suorituksen_Tyyppi
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
)

INSERT INTO sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat (oppija_oid, opiskeluoikeus_oid_hyvaksytaan)

SELECT DISTINCT
	oppija_oid
	,opiskeluoikeus_oid_hyvaksytaan = case when oid1 = oid_valittu then oid1 end

FROM (
	SELECT 
		 oo.oppija_oid
		,oid1
		,oid2
		,oid3
		,oid_valittu = 
			case 
				when rahoitus1 not in (4,6) and rahoitus2 in (4,6) and rahoitus3 in (4,6) then oid1
				when rahoitus1 in (4,6) and rahoitus2 not in (4,6) and rahoitus3 in (4,6) then oid2
				when rahoitus1 in (4,6) and rahoitus2 in (4,6) and rahoitus3 not in (4,6) then oid3
				when paattymispvm1 > paattymispvm2 and paattymispvm1 > paattymispvm3 then oid1
				when paattymispvm1 < paattymispvm2 and paattymispvm2 > paattymispvm3 then oid2
				when paattymispvm1 < paattymispvm3 and paattymispvm2 < paattymispvm3 then oid3
				when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' then
					case
						when suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm2 <> paattymispvm3 then
							case 
								when paattymispvm2 > paattymispvm3 then oid2
								else oid3
							end 
						when suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' then oid2
						when suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' then oid3
					end
				when suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' then
					case
						when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm1 <> paattymispvm3 then
							case 
								when paattymispvm1 > paattymispvm3 then oid1
								else oid3
							end 
						when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' then oid1
						when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi3 <> 'nayttotutkintoonvalmistavakoulutus' then oid3
					end 
				when suorituksen_tyyppi3 = 'nayttotutkintoonvalmistavakoulutus' and oid3 <> '9' then
					case
						when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' and paattymispvm1 <> paattymispvm2 then
							case 
								when paattymispvm1 > paattymispvm2 then oid1
								else oid2
							end 
						when suorituksen_tyyppi1 <> 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 = 'nayttotutkintoonvalmistavakoulutus' then oid1
						when suorituksen_tyyppi1 = 'nayttotutkintoonvalmistavakoulutus' and suorituksen_tyyppi2 <> 'nayttotutkintoonvalmistavakoulutus' then oid2
					end 
				when osa_aikaisuus1 > osa_aikaisuus2 and osa_aikaisuus1 > osa_aikaisuus3 then oid1
				when osa_aikaisuus1 < osa_aikaisuus2 and osa_aikaisuus2 > osa_aikaisuus3 then oid2
				when osa_aikaisuus1 < osa_aikaisuus3 and osa_aikaisuus2 < osa_aikaisuus3 then oid3
				when valmistunut1 is not null and valmistunut2 is null and valmistunut3 is null then oid1
				when valmistunut1 is null and valmistunut2 is not null and valmistunut3 is null then oid2
				when valmistunut1 is null and valmistunut2 is null and valmistunut3 is not null then oid3
				else 
					case
						when oid1 < oid2 and oid1 < oid3 then oid1
						when oid1 > oid2 and oid2 < oid3 then oid2
						else oid3
					end
			end

	FROM (
	--haetaan maksimissaan kolmen samana päivänä alkaneen opiskeluoikeuden suorituksen tyyppi sekä rahoitus- ja osa-aikaisuustieto. Haetaan myös tieto onko opiskeluoikeus päättynyt valmistumiseen.
		SELECT 
			oo_a1.opiskeluoikeus_oid as oid1
			,ps1.suorituksen_tyyppi as suorituksen_tyyppi1
			,max(coalesce(ooa1.opintojen_rahoitus,6)) as rahoitus1
			,avg(coalesce(ooa1.osa_aikaisuus,0)) as osa_aikaisuus1
			,ooa1b.tila as valmistunut1
			,coalesce(oo_a1.paattymispaiva,'9999-12-31') as paattymispvm1
			,oo_a2.opiskeluoikeus_oid as oid2
			,ps2.suorituksen_tyyppi as suorituksen_tyyppi2
			,max(coalesce(ooa2.opintojen_rahoitus,6)) as rahoitus2
			,avg(coalesce(ooa2.osa_aikaisuus,0)) as osa_aikaisuus2
			,ooa2b.tila as valmistunut2
			,coalesce(oo_a2.paattymispaiva,'9999-12-31') as paattymispvm2
			,coalesce(oo_a3.opiskeluoikeus_oid,'9') as oid3
			,coalesce(ps3.suorituksen_tyyppi,'nayttotutkintoonvalmistavakoulutus') as suorituksen_tyyppi3
			,max(coalesce(ooa3.opintojen_rahoitus,6)) as rahoitus3
			,avg(coalesce(ooa3.osa_aikaisuus,0)) as osa_aikaisuus3
			,ooa3b.tila as valmistunut3
			,case when oo_a3.opiskeluoikeus_oid is null then '1900-01-01' else coalesce(oo_a3.paattymispaiva,'9999-12-31') end as paattymispvm3
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo_a1

	---EKA OPISKELUOIKEUS
		--suorituksen tyyppi
		inner join suorituksen_tyyppi ps1 on ps1.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid
		--läsnä-tilat
		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa1 on ooa1.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1.tila='lasna'
		--valmistunut-tila (ei välttämättä löydy, siksi left join)
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa1b on ooa1b.opiskeluoikeus_oid=oo_a1.opiskeluoikeus_oid and ooa1b.tila='valmistunut'

	---TOINEN OPISKELUOIKEUS
		inner join sa.sa_koski_opiskeluoikeus oo_a2 on oo_a2.oppija_oid=oo_a1.oppija_oid and oo_a2.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a2.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		inner join suorituksen_tyyppi ps2 on ps2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid		
		--läsnä-tilat
		inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2.tila='lasna'	
		--valmistunut-tila (ei välttämättä löydy, siksi left join)												
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa2b on ooa2b.opiskeluoikeus_oid=oo_a2.opiskeluoikeus_oid and ooa2b.tila='valmistunut'

	---KOLMAS OPISKELUOIKEUS	
		left join sa.sa_koski_opiskeluoikeus oo_a3 on oo_a3.oppija_oid=oo_a1.oppija_oid and oo_a3.opiskeluoikeus_oid != oo_a1.opiskeluoikeus_oid and oo_a3.opiskeluoikeus_oid != oo_a2.opiskeluoikeus_oid and oo_a3.alkamispaiva = oo_a1.alkamispaiva
		--suorituksen tyyppi
		left join suorituksen_tyyppi ps3 on ps3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid	
		--läsnä-tilat 		
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa3 on ooa3.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3.tila='lasna'		
		--valmistunut-tila 										
		left join sa.sa_koski_opiskeluoikeus_aikajakso ooa3b on ooa3b.opiskeluoikeus_oid=oo_a3.opiskeluoikeus_oid and ooa3b.tila='valmistunut'

		where (oo_a1.koulutusmuoto = 'ammatillinenkoulutus' or (oo_a1.tuva_jarjestamislupa = 'ammatillinen' and oo_a1.alkamispaiva > '2022-07-31'))
		--rajataan pois muihin sisältyvät opiskeluoikeudet
		and oo_a1.sisaltyy_opiskeluoikeuteen_oid is null and oo_a2.sisaltyy_opiskeluoikeuteen_oid is null and oo_a3.sisaltyy_opiskeluoikeuteen_oid is null
		--rajataan pois tulevaisuudessa alkavat jaksot
		and ooa1.alku < getdate() and ooa2.alku < getdate() and coalesce(ooa3.alku,'1900-01-01') < getdate()

		group by 
			oo_a1.opiskeluoikeus_oid, oo_a2.opiskeluoikeus_oid, oo_a3.opiskeluoikeus_oid
			,oo_a1.paattymispaiva, oo_a2.paattymispaiva, oo_a3.paattymispaiva
			,ps1.suorituksen_tyyppi, ps2.suorituksen_tyyppi, ps3.suorituksen_tyyppi
			,ooa1b.tila, ooa2b.tila, ooa3b.tila

	) q

	join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=q.oid1

) q2

WHERE (case when oid1 = oid_valittu then oid1 end) is not null
--where (case when oid1 != oid_valittu then oid1 end) is not null


GO


