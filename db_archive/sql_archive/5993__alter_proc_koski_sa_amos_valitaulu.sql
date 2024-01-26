USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 6.3.2022 18:28:21 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_opiskelijavuodet_valitaulu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] @minVuosi int = 2018, @maxVuosi int = NULL AS

DECLARE @startDate DATE, @endDate DATE
SET @startDate = CONCAT(@minVuosi,'-01-01')
SET @endDate = EOMONTH(@startDate)


EXEC sa.p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat


WHILE YEAR(@startDate) <= COALESCE(@maxVuosi, 9999)
AND @startDate <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --EDELLISEN KUUKAUDEN EKA PÄIVÄ

BEGIN

	--aloitusaika talteen
	INSERT INTO sa.proseduuri_opiskelijavuodet(vuosi,kuukausi,alku) 
	SELECT YEAR(@startDate),MONTH(@startDate),GETDATE()
	
	--poistetaan kohdetaulusta tarkasteltavan kuukauden tiedot
	DELETE FROM [dbo].[opiskelijavuodet_valitaulu] WHERE vuosi = YEAR(@startDate) AND kuukausi = MONTH(@startDate)
		
	--Temp-taulujen lataus
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_oidit @startDate
	EXEC sa.p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet --@startDate
	EXEC sa.p_lataa_opiskelijavuodet_paatason_suoritus
	EXEC dbo.p_lataa_kustannusryhma_osasuoritus @startDate
	EXEC sa.p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma
	EXEC sa.p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut --@startDate
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma --@startDate
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva --@startDate

	INSERT INTO [dbo].[opiskelijavuodet_valitaulu] (
		[vuosi]
		,[kuukausi]
		,[tilv_date]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[sukupuoli]
		,[aidinkieli]
		,[ika]
		,[osa_aikaisuus]
		,[oppis]
		,[erityisopetus]
		,[majoitus]
		,[vankilaopetus]
		,[henkilostokoulutus]
		,[tyovoimakoulutus]
		,[koulk]
		,[diaarinumero]
		,[koulk_pihvi]
		,[diaarinumero_pihvi]
		,[koulutusmuoto_pihvi]
		,[tunn_oid]
		,[jarj_oid]
		,[jarj_oid_hist]
		,[jarj_oid_pihvi]
		,[jarj_oid_pihvi_hist]
		,[toim_oid]
		,[kustannusryhma]
		,[suorituksen_tyyppi]
		,[suorituksen_kieli]
		,[opintojen_rahoitus]
		,[osaamisala]
		,[muu_ammatillinen_tarkenne]
		,[alkamispaiva]
		,[tutkosaa_pienempi_tt]
		,[opiskelijavuosi_lasna]
		,[opiskelijavuosi_loma]
		,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	  )
		
	SELECT 
		 vuosi = YEAR(CAST(@startDate AS date))

		,kuukausi = MONTH(CAST(@startDate AS date))

		,tilv_date = @startDate

		,oppija_oid = oo.oppija_oid

		,opiskeluoikeus_oid = oo.opiskeluoikeus_oid

		,sukupuoli = null

		,aidinkieli = null

		,ika = null 

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
		
		,koulk =  coalesce(tp.tutkinto, nullif(ps.koulutusluokitus_koodi,'999904'), ps.tutkinto_koodiarvo)
		,diaarinumero = ps.perusteenDiaarinumero
		,koulk_pihvi = coalesce(nullif(ps2.koulutusluokitus_koodi,'999904'), ps2.tutkinto_koodiarvo)
		,diaarinumero_pihvi = ps2.perusteenDiaarinumero
		,koulutusmuoto_pihvi = oo2.koulutusmuoto

		,tunn_oid = oo.oppilaitos_oid

		,jarj_oid = oo.koulutustoimija_oid
		,jarj_oid_hist = oo.vanha_koulutustoimija_oid
		,jarj_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end
		,jarj_oid_pihvi_hist = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end

		,toim_oid = ps.toimipiste_oid
		
		,kustannusryhma = 
				CASE 
					WHEN ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') THEN otkr.kr
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 'muu'
					ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk) 
				END
		--,kustannusryhma_uusi =
		--		CASE 
		--			WHEN ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') THEN otkr.kr_uusi
		--			WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 'muu'
		--			ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk_uusi) 
		--		END

		,suorituksen_tyyppi = ps.suorituksen_tyyppi
		,suorituksen_kieli = coalesce(ps2.suorituskieli_koodiarvo, ps.suorituskieli_koodiarvo)
		,opintojen_rahoitus = ooa.opintojen_rahoitus

		,osaamisala = ps.osaamisala_koodiarvo
		,muu_ammatillinen_tarkenne =
				CASE 
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' and ps.koulutusmoduuli_koodisto = 'ammatilliseentehtavaanvalmistavakoulutus' then '94095'
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then '94090'
					ELSE NULL
				END

		,oo.alkamispaiva
		,tp.tutkintotyyppi

		-- opiskelijavuosi = ((jakson lopetuspäivä-jakson aloituspäivä + 1) - (yli neljä viikkoa kestäneen loman neljä viikkoa ylittävä viikkojen määrä x 7)) x osa-aikaisuusprosentti / 365 
		,opiskelijavuosi_lasna = ooa.lasna_pv_hyv 															
		,opiskelijavuosi_loma =	ooa.loma_pv_hyv 
		,opiskelijavuosi_opva =	ooa.opva_pv_hyv 

		,hylatty_opiskelijavuosi_loma =	case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_amm > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_lukio > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus > 0 then 0 else ca.hylatty_opiskelijavuosi_loma end
		--,hylatty_opiskelijavuosi_opva = case when ooa.opiskeluoikeus_hylataan = 0 then (ooa.opva_pv_nyk - ooa.opva_pv_hyv) * (ooa.osa_aikaisuus / 100.0) / 365.0 else 0.0 end
		,hylatty_opiskelijavuosi_paallekkainen_amm = case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_amm end
		,hylatty_opiskelijavuosi_paallekkainen_lukio = case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_lukio end
		,hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus =	case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus end
		,hylatty_opiskelijavuosi_sisaltyy_toiseen = ca.hylatty_opiskelijavuosi_sisaltyy_toiseen
		
								
	FROM [sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN (
		SELECT
			sisaltyy_opiskeluoikeuteen_oid
			,opiskeluoikeus_oid
			,koulutustoimija_oid
			,vanha_koulutustoimija_oid
			,koulutusmuoto
			,rnk = row_number() over (partition by sisaltyy_opiskeluoikeuteen_oid order by alkamispaiva desc, viimeisin_tila desc, opiskeluoikeus_oid)
		FROM sa.sa_koski_opiskeluoikeus 
		WHERE sisaltyy_opiskeluoikeuteen_oid is not null
	) oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid and rnk = 1

	INNER JOIN (
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut
			UNION
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
			UNION
			SELECT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva
	) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps2 ON ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma otkr ON otkr.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and otkr.paatason_suoritus_id = ps.paatason_suoritus_id
	LEFT JOIN sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat tp ON tp.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and tp.paatason_suoritus_id = ps.paatason_suoritus_id
	--LEFT JOIN sa.sa_koski_henkilo h ON h.oppija_oid = oo.oppija_oid

	CROSS APPLY (
		SELECT 
			hylatty_opiskelijavuosi_loma =					case
																when coalesce(nullif(ooa.aiempi_koulutusmuoto,''),'ammatillinenkoulutus') = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 then 0.0
			/* samana päivänä alkaneet, kokonaan hylättävät */	when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and valiaikainen_keskeytys = 0 then 0.0
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and valiaikainen_keskeytys = 0 then 0.0
																else (ooa.loma_pv_nyk - ooa.loma_pv_hyv) 
															end 

			--,hylatty_opiskelijavuosi_opva = case when ooa.opiskeluoikeus_hylataan = 0 then (ooa.opva_pv_nyk - ooa.opva_pv_hyv) * (ooa.osa_aikaisuus / 100.0) / 365.0 else 0.0 end

			,hylatty_opiskelijavuosi_paallekkainen_amm =	case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when coalesce(nullif(ooa.aiempi_koulutusmuoto,''),'ammatillinenkoulutus') = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + opva_pv_hyv_ei_muokattu) 
			/* samana päivänä alkaneet, kokonaan hylättävät */	when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv))  
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'ammatillinenkoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end
			,hylatty_opiskelijavuosi_paallekkainen_lukio =	case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_koulutusmuoto = 'lukiokoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu-ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'lukiokoulutus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus =	
															case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_koulutusmuoto = 'perusopetuksenlisaopetus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu-ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = 'perusopetuksenlisaopetus' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end
			,hylatty_opiskelijavuosi_sisaltyy_toiseen = case when ooa.sisaltyy_toiseen_opiskeluoikeuteen = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + ooa.opva_pv_hyv_ei_muokattu) else 0.0 end
	) ca

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
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot] AS


TRUNCATE TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot]

INSERT INTO [dbo].[opiskelijavuodet_valitaulu_unpivot]

SELECT 
	 [vuosi]
	,[kuukausi]
	,[tilv_date]
	,unpvt.[oppija_oid]
	,[opiskeluoikeus_oid]
	,[sukupuoli] = 
		CASE 
			WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '2' 
			WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '1' 
			ELSE NULL 
		END
	,[aidinkieli] = h.aidinkieli
	,[ika] = YEAR(tilv_date)-YEAR(h.syntymaaika)
	,[osa_aikaisuus]
	,[oppis]
	,[erityisopetus]
	,[majoitus]
	,[vankilaopetus]
	,[henkilostokoulutus]
	,[tyovoimakoulutus]
	,[koulk]
	,[diaarinumero]
	,[koulk_pihvi]
	,[diaarinumero_pihvi]
	,[koulutusmuoto_pihvi]
	,[tunn_oid]
	,[jarj_oid]
	,[jarj_oid_hist]
	,[jarj_oid_pihvi]
	,[jarj_oid_pihvi_hist]
	,[toim_oid]
	,[suorituksen_tyyppi] = 
		CASE
			WHEN suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
			WHEN suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
			ELSE 2 --tutkinnon osa/osia
		END
	,[suorituksen_kieli]
	,[opintojen_rahoitus]
	,[osaamisala]
	,[muu_ammatillinen_tarkenne]
	,[alkamispaiva]
	,[tutkosaa_pienempi_tt]
	,[kustannusryhma] =
		case op_vuosi_tyyppi
			when 'opiskelijavuosi_opva' then 'ot'
			else kustannusryhma
		end
	
	,[hylkaamisen_peruste] =
		case op_vuosi_tyyppi
			when 'hylatty_opiskelijavuosi_loma' then 1
			when 'hylatty_opiskelijavuosi_paallekkainen_amm' then 2
			when 'hylatty_opiskelijavuosi_paallekkainen_lukio' then 3
			when 'hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus' then 4
			when 'hylatty_opiskelijavuosi_sisaltyy_toiseen' then 5
			else 9
		end
	,[hyvaksytaan] = 
		case
			when op_vuosi_tyyppi like 'hylatty_%' then 0
			else 1
		end
	,[op_vuodet] = op_paivat / 365.0
	--,[kustannusryhma_uusi] =
	--	case op_vuosi_tyyppi
	--		when 'opiskelijavuosi_opva' then 'ot'
	--		else kustannusryhma_uusi
	--	end	  
FROM [dbo].[opiskelijavuodet_valitaulu] vt

unpivot (
	op_paivat for op_vuosi_tyyppi in (
		 [opiskelijavuosi_lasna]
		,[opiskelijavuosi_loma]
		,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
) unpvt

left join sa.sa_koski_henkilo h ON h.oppija_oid = unpvt.oppija_oid

WHERE [op_paivat] > 0.0000
 


GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat] AS' 
END
GO



ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat] AS


DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

;WITH ep AS (
	SELECT
		tutkintokoodi
		,nimi_fi
		,voimassaoloalkaa = case when diaarinumero='OPH-2596-2019' then '2018-01-01' else voimassaoloalkaa end --Tieto- ja viestintätekniikan perustutkinto hyväksytään jo ennen varsinaista voimaantuloa
		,voimassaololoppuu
		,siirtymapaattyy
		,min_alkaa = min(voimassaoloalkaa) over (partition by tutkintokoodi)
	FROM sa.sa_eperusteet
	WHERE nimi_fi not like '%kokeilu%' and tutkintokoodi is not null
)

SELECT 
	q.*
	,lupa_koulutus = 
		case	
			when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' or (year(q.alkamispaiva) < 2018 and d11.koulutusastetaso2_koodi in ('33','41')) then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
					when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
					else 1
				end
		end
	,lupa_majoitus = 
		case
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when q.majoitus = 3 and v2.sisaoppilaitosmuotoinen = 0 then 2
					else 1
				end
		end
	,lupa_korotustekija = 
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d10.kytkin_koodi = '1' and d11.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
					when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
					when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
					else 1
				end
		end
	,lupa_suorituskieli = 
		case 		
			when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.organisaatio_koodi is not null then '-2' 
			when l.organisaatio_koodi is null and q.suorituksen_kieli != 'FI' then '-2'
			else q.suorituksen_kieli 
		end
	,verrataan_lupatietoihin = d21.kytkin_koodi
	,lupa_jarj_nimi = sjl.nimi_amos_spl
	,lupa_jarj_ytunnus = ca.jarj
	,lupa_koulutus_laaja_oppis = v2.laaja_oppis

INTO [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

FROM [dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN ANTERO.dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN ANTERO.dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN ANTERO.dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = coalesce(q.koulk_pihvi, q.koulk)
OUTER APPLY (
	select top 1
		*
	from ep
	where tutkintokoodi = coalesce(d11.uusi_eat_koodi, d11.koulutusluokitus_koodi) 
	and (
		case
			when tilv_date < ep.min_alkaa then ep.min_alkaa
			else tilv_date
		end
	) between ep.voimassaoloalkaa and coalesce(ep.siirtymapaattyy, ep.voimassaololoppuu, '9999-12-31') 
) d12 
--LINKITYS LUPATIETOIHIN ALKAA
--tapaukset joita verrataan lupatietoihin
LEFT JOIN ANTERO.dw.d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0 
	end
)
--y-tunnus jonka lupatietoihin verrataan
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
CROSS APPLY (
	SELECT 
		jarj =
			case 
				when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
				else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
			end
) ca
LEFT JOIN (
	select distinct
		 d1.organisaatio_koodi
		,alkupvm = d2.paivays
		,loppupvm = d3.paivays
	from ANTERO.dw.f_oiva_luvat_amm f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
	left join ANTERO.dw.d_kalenteri d2 on d2.id = f.d_kalenteri_luvan_alku_id
	left join ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_luvan_loppu_id
) l on l.organisaatio_koodi = ca.jarj and tilv_date between l.alkupvm and l.loppupvm

--tutkinto-oikeudet
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) 
													and v1.jarjestajaYtunnus = ca.jarj
													and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5) 
--muut oikeudet
LEFT JOIN ANTERO.sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm 
													and v2.jarjestajaYtunnus = ca.jarj
--kielet, opetus
LEFT JOIN ANTERO.sa.sa_amos_oiva_opetuskielet v3 ON tilv_date between v3.alkupvm and v3.loppupvm 
													and v3.jarjestajaYtunnus = ca.jarj 
													and q.suorituksen_kieli in (v3.kieli1,v3.kieli2,v3.kieli3) 
--kielet, tutkinto
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkintokielet v4 ON tilv_date between v4.alkupvm and coalesce(v4.siirtymapaattyy,v4.loppupvm) 
													and v4.jarjestajaYtunnus = ca.jarj 
													and q.suorituksen_kieli in (v4.kieli1,v4.kieli2,v4.kieli3) 
													and v4.tutkintokoodi = coalesce(d11.uusi_eat_koodi, d11.koulutusluokitus_koodi) 


GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS' 
END
GO






ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS


TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

SELECT 
	year(ptkr.vahvistus_paiva) as vuosi,
	month(ptkr.vahvistus_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	ptkr.koulutustoimija_oid,
	ptkr.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.oppija_oid,
	ptkr.opiskeluoikeus_oid,
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	ptkr.paatason_suoritus_id,
	NULL AS suoritustason_tunniste,
	NULL AS koulutusmoduuli_koodiarvo,
	NULL AS koulutusmoduuli_koodiarvo_numeerinen,
	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi,

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo jätetään vertailutiedoksi
	0 as koulutusmoduuli_laajuus_arvo_alkup,
	0 as tos_koulutusmoduuli_laajuus_arvo, 
	0 as koulutusmoduuli_laajuus_arvo,

	ptkr.tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	--ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	ptkr.suorituskieli_koodiarvo,

	ptkr.kustannusryhma_koodi,
	--ptkr.alkup_kustannusryhmakoodi, 

	NULL AS ep_usean_tutkinnon_tutkinnonosa,
	NULL AS yhteinen_tutkinnon_osa, 
	NULL AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	ptkr.suorittaa_koko_tutkintoa, 
	NULL AS arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi, op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,ptkr.suorituksen_tyyppi
	,coalesce(op2.oppisopimus, op.oppisopimus) as oppisopimus_koodi
	,coalesce(op.erityisopetus_koodi, op2.erityisopetus_koodi) as erityisopetus_koodi
	,coalesce(op.vankilaopetuksessa, op2.vankilaopetuksessa) as vankilaopetus_koodi

	,paataso = 1
	--,ptkr.kustannusryhma_koodi_uusi
FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] as ptkr  
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON ptkr.opiskeluoikeus_oid = op.opiskeluoikeus_oid	AND ptkr.vahvistus_paiva_muokattu between op.alku and op.loppu--AP 20.6.2019 n. 400 oidia tulee tuplana, koska kaksi päätason suoritus (kokotutkinto x2 tai koko+osittainen)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = ptkr.ylempi_opiskeluoikeus_oid	AND ptkr.vahvistus_paiva_muokattu_kuori between op2.alku and op2.loppu

WHERE 1=1
AND ptkr.tutkintotyyppi_koodi IN ('02','19','20')
--kuorioikeudet pois
AND ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from sa.sa_koski_opiskeluoikeus where koulutusmuoto = 'ammatillinenkoulutus' and sisaltyy_opiskeluoikeuteen_oid is not null)
AND year(ptkr.vahvistus_paiva) >= 2018

UNION ALL

SELECT 
	year(tos.arviointi_paiva) as vuosi,
	month(tos.arviointi_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	tos.koulutustoimija_oid,
	tos.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.oppija_oid,
	tos.opiskeluoikeus_oid, 
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	tos.paatason_suoritus_id, 
	tos.suoritustason_tunniste,
	tos.koulutusmoduuli_koodiarvo,
	tos.koulutusmoduuli_koodiarvo_numeerinen,

	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi, --op.diaarinumero+'_'+cast(tos.koulutusmoduuli_koodiarvo_numeerinen as varchar(25)) as diaarinumero_tutkinnonosa_koodi,

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo jätetään vertailutiedoksi
	koulutusmoduuli_laajuus_arvo_alkup,
	tos.koulutusmoduuli_laajuus_arvo as tos_koulutusmoduuli_laajuus_arvo, 
	case 
		when vtl.diaarinumero is null then tos.koulutusmoduuli_laajuus_arvo 
		else vtl.tutkinnonosa_laajuus 
	end as koulutusmoduuli_laajuus_arvo,

	tos.koulutusmoduuli_koodiarvo_paataso as tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	--ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	ptkr.suorituskieli_koodiarvo,
	
	coalesce(
		case 
			when tos.yhteinen_tutkinnon_osa = 1 then '1' 
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 and tos.suorittaa_koko_tutkintoa = 0  then '1'
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 and tos.suorittaa_koko_tutkintoa = 1  then coalesce(okr2.kustannusryhma_koodi, tkr2.kustannusryhma_koodi) --cast(ptkr.kustannusryhma_koodi as varchar)
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 then cast(tos.kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma as varchar)
			when usean_tutkinnon_tutkinnonosa = 0 then coalesce(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
		end, 
	coalesce(case when tos.suorittaa_koko_tutkintoa = 0 then '1' end, okr2.kustannusryhma_koodi, tkr2.kustannusryhma_koodi)
	) as kustannusryhma_koodi, 
	
	--ptkr.alkup_kustannusryhmakoodi, 
	tos.usean_tutkinnon_tutkinnonosa,
	tos.yhteinen_tutkinnon_osa, 
	--tos.toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	NULL AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
	ptkr.suorittaa_koko_tutkintoa, 
	tos.arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi, op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,tos.suorituksen_tyyppi
	,coalesce(op2.oppisopimus, op.oppisopimus) as oppisopimus_koodi
	,coalesce(op.erityisopetus_koodi, op2.erityisopetus_koodi) as erityisopetus_koodi
	,coalesce(op.vankilaopetuksessa, op2.vankilaopetuksessa) as vankilaopetus_koodi

	,paataso = 0
	--,coalesce(
	--	CASE 
	--		WHEN tos.yhteinen_tutkinnon_osa = 1 THEN '1' 
	--		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 0  THEN '1'
	--		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 1  THEN cast(ptkr.kustannusryhma_koodi as varchar)
	--		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 THEN cast(tos.kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi as varchar)
	--		WHEN usean_tutkinnon_tutkinnonosa = 0 THEN coalesce(okr.kustannusryhma_koodi,tkr_u.kustannusryhma_koodi)
	--		ELSE coalesce(okr.kustannusryhma_koodi,tkr_u.kustannusryhma_koodi)
	--	END, 
	--	ptkr.kustannusryhma_koodi_uusi
	--) AS kustannusryhma_koodi_uusi

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] tos
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON op.opiskeluoikeus_oid = tos.opiskeluoikeus_oid AND (tos.arviointi_paiva_muokattu between op.alku and op.loppu)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = tos.ylempi_opiskeluoikeus_oid AND tos.arviointi_paiva_muokattu_kuori between op2.alku and op2.loppu
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] ptkr ON ptkr.paatason_suoritus_id = tos.paatason_suoritus_id
LEFT JOIN [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus] vtl on vtl.diaarinumero = ptkr.diaarinumero
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr on okr.osaamisala_koodi = coalesce(tos.osaamisala_johon_tutkinnonosa_kuuluu,'') and year(tos.arviointi_paiva) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tos.tutkinto_johon_tutkinnonosa_kuuluu
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr on tkr.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and year(tos.arviointi_paiva) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))
--
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr2 on okr2.osaamisala_koodi = coalesce(ptkr.osaamisala_koodiarvo,'') and year(tos.arviointi_paiva) between year(okr2.alkupvm) and year(coalesce(okr2.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl2 on kl2.koulutusluokitus_koodi = ptkr.tutkinto_koodi
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr2 on tkr2.tutkinto_koodi = coalesce(kl2.uusi_eat_koodi, kl2.koulutusluokitus_koodi) and year(tos.arviointi_paiva) between year(tkr2.alkupvm) and year(coalesce(tkr2.loppupvm,'9999-12-31'))
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u on tkr_u.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
--kuorioikeudet pois
--WHERE ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from sa.sa_koski_opiskeluoikeus where koulutusmuoto = 'ammatillinenkoulutus' and sisaltyy_opiskeluoikeuteen_oid is not null)

GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS' 
END
GO


ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS


--TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

--INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]


SELECT 
	vuosi
	,kuukausi
	,sukupuoli = h.sukupuoli
	,aidinkieli = h.aidinkieli
	,ika = ca.ika
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi_koodi = ca.suorituksen_tyyppi_koodi
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
	,tutkinnot = count(distinct ca.tutkinto)
	,tutkinnon_osat = count(distinct suoritustason_tunniste)
	,osaamispisteet = sum(koulutusmoduuli_laajuus_arvo)

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
LEFT JOIN sa.sa_koski_henkilo h ON h.oppija_oid = f.oppija_oid
CROSS APPLY (
	SELECT 
		ika = vuosi-year(replace(syntymaaika,190,200))
		,suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
		,tutkinto = case when paataso = 1 and suorituksen_tyyppi = 'ammatillinentutkinto' then f.oppija_oid end
) ca

GROUP BY
	vuosi
	,kuukausi
	,h.sukupuoli
	,h.aidinkieli
	,ca.ika
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,ca.suorituksen_tyyppi_koodi
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 6.3.2022 18:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat] AS' 
END
GO

ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat] AS

DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]

;WITH ep AS (
	SELECT
		tutkintokoodi
		,nimi_fi
		,voimassaoloalkaa = case when diaarinumero='OPH-2596-2019' then '2018-01-01' else voimassaoloalkaa end --Tieto- ja viestintätekniikan perustutkinto hyväksytään jo ennen varsinaista voimaantuloa
		,voimassaololoppuu
		,siirtymapaattyy
		,min_alkaa = min(voimassaoloalkaa) over (partition by tutkintokoodi)
	FROM Koski_SA.sa.sa_eperusteet
	WHERE nimi_fi not like '%kokeilu%'
)

SELECT 
	q.*
	,lupa_koulutus = 
		case 
			when d21.kytkin_koodi = 0 or (year(q.alkamispaiva) < 2018 and d1.koulutusastetaso2_koodi in ('33','41')) then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot > 0 and osaamispisteet = 0 then 20
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot > 0 and osaamispisteet = 0 and v2.laaja_oppis = 0 then 21
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot = 0 and osaamispisteet > 0 then 22
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot = 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 23
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot > 0 and osaamispisteet > 0 then 24
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot > 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 25
					else 1
				end
		end
	,lupa_korotustekija =
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot > 0 and osaamispisteet = 0 then 10
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot = 0 and osaamispisteet > 0 then 11
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot > 0 and osaamispisteet > 0 then 12
					else 1
				end
		end
	,lupa_suorituskieli =
		case 		
			when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.organisaatio_koodi is not null then '-2' 
			when l.organisaatio_koodi is null and q.suorituskieli_koodiarvo != 'FI' then '-2'
			else q.suorituskieli_koodiarvo		
		end
	,verrataan_lupatietoihin = d21.kytkin_koodi
	,lupa_jarj_nimi = coalesce(sjl.nimi_ennen_fuusiota, sjl.nimi_amos_spl)
	,lupa_jarj_ytunnus = ca2.jarj
	,lupa_tutk_nimi = d12.nimi_fi

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]

FROM [Koski_SA].[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] q
left join ANTERO.dw.d_koulutusluokitus d1 ON d1.koulutusluokitus_koodi = q.tutkinto_koodi
left join ANTERO.dw.d_erityisopetus d6 on d6.erityisopetus_koodi = q.erityisopetus_koodi
cross apply (SELECT tilv = datefromparts(vuosi,kuukausi,1)) ca1
outer apply (
	select top 1
		*
	from ep
	where tutkintokoodi = coalesce(d1.uusi_eat_koodi, d1.koulutusluokitus_koodi) 
	and (
		case
			when ca1.tilv < ep.min_alkaa then ep.min_alkaa
			else ca1.tilv
		end
	) between ep.voimassaoloalkaa and coalesce(ep.siirtymapaattyy, ep.voimassaololoppuu, '9999-12-31') 
) d12 
---
left join ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = q.oppisopimus_koodi
left join ANTERO.dw.d_kytkin d21 on d21.kytkin_koodi = 
(
	case 
		when (d1.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d1.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0
	end
)
left join ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl on sjl.oid_avain = coalesce(q.koulutustoimija_oid_pihvi_hist, q.koulutustoimija_oid_pihvi, q.koulutustoimija_oid_hist, q.koulutustoimija_oid)
cross apply (
	SELECT 
		jarj =
			case 
				when ca1.tilv < sjl.voimaan_alkaen then sjl.ytunnus_avain
				else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
			end
) ca2
--ammatillisen koulutuksen luvat
LEFT JOIN (
	select distinct
		 d1.organisaatio_koodi
		,alkupvm = d2.paivays
		,loppupvm = d3.paivays
	from ANTERO.dw.f_oiva_luvat_amm f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
	left join ANTERO.dw.d_kalenteri d2 on d2.id = f.d_kalenteri_luvan_alku_id
	left join ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_luvan_loppu_id
) l on l.organisaatio_koodi = ca2.jarj and ca1.tilv between l.alkupvm and l.loppupvm

--tutkinto-oikeudet
left join ANTERO.sa.v_amos_oiva_tutkinto_oikeudet v1 on (ca1.tilv between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm))  
												and v1.jarjestajaYtunnus = ca2.jarj
												and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)	
--muut oikeudet
left join ANTERO.sa.v_amos_oiva_muut_oikeudet v2 on ca1.tilv between v2.alkupvm and v2.loppupvm 
												and v2.jarjestajaYtunnus = ca2.jarj
--kielet, opetus
LEFT JOIN ANTERO.sa.sa_amos_oiva_opetuskielet v3 ON ca1.tilv between v3.alkupvm and v3.loppupvm 
												and v3.jarjestajaYtunnus = ca2.jarj 
												and q.suorituskieli_koodiarvo in (v3.kieli1,v3.kieli2,v3.kieli3) 
--kielet, tutkinto
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkintokielet v4 ON ca1.tilv between v4.alkupvm and coalesce(v4.siirtymapaattyy,v4.loppupvm) 
												and v4.jarjestajaYtunnus = ca2.jarj 
												and q.suorituskieli_koodiarvo in (v4.kieli1,v4.kieli2,v4.kieli3) 
												and v4.tutkintokoodi = d1.koulutusluokitus_koodi
GO
USE ANTERO