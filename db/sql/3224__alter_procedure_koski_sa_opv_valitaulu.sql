USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 23.8.2020 18:41:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] @minVuosi int, @maxVuosi int = NULL AS

DECLARE @startDate DATE, @endDate DATE
SET @startDate = CONCAT(@minVuosi,'-01-01')
SET @endDate = EOMONTH(@startDate)

--Proseduuritaulun tyhjennys ennen uusien tietojen kirjoittamista
--TRUNCATE TABLE sa.proseduuri_opiskelijavuodet


EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat
EXEC Koski_SA.dbo.p_lataa_kustannusryhma_osasuoritus


WHILE YEAR(@startDate) <= COALESCE(@maxVuosi, 9999)
AND @startDate <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --EDELLISEN KUUKAUDEN EKA PÄIVÄ

BEGIN

	--aloitusaika talteen
	INSERT INTO sa.proseduuri_opiskelijavuodet(vuosi,kuukausi,alku) 
	SELECT YEAR(@startDate),MONTH(@startDate),GETDATE()
	
	--poistetaan kohdetaulusta tarkasteltavan kuukauden tiedot
	DELETE FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu] WHERE vuosi = YEAR(@startDate) AND kuukausi = MONTH(@startDate)
		
	--Temp-taulujen lataus
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_oidit @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_paatason_suoritus
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva @startDate

	INSERT INTO [Koski_SA].[dbo].[opiskelijavuodet_valitaulu]
		
	SELECT 
		 vuosi = YEAR(CAST(@startDate AS date))

		,kuukausi = MONTH(CAST(@startDate AS date))

		,tilv_date = @startDate

		,oppija_oid = oo.oppija_oid

		,opiskeluoikeus_oid = oo.opiskeluoikeus_oid

		,sukupuoli =	
				CASE 
					WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '2' 
					WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '1' 
					ELSE NULL 
				END

		,aidinkieli = h.aidinkieli

		,ika = YEAR(@startDate)-YEAR(h.syntymaaika)

		,osa_aikaisuus  =	
				CASE 
					WHEN ooa.osa_aikaisuus = 100 OR ooa.osa_aikaisuus is NULL THEN 0 
					ELSE 1
				END
		
		,oppis = ooa.oppisopimus_jossain_paatason_suorituksessa

		,erityisopetus =	
				CASE				
					WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
					WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
					WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
					WHEN ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
					WHEN ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
					WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
					WHEN ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
					WHEN ps.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
					WHEN ooa.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
					ELSE 9
				END

		,majoitus =	
				CASE					
					WHEN ooa.majoitus = 1 THEN 2
					WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
					WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
					ELSE 1
				END

		,vankilaopetus = ooa.vankilaopetuksessa

		,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus

		,tyovoimakoulutus = 
				CASE 
					WHEN ooa.opintojen_rahoitus in ('10','2','3','12') THEN 1 
					ELSE 0 
				END
		
		,koulk = coalesce(nullif(ps.koulutusluokitus_koodi,'999904'), ps.tutkinto_koodiarvo)
		,koulk_pihvi = ps2.koulutusluokitus_koodi
		,tutkinnonosa_koodi = otkr.tutkinnonosa_koodi
		,koulutusmuoto_pihvi = oo2.koulutusmuoto

		,tunn_oid = oo.oppilaitos_oid

		,jarj_oid = oo.koulutustoimija_oid
		,jarj_oid_hist = oo.vanha_koulutustoimija_oid
		,jarj_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end
		,jarj_oid_pihvi_hist = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end

		,toim_oid = ps.toimipiste_oid
		
		,kustannusryhma = NULL
			/*	CASE 
					WHEN ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN otkr.kr
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 'muu'
					ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk) 
				END
			*/

		,suorituksen_tyyppi = ps.suorituksen_tyyppi

		,opintojen_rahoitus = ooa.opintojen_rahoitus

		,osaamisala = ps.osaamisala_koodiarvo
		,muu_ammatillinen_tarkenne =
				CASE 
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' and ps.koulutusmoduuli_koodisto = 'ammatilliseentehtavaanvalmistavakoulutus' then '94095'
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then '94090'
					ELSE NULL
				END

		,oo.alkamispaiva

		-- opiskelijavuosi = ((jakson lopetuspäivä-jakson aloituspäivä + 1) - (yli neljä viikkoa kestäneen loman neljä viikkoa ylittävä viikkojen määrä x 7)) x osa-aikaisuusprosentti / 365 
		,opiskelijavuosi_lasna = ooa.lasna_pv_hyv 
																		
		,opiskelijavuosi_loma =	ooa.loma_pv_hyv 

		,opiskelijavuosi_opva =	ooa.opva_pv_hyv 

		,hylatty_opiskelijavuosi_loma =					case
															when coalesce(nullif(ooa.aiempi_koulutusmuoto,''),'ammatillinenkoulutus') = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 then 0.0
		/* samana päivänä alkaneet, kokonaan hylättävät */	when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.toisen_opiskeluoikeuden_sisalla = 1 then 0.0
		/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then 0.0
															else (ooa.loma_pv_nyk - ooa.loma_pv_hyv) 
														end 

		--,hylatty_opiskelijavuosi_opva = case when ooa.opiskeluoikeus_hylataan = 0 then (ooa.opva_pv_nyk - ooa.opva_pv_hyv) * (ooa.osa_aikaisuus / 100.0) / 365.0 else 0.0 end

		,hylatty_opiskelijavuosi_paallekkainen_amm =	case
															when coalesce(nullif(ooa.aiempi_koulutusmuoto,''),'ammatillinenkoulutus') = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + opva_pv_hyv_ei_muokattu) 
		/* samana päivänä alkaneet, kokonaan hylättävät */	when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.toisen_opiskeluoikeuden_sisalla = 1 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv))  
		/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
															else 0.0 
														end
		,hylatty_opiskelijavuosi_paallekkainen_lukio =	case
															when ooa.aiempi_koulutusmuoto = 'lukiokoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.toisen_opiskeluoikeuden_sisalla = 1 then ((ooa.lasna_pv_hyv_ei_muokattu-ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
		/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'lukiokoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
															else 0.0 
														end

		,hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus =	
														case
															when ooa.aiempi_koulutusmuoto = 'perusopetuksenlisaopetus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.toisen_opiskeluoikeuden_sisalla = 1 then ((ooa.lasna_pv_hyv_ei_muokattu-ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
		/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'perusopetuksenlisaopetus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
															else 0.0 
														end

		,hylatty_opiskelijavuosi_sisaltyy_toiseen = case when ooa.sisaltyy_toiseen_opiskeluoikeuteen = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + ooa.opva_pv_hyv_ei_muokattu) else 0.0 end
					
	FROM [sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid
	INNER JOIN (
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut 
			UNION
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
			UNION
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva
	) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps2 ON ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma otkr ON otkr.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and otkr.paatason_suoritus_id = ps.paatason_suoritus_id
	LEFT JOIN sa.sa_koski_henkilo h ON h.oppija_oid = oo.oppija_oid

	WHERE NOT (ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' AND YEAR(@startDate) = 2018) --2018 muu ammatillinen koulutus valokselta
	AND ps.suorituksen_tyyppi IS NOT NULL

	--lopetusaika talteen
	UPDATE sa.proseduuri_opiskelijavuodet
	SET loppu = GETDATE(), kesto = (select convert(char(8),dateadd(s,datediff(s,alku,getdate()),'1900-1-1'),8))
	WHERE vuosi = YEAR(@startDate) and kuukausi = MONTH(@startDate) and loppu is null

	SET @startDate = DATEADD(MONTH,1,@startDate)
	SET @endDate = EOMONTH(@startDate)

END

GO
USE ANTERO