USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu]    Script Date: 30.7.2025 16.35.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF @@SERVERNAME like '%pvipu%'
EXEC (
'ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu] @minVuosi int = 2018, @maxVuosi int = NULL, @pv decimal(4,1) = NULL AS

--@pv annetaan toistaiseksi vain rinnakkaisraporttien ajossa

DECLARE @startDate DATE, @endDate DATE
SET @startDate = CONCAT(@minVuosi,''-01-01'')
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
	EXEC sa.p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet 
	EXEC sa.p_lataa_opiskelijavuodet_paatason_suoritus
	EXEC sa.p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma @startDate
	EXEC sa.p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut 
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
	EXEC sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva @pv

	INSERT INTO [dbo].[opiskelijavuodet_valitaulu] (
		[vuosi]
		,[kuukausi]
		,[tilv_date]
		,[master_oid]
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
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus] 
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
		
	SELECT 
		vuosi = YEAR(CAST(@startDate AS date))
		,kuukausi = MONTH(CAST(@startDate AS date))
		,tilv_date = @startDate

		,master_oid = oo.master_oid
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
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in (''telma'',''valma'',''tuvakoulutuksensuoritus'') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in (''telma'',''valma'',''tuvakoulutuksensuoritus'') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				WHEN ps.suorituksen_tyyppi not in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi not in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				WHEN ps.suorituksen_tyyppi in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi in (''telma'',''valma'',''tuvakoulutuksensuoritus'') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
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
				WHEN ooa.opintojen_rahoitus in (''10'',''2'',''3'',''12'') THEN 1 
				ELSE 0 
			END

		,koulk =  coalesce(tp.tutkinto, nullif(ps.koulutusluokitus_koodi,''999904''), ps.tutkinto_koodiarvo)
		,diaarinumero = ps.perusteenDiaarinumero
		,koulk_pihvi = coalesce(nullif(ps2.koulutusluokitus_koodi,''999904''), ps2.tutkinto_koodiarvo)
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
				WHEN ps.suorituksen_tyyppi in (''ammatillinentutkintoosittainen'',''tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'') THEN otkr.kr
				WHEN ps.suorituksen_tyyppi = ''muuammatillinenkoulutus'' then ''muu''
				ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk) 
			END
		,suorituksen_tyyppi = ps.suorituksen_tyyppi
		,suorituksen_kieli = coalesce(ps2.suorituskieli_koodiarvo, ps.suorituskieli_koodiarvo)
		,opintojen_rahoitus = ooa.opintojen_rahoitus
		,osaamisala = ps.osaamisala_koodiarvo
		,muu_ammatillinen_tarkenne =
			CASE 
				WHEN ps.suorituksen_tyyppi = ''muuammatillinenkoulutus'' and ps.koulutusmoduuli_koodisto = ''ammatilliseentehtavaanvalmistavakoulutus'' then ''94095''
				WHEN ps.suorituksen_tyyppi = ''muuammatillinenkoulutus'' then ''94090''
				ELSE NULL
			END
		,oo.alkamispaiva
		,tutkosaa_pienempi_tt = 
			CASE 
				WHEN liittyy_tutkinnonosaan_1_0 = 1 THEN coalesce(tp.tutkintotyyppi,''02'') --eperusteissa ei ainakaan kaikkia yhteisiä tutkinnon osia
				WHEN liittyy_tutkinnonosaan_1_0 = 0 THEN ''02''
			END

		-- opiskelijavuosi = ((jakson lopetuspäivä-jakson aloituspäivä + 1) - (yli neljä viikkoa kestäneen loman neljä viikkoa ylittävä viikkojen määrä x 7)) x osa-aikaisuusprosentti / 365 
		,opiskelijavuosi_lasna = ooa.lasna_pv_hyv 															
		,opiskelijavuosi_loma =	ooa.loma_pv_hyv 
		,opiskelijavuosi_opva =	ooa.opva_pv_hyv 

		,hylatty_opiskelijavuosi_loma =	case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_amm > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_lukio > 0 or ca.hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus > 0 then 0 else ca.hylatty_opiskelijavuosi_loma end
		--,hylatty_opiskelijavuosi_opva = case when ooa.opiskeluoikeus_hylataan = 0 then (ooa.opva_pv_nyk - ooa.opva_pv_hyv) * (ooa.osa_aikaisuus / 100.0) / 365.0 else 0.0 end
		,hylatty_opiskelijavuosi_paallekkainen_amm = case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_amm end
		,hylatty_opiskelijavuosi_paallekkainen_tuva_lukio = case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_tuva_lukio end
		,hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus = case when ca.hylatty_opiskelijavuosi_sisaltyy_toiseen>0 then 0 else ca.hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus end
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
			SELECT DISTINCT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut
			UNION ALL
			SELECT DISTINCT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
			UNION ALL
			SELECT DISTINCT * FROM sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva
	) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps2 ON ps2.opiskeluoikeus_oid = oo2.opiskeluoikeus_oid
	LEFT JOIN sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma otkr ON otkr.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and otkr.paatason_suoritus_id = ps.paatason_suoritus_id
	LEFT JOIN sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat tp ON tp.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and tp.paatason_suoritus_id = ps.paatason_suoritus_id

	CROSS APPLY (
		
		SELECT 
			hylatty_opiskelijavuosi_loma =					case
																when (coalesce(nullif(ooa.aiempi_koulutusmuoto,''''),''ammatillinenkoulutus'')=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'')
																	and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 then 0.0
			/* samana päivänä alkaneet, kokonaan hylättävät */	when (ooa.aiempi_koulutusmuoto=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'')
																	and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and valiaikainen_keskeytys = 0 then 0.0
			/* aikaisemmin alkaneet, päättyvät */				when (ooa.aiempi_koulutusmuoto=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'')
																	and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and valiaikainen_keskeytys = 0 then 0.0
																else (ooa.loma_pv_nyk - ooa.loma_pv_hyv) 
															end 

			--,hylatty_opiskelijavuosi_opva = case when ooa.opiskeluoikeus_hylataan = 0 then (ooa.opva_pv_nyk - ooa.opva_pv_hyv) * (ooa.osa_aikaisuus / 100.0) / 365.0 else 0.0 end

			,hylatty_opiskelijavuosi_paallekkainen_amm =	case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when (coalesce(nullif(ooa.aiempi_koulutusmuoto,''''),''ammatillinenkoulutus'')=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'')
																	and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 and ooa.alkanut_samana_paivana_hylataan = 1 
																	then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + opva_pv_hyv_ei_muokattu) 
			/* samana päivänä alkaneet, kokonaan hylättävät */	when (ooa.aiempi_koulutusmuoto=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'') and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 
																	then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv))  
			/* aikaisemmin alkaneet, päättyvät */				when (ooa.aiempi_koulutusmuoto=''ammatillinenkoulutus'' or ooa.aiempi_tuva_jarjestamislupa=''ammatillinen'') and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 
																	then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_paallekkainen_tuva_lukio =	
															case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_tuva_jarjestamislupa = ''lukio'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_tuva_jarjestamislupa = ''lukio'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus =	
															case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_tuva_jarjestamislupa = ''perusopetus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_tuva_jarjestamislupa = ''perusopetus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_paallekkainen_lukio =	case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_koulutusmuoto = ''lukiokoulutus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = ''lukiokoulutus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus =	
															case
																when ooa.valiaikainen_keskeytys = 1 then 0.0
																when ooa.aiempi_koulutusmuoto = ''perusopetuksenlisaopetus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + ooa.loma_pv_hyv_ei_muokattu + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
			/* aikaisemmin alkaneet, päättyvät */				when ooa.aiempi_koulutusmuoto = ''perusopetuksenlisaopetus'' and ooa.sisaltyy_toiseen_opiskeluoikeuteen = 0 then ((ooa.lasna_pv_hyv_ei_muokattu - ooa.lasna_pv_hyv) + (ooa.loma_pv_hyv_ei_muokattu - ooa.loma_pv_hyv) + (ooa.opva_pv_hyv_ei_muokattu - ooa.opva_pv_hyv)) 
																else 0.0 
															end

			,hylatty_opiskelijavuosi_sisaltyy_toiseen = case when ooa.sisaltyy_toiseen_opiskeluoikeuteen = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + ooa.opva_pv_hyv_ei_muokattu) else 0.0 end
	) ca

	WHERE NOT (ps.suorituksen_tyyppi = ''muuammatillinenkoulutus'' AND YEAR(@startDate) = 2018) --2018 muu ammatillinen koulutus valokselta
	AND ps.suorituksen_tyyppi IS NOT NULL

	--lopetusaika talteen
	UPDATE sa.proseduuri_opiskelijavuodet
	SET loppu = GETDATE(), kesto = (select convert(char(8),dateadd(s,datediff(s,alku,getdate()),''1900-1-1''),8))
	WHERE vuosi = YEAR(@startDate) and kuukausi = MONTH(@startDate) and loppu is null

	SET @startDate = DATEADD(MONTH,1,@startDate)
	SET @endDate = EOMONTH(@startDate)

END
'
)

GO
