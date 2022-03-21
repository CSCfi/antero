USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 30.3.2021 15:23:38 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 30.3.2021 15:23:38 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 30.3.2021 15:23:38 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_opiskelijavuodet_valitaulu]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 30.3.2021 15:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_opiskelijavuodet_valitaulu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] @minVuosi int, @maxVuosi int = NULL AS

DECLARE @startDate DATE, @endDate DATE
SET @startDate = CONCAT(@minVuosi,'-01-01')
SET @endDate = EOMONTH(@startDate)

--Proseduuritaulun tyhjennys ennen uusien tietojen kirjoittamista
--TRUNCATE TABLE sa.proseduuri_opiskelijavuodet


EXEC sa.p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat
EXEC dbo.p_lataa_kustannusryhma_osasuoritus


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
	EXEC sa.p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet @startDate
	EXEC sa.p_lataa_opiskelijavuodet_paatason_suoritus
	EXEC sa.p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma
	EXEC sa.p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut @startDate
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma @startDate
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva @startDate

	INSERT INTO [dbo].[opiskelijavuodet_valitaulu]
		
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
		,tp.tutkintotyyppi

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
		,kustannusryhma_uusi =
				CASE 
					WHEN ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') THEN otkr.kr_uusi
					WHEN ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 'muu'
					ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk_uusi) 
				END
								
	FROM [sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
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
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 30.3.2021 15:23:38 ******/
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
	,[suorituksen_tyyppi] = 
		CASE
			WHEN suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
			WHEN suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
			ELSE 2 --tutkinnon osa/osia
		END
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
	,[kustannusryhma_uusi] =
		case op_vuosi_tyyppi
			when 'opiskelijavuosi_opva' then 'ot'
			else kustannusryhma_uusi
		end	  
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



WHERE [op_paivat] > 0.0000
 
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 30.3.2021 15:23:38 ******/
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

SELECT 
	q.*
	,lupa_koulutus = 
		case	
			when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' or (year(q.alkamispaiva) < 2018 and coalesce(nullif(d11b.koulutusastetaso2_koodi,'-1'),d11a.koulutusastetaso2_koodi) in ('33','41')) then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
					when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
					when muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
					when muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
					when muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
					when muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
					when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
					when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
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
					when d10.kytkin_koodi = '1' and d11a.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
					when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
					when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
					else 1
				end
		end
	,verrataan_lupatietoihin =
		case 
			when (d11a.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11a.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
			else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
		end

INTO [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

FROM [dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN ANTERO.dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN ANTERO.dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN ANTERO.dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.koulk
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11b ON d11b.koulutusluokitus_koodi = q.koulk_pihvi
LEFT JOIN ANTERO.dw.d_kytkin d25 ON d25.kytkin_koodi = (case when q.jarj_oid_pihvi is null then 0 else 1 end)
--LINKITYS LUPATIETOIHIN ALKAA
LEFT JOIN ANTERO.dw.d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11a.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11a.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
--tutkinto-oikeudet
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) 
	and coalesce(nullif(d11b.koulutusluokitus_fi,'Tieto puuttuu'),d11a.koulutusluokitus_fi) in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
	and v1.jarjestajaYtunnus = 
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
--muut oikeudet
LEFT JOIN ANTERO.sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm 
	and v2.jarjestajaYtunnus =
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)





GO
USE ANTERO