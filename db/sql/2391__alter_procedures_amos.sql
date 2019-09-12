USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4]    Script Date: 12.9.2019 15:58:45 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3]    Script Date: 12.9.2019 15:58:45 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2]    Script Date: 12.9.2019 15:58:45 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1]    Script Date: 12.9.2019 15:58:45 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet]    Script Date: 12.9.2019 15:58:45 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opiskelijavuodet]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet]    Script Date: 12.9.2019 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet] AS

--opiskelijavuodet opiskeluoikeuksittain
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe1

--taulun unpivotointi
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe2

--yhdistäminen dimensioihin ja ryhmittely (group by)
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe3

--painotettujen muuttujien laskenta
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe4




GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1]    Script Date: 12.9.2019 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe1] AS

DECLARE @startDate DATE, @endDate DATE
SET @startDate = '2018-01-01'
SET @endDate = EOMONTH(@startDate)

--tämä erikseen koska nopeampi ajaa vain kerran koko datalle
EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_samana_paivana_alkaneet_hylattavat

WHILE @startDate <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --EDELLISEN KUUKAUDEN EKA PÄIVÄ

BEGIN

	DELETE FROM [Koski_SA].[sa].[opiskelijavuodet_valitaulu] WHERE vuosi = YEAR(@startDate) AND kuukausi = MONTH(@startDate)
		
	--Temp-taulut. Ensin muodostetaan kyseisen kuukauden perusjoukko ja sen jälkeen muut tiedot.
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_oidit @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_paallekkaiset_opiskeluoikeudet @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_paatason_suoritus
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_loma @startDate
	EXEC Koski_SA.sa.p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_opva @startDate
	
	INSERT INTO [Koski_SA].[sa].[opiskelijavuodet_valitaulu]
		
	SELECT 
		 vuosi = YEAR(CAST(@startDate AS date))

		,kuukausi = MONTH(CAST(@startDate AS date))

		,tilv_date = @startDate

		,oppija_oid = oo.oppija_oid

		,opiskeluoikeus_oid = oo.opiskeluoikeus_oid

		,sukupuoli =	
				CASE 
					WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '2' 
					WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '1' 
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
					WHEN ooa.opintojen_rahoitus in ('10','2','3') THEN 1 
					ELSE 0 
				END
		
		,koulk = ps.koulutusluokitus_koodi

		,tunn_oid = oo.oppilaitos_oid

		,jarj_oid = oo.koulutustoimija_oid

		,toim_oid = ps.toimipiste_oid
		
		,kustannusryhma =	
				CASE 
					--WHEN ooa.opva_pv_hyv > 0 THEN 'ot' 
					WHEN ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN otkr.kr
					ELSE COALESCE(ps.kustannusryhma_oa, ps.kustannusryhma_tutk) 
				END

		,suorituksen_tyyppi =	
				CASE
					WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 --koko tutkinto
					ELSE 2 --tutkinnon osa/osia
				END

		,opintojen_rahoitus = ooa.opintojen_rahoitus

		,osaamisala = ps.osaamisala_koodiarvo

		-- opiskelijavuosi = ((jakson lopetuspäivä-jakson aloituspäivä+1) - (yli neljä viikkoa kestäneen loman neljä viikkoa ylittävä viikkojen määrä x 7)) x osa-aikaisuusprosentti / 365 
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
		,hylatty_opiskelijavuosi_sisaltyy_toiseen = case when ooa.sisaltyy_toiseen_opiskeluoikeuteen = 1 then (ooa.lasna_pv_hyv_ei_muokattu + ooa.loma_pv_hyv_ei_muokattu + ooa.opva_pv_hyv_ei_muokattu) else 0.0 end
					
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo

	INNER JOIN (
			SELECT * FROM Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut 
			UNION
			SELECT * FROM Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma
			UNION
			SELECT * FROM Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva
	) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 

	LEFT JOIN Koski_SA.sa.temp_opiskelijavuodet_paatason_suoritus ps ON ps.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma otkr ON otkr.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and otkr.paatason_suoritus_id = ps.paatason_suoritus_id
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h ON h.oppija_oid = oo.oppija_oid
	

	SET @startDate = DATEADD(MONTH,1,@startDate)
	SET @endDate = EOMONTH(@startDate)

END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2]    Script Date: 12.9.2019 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe2] AS


TRUNCATE TABLE [Koski_SA].[sa].[opiskelijavuodet_valitaulu_unpivot]

INSERT INTO [Koski_SA].[sa].[opiskelijavuodet_valitaulu_unpivot]

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
	,[tunn_oid]
	,[jarj_oid]
	,[toim_oid]
	,[suorituksen_tyyppi]
	,[opintojen_rahoitus]
	,[osaamisala]
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
			when 'hylatty_opiskelijavuosi_sisaltyy_toiseen' then 4
			else 9
		end
	,[hyvaksytaan] = 
		case
			when op_vuosi_tyyppi like 'hylatty_%' then 0
			else 1
		end
	,[op_vuodet] = op_paivat / 365.0
	  
FROM [Koski_SA].[sa].[opiskelijavuodet_valitaulu]

UNPIVOT (
	op_paivat for op_vuosi_tyyppi in (
		 [opiskelijavuosi_lasna]
		,[opiskelijavuosi_loma]
		,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
) unpvt

WHERE [op_paivat] > 0.0000
   



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3]    Script Date: 12.9.2019 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe3] AS


TRUNCATE TABLE [ANTERO].[dw].[f_koski_amm_opiskelijavuodet]

	
INSERT INTO dw.f_koski_amm_opiskelijavuodet (
	 vuosi
	,d_kalenteri_id
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_osa_aikaisuus_id
	,d_erityisopetus_id
	,d_majoitus_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_toimipiste_id
	,d_kustannusryhma_id
	,d_suorituksen_tyyppi_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
	,opiskelijavuodet
	,opiskelijavuodet_hylatyt
	,loadtime
)

SELECT 
	
	 q.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_osa_aikaisuus_id = COALESCE(d20.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
	,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste = COALESCE(d19.id,-1)
	,opiskelijavuodet = SUM(case when q.hyvaksytaan = 1 then op_vuodet else 0 end)
	,opiskelijavuodet_hylatyt = SUM(case when q.hyvaksytaan = 0 then op_vuodet else 0 end)
	,GETDATE()
	
FROM [Koski_SA].[sa].[opiskelijavuodet_valitaulu_unpivot] q

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain=q.tilv_date
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi=q.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi=q.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain=q.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi=q.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi=q.majoitus
LEFT JOIN d_kytkin d7 ON d7.kytkin_koodi=q.oppis
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi=q.vankilaopetus
LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi=q.henkilostokoulutus
LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi=q.tyovoimakoulutus
LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi=q.koulk
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid=q.tunn_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid=q.jarj_oid
LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi=q.suorituksen_tyyppi
LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi=q.kustannusryhma
LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi=q.opintojen_rahoitus
LEFT JOIN d_osaamisala d17 ON d17.koodi=q.osaamisala
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid=q.toim_oid
LEFT JOIN d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN d_kytkin d20 ON d20.kytkin_koodi = q.osa_aikaisuus


GROUP BY 
q.vuosi
,COALESCE(d1.id,-1)
,COALESCE(d2.id,-1)
,COALESCE(d3.id,-1)
,COALESCE(d4.id,-1)
,COALESCE(d20.id,-1)
,COALESCE(d5.id,-1)
,COALESCE(d6.id,-1)
,COALESCE(d7.id,-1)
,COALESCE(d8.id,-1)
,COALESCE(d9.id,-1)
,COALESCE(d10.id,-1)
,COALESCE(d11.id,-1)
,COALESCE(d12.id,-1)
,COALESCE(d13.id,-1)
,COALESCE(d14.id,-1)
,COALESCE(d15.id,-1)
,COALESCE(d16.id,-1)
,COALESCE(d17.id,-1)
,COALESCE(d18.id,-1)
,COALESCE(d19.id,-1)




GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4]    Script Date: 12.9.2019 15:58:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4] AS' 
END
GO

--tämä proseduuri ajetaan p_lataa_f_koski_amm_opiskelijavuodet jälkeen. Ei tee muuta kuin laskee painotetut opiskelijavuodet käyttäen sa_amos_siirtotiedosto_okm7 arvoja.

ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_vaihe4] AS

TRUNCATE TABLE [ANTERO].[dw].[f_koski_amm_opiskelijavuodet_painotetut]

INSERT INTO dw.f_koski_amm_opiskelijavuodet_painotetut (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
    ,[opiskelijavuodet_painotettu_majoitus]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_painotettu_yhteensa]
	,[opiskelijavuodet_hylatyt]
	,loadtime
)

SELECT  
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_osa_aikaisuus_id]
	,[d_erityisopetus_id]
	,[d_majoitus_id]
	,[d_kytkin_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_kytkin_henkilostokoulutus_id]
	,[d_kytkin_tyovoimakoulutus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[opiskelijavuodet_painottamaton]
	,[opiskelijavuodet_painotettu_pt] 
	,[opiskelijavuodet_painotettu_at_eat]
	,[opiskelijavuodet_painotettu_valma_telma]
	,[opiskelijavuodet_painotettu_opisk_valm_tukevat] 
	,[opiskelijavuodet_painotettu_muu] 
	,[opiskelijavuodet_painotettu_erityistuki] 
	,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_henkilostokoulutus] 
	,[opiskelijavuodet_painotettu_tyovoimakoulutus]
	,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_hylatyt]
	,GETDATE()

FROM (

	SELECT [tilastovuosi] = [vuosi]
		  ,[d_kalenteri_id]
		  ,[d_sukupuoli_id]
		  ,[d_kieli_aidinkieli_id]
		  ,[d_ika_id]
		  ,[d_osa_aikaisuus_id]
		  ,[d_erityisopetus_id]
		  ,[d_majoitus_id]
		  ,[d_kytkin_oppisopimuskoulutus_id]
		  ,[d_kytkin_vankilaopetus_id]
		  ,[d_kytkin_henkilostokoulutus_id]
		  ,[d_kytkin_tyovoimakoulutus_id]
		  ,[d_koulutusluokitus_id]
		  ,[d_organisaatioluokitus_oppilaitos_id]
		  ,[d_organisaatioluokitus_jarj_id]
		  ,[d_organisaatioluokitus_toimipiste_id]
		  ,[d_kustannusryhma_id]
		  ,[d_suorituksen_tyyppi_id]
		  ,[d_opintojenrahoitus_id]
		  ,[d_osaamisala_id]
		  ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		  ,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		  ,[opiskelijavuodet_painotettu_pt] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_at_eat] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_valma_telma] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='ot' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_muu] = 0
			

		  ,[opiskelijavuodet_painotettu_erityistuki] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_majoitus] =
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_25' and f.vuosi+2 = varainhoitovuosi) * 
				(
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
					( 
						  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				+
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
					( 
						  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='kr_8' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and f.vuosi+2 = varainhoitovuosi) * 
				(
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
					( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
				)
		  ,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and f.vuosi+2 = varainhoitovuosi) * (case when d3.kytkin_koodi = '1' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_hylatyt]

	  FROM [ANTERO].[dw].[f_koski_amm_opiskelijavuodet] f
	  left join ANTERO.dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join ANTERO.dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	  left join ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	  left join ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	  left join ANTERO.dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join ANTERO.dw.d_majoitus d7 on d7.id = f.d_majoitus_id

) q


UNION ALL


SELECT  
	 [tilastovuosi]
	,[d_kalenteri_id] = '-1'
	,[d_sukupuoli_id] = '-1'
	,[d_kieli_aidinkieli_id] = '-1'
	,[d_ika_id] = '-1'
	,[d_osa_aikaisuus_id] = '-1'
	,[d_erityisopetus_id] = '-1'
	,[d_majoitus_id] = '-1'
	,[d_kytkin_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_kytkin_henkilostokoulutus_id]
	,[d_kytkin_tyovoimakoulutus_id]
	,[d_koulutusluokitus_id] = '-1'
	,[d_organisaatioluokitus_oppilaitos_id] = '-1'
	,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_toimipiste_id] = '-1'
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id] = '-1'
	,[d_opintojenrahoitus_id]
	,[d_osaamisala_id] = '-1'
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste] = '9'
	,[opiskelijavuodet_painottamaton] = [opiskelijavuodet_painottamaton]
	,[opiskelijavuodet_painotettu_pt] = 0 
	,[opiskelijavuodet_painotettu_at_eat] = 0
	,[opiskelijavuodet_painotettu_valma_telma] = 0
	,[opiskelijavuodet_painotettu_opisk_valm_tukevat]  = 0
	,[opiskelijavuodet_painotettu_muu] = [opiskelijavuodet_painotettu]
	,[opiskelijavuodet_painotettu_erityistuki] = 0
	,[opiskelijavuodet_painotettu_majoitus] = 0
	,[opiskelijavuodet_painotettu_henkilostokoulutus] = 0
	,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 0
	,[opiskelijavuodet_painotettu_vankilaopetus] = 0
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu]
	,[opiskelijavuodet_hylatyt] = 0
	,GETDATE()
FROM [sa].[v_amos_muut_tutkinnot] 

