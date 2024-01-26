USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 25.7.2023 10:49:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_tuva_opiskelijat_kuukausittainen]
AS

DECLARE @alkuPvm as date, @loppuPvm as date

SET @alkuPvm = '2022-08-01'

SET @loppuPvm = EOMONTH(@alkuPvm)

TRUNCATE TABLE ANTERO.dw.f_koski_tuva_opiskelijat_kuukausittainen

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)

BEGIN

	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_koski_tuva_opiskelijat_kuukausittainen

	SELECT DISTINCT
	  YEAR(@alkuPvm) AS tilastovuosi
	  ,COALESCE(d1.id,-1) AS d_kalenteri_id
	  ,COALESCE(d1b.id,-1) AS d_kalenteri_oo_id
	  ,COALESCE(d2.id,-1) AS d_ika_id
	  ,COALESCE(d3.id,-1) AS d_kansalaisuus_id
	  ,COALESCE(d4.id,-1) AS d_aidinkieli_id
	  ,COALESCE(d5.id,-1) AS d_sukupuoli_id
      ,oo.[oppija_oid]
	  ,oo.[opiskeluoikeus_oid]
      ,[koulutusmuoto]
      ,[tuva_jarjestamislupa]
		,erityisopetus = 
		case				
			when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') then 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
			when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') then 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
			when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
			when ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
			when ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
			when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
			when ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
			when ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
			when ooa.erityinen_tuki = 0 then 1 --Ei erityisopiskelija
			else -1
		end
		,COALESCE(d6.id,-1) AS d_kytkin_majoitus_id
		,COALESCE(d7.id,-1) AS d_suorituskieli_id
		,COALESCE(d8.id,-1) AS d_koulutuksen_jarjestaja_id
		,COALESCE(d9.id,-1) AS d_oppilaitos_id
		,COALESCE(d10.id,-1) AS d_toimipiste_id
		,COALESCE(d11.id,-1) AS d_alueluokitus_id
		,oo_alkamisajankohta = coalesce(cast(d1b.vuosi as varchar) + '/' + right('0' + cast(d1b.kuukausi as varchar), 2), '-1')
		,oo_alkanut_kuussa_1_0 =
		case
			when year(oo.alkamispaiva) = year(@alkuPvm) and month(oo.alkamispaiva) = month(@alkuPvm) then 1
			when year(oo.alkamispaiva) != year(@alkuPvm) or month(oo.alkamispaiva) != month(@alkuPvm) then 0
		end
		,case when MONTH(@alkuPvm) = 9 AND DATEFROMPARTS(YEAR(@alkuPvm),9,20) BETWEEN alku AND loppu AND tila IN ('lasna','loma') then 1 else 0 end as tila_20_9
		,oppivelvollinen_kk = 
		case
			when ((d12.maakunta_koodi NOT IN ('21', '-1', '98') AND d12.maakunta_koodi IS NOT NULL) AND --Kotikunta Manner-Suomessa
				(oovap.vapautettu IS NULL OR (oovap.vapautettu > DATEFROMPARTS(YEAR(@alkuPvm), MONTH(@alkuPvm), 1) AND oovap.mitatoity = '9999-01-01')) AND --Ei vapautusta oppivelvollisuudesta
				((YEAR(@alkuPvm)-YEAR(h.syntymaaika) > 7 AND FLOOR(DATEDIFF(DAY, h.syntymaaika, DATEFROMPARTS(YEAR(@alkuPvm), MONTH(@alkuPvm), 1)) / 365.25) < 18) OR --Henkilö täyttää yli 7-vuotta, mutta on alle 18-vuotias
				(YEAR(@alkuPvm)-YEAR(h.syntymaaika) = 7 AND DATEFROMPARTS(YEAR(@alkuPvm), MONTH(@alkuPvm), 1) >= DATEFROMPARTS(YEAR(@alkuPvm), 8, 1))) AND --Henkilö täyttää 7 vuotta ja opintovelvollisuus alkaa kyseisen vuoden elokuun alusta
				(spvm.tutkinto_suoritettu > DATEFROMPARTS(YEAR(@alkuPvm), MONTH(@alkuPvm), 1) OR spvm.tutkinto_suoritettu IS NULL)) then 1 --Henkilö ei ole suorittanut ylioppilastutkintoa tai ammatillista tutkintoa
			else 0
		end
		,oppivelvollinen_20_9 = 
		case
			when ((d12.maakunta_koodi NOT IN ('21', '-1', '98') AND d12.maakunta_koodi IS NOT NULL) AND --Kotikunta Manner-Suomessa
				(oovap.vapautettu IS NULL OR (oovap.vapautettu > DATEFROMPARTS(YEAR(@alkuPvm), 9, 20) AND oovap.mitatoity = '9999-01-01')) AND --Ei vapautusta oppivelvollisuudesta
				((YEAR(@alkuPvm)-YEAR(h.syntymaaika) > 7 AND FLOOR(DATEDIFF(DAY, h.syntymaaika, DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)) / 365.25) < 18) OR --Henkilö täyttää yli 7-vuotta, mutta on alle 18-vuotias
				(YEAR(@alkuPvm)-YEAR(h.syntymaaika) = 7 AND DATEFROMPARTS(YEAR(@alkuPvm), 9, 20) >= DATEFROMPARTS(YEAR(@alkuPvm), 8, 1))) AND --Henkilö täyttää 7 vuotta ja opintovelvollisuus alkaa kyseisen vuoden elokuun alusta
				(spvm.tutkinto_suoritettu > DATEFROMPARTS(YEAR(@alkuPvm), 9, 20) OR spvm.tutkinto_suoritettu IS NULL)) then 1 --Henkilö ei ole suorittanut ylioppilastutkintoa tai ammatillista tutkintoa
			else 0
		end
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] AS oo
	INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	AND ooa.alku <= @loppuPvm and ooa.loppu >= @alkuPvm AND ooa.tila IN ('lasna','loma')
	LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo] AS h ON oo.oppija_oid = h.oppija_oid
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN ANTERO.dw.d_kalenteri AS d1 ON @alkuPvm = d1.kalenteri_avain
	LEFT JOIN ANTERO.dw.d_kalenteri AS d1b ON d1b.kalenteri_avain = oo.alkamispaiva	--UUSI
	LEFT JOIN ANTERO.dw.d_ika AS d2 ON YEAR(@alkuPvm)-YEAR(h.syntymaaika) = d2.ika_avain
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d3 ON d3.maatjavaltiot2_koodi = CASE WHEN h.kansalaisuus like '%246%' THEN 246 ELSE LEFT(kansalaisuus,3) END
	LEFT JOIN ANTERO.dw.d_kieli AS d4 ON h.aidinkieli = d4.kieli_koodi
	LEFT JOIN ANTERO.dw.d_sukupuoli AS d5 ON h.sukupuoli = d5.sukupuoli_koodi
	LEFT JOIN ANTERO.dw.d_kytkin AS d6 ON ooa.majoitus = d6.kytkin_koodi
	LEFT JOIN ANTERO.dw.d_kieli AS d7 ON ps.suorituskieli_koodiarvo = d7.kieli_koodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON oo.koulutustoimija_oid = d8.organisaatio_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON oo.oppilaitos_oid = d9.organisaatio_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d10 ON ps.toimipiste_oid = d10.organisaatio_oid
	LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d9.kunta_koodi = d11.kunta_koodi
	LEFT JOIN ANTERO.dw.d_alueluokitus d12 ON h.kotikunta = d12.kunta_koodi
	LEFT JOIN Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut oovap ON oo.oppija_oid = oovap.oppija_oid
	LEFT JOIN (
		SELECT
		oo.oppija_oid,
		MIN(COALESCE(ooy.alku, ps.vahvistus_paiva)) as tutkinto_suoritettu
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.tila_koodiarvo = 'valmistunut'
		WHERE (oo.paattymispaiva is not null AND oo.viimeisin_tila = 'valmistunut' AND
			  ((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','ebtutkinto','diatutkintovaihe')))) OR
			  ooy.tila_koodiarvo = 'valmistunut'
		GROUP BY oo.oppija_oid
	) spvm on spvm.oppija_oid = oo.oppija_oid
	WHERE koulutusmuoto = 'tuva'
		
	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)

END


GO

USE [ANTERO]