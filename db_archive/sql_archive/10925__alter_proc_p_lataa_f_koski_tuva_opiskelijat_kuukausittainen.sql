USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 30.7.2025 8.06.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_koski_tuva_opiskelijat_kuukausittainen]
AS

DECLARE @alkuPvm as date, @loppuPvm as date

SET @alkuPvm = '2022-08-01'

SET @loppuPvm = EOMONTH(@alkuPvm)

DROP TABLE IF EXISTS Koski_SA.sa.sa_temp_tuva_opiskeluoikeus

SELECT DISTINCT
	oo.opiskeluoikeus_oid, 
	oo.master_oid,
	oo.alkamispaiva,
	ooa.alku,
	ooa.loppu,
	oo.koulutustoimija_oid,
	oo.oppilaitos_oid,
	ooa.majoitus,
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
	end as erityisopetus,
	ps.suorituskieli_koodiarvo,
	ps.toimipiste_oid,
	oo.koulutusmuoto,
	oo.tuva_jarjestamislupa
INTO Koski_SA.sa.sa_temp_tuva_opiskeluoikeus
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo 
INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND ooa.tila IN ('lasna','loma')
LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
WHERE koulutusmuoto = 'tuva'

TRUNCATE TABLE ANTERO.dw.f_koski_tuva_opiskelijat_kuukausittainen

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)

BEGIN

	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_koski_tuva_opiskelijat_kuukausittainen
	SELECT
		f.tilastovuosi
		,f.d_kalenteri_id
		,f.d_kalenteri_oo_id
		,f.d_ika_id
		,f.d_kansalaisuus_id
		,f.d_aidinkieli_id
		,f.d_sukupuoli_id
		,f.master_oid
		,f.opiskeluoikeus_oid
		,f.d_koski_koulutusmuoto_muut_opiskeluoikeudet_id
		,f.koulutusmuoto
		,f.tuva_jarjestamislupa
		,f.erityisopetus
		,f.d_kytkin_majoitus_id
		,f.d_suorituskieli_id
		,f.d_koulutuksen_jarjestaja_id
		,f.d_oppilaitos_id
		,f.d_toimipiste_id
		,f.d_alueluokitus_id
		,f.oo_alkamisajankohta 
		,f.oo_alkanut_kuussa_1_0
		,f.tila_20_9
		,f.oppivelvollinen 
	FROM (	
		SELECT DISTINCT
			YEAR(@alkuPvm) AS tilastovuosi
			,COALESCE(d1.id,-1) AS d_kalenteri_id
			,COALESCE(d1b.id,-1) AS d_kalenteri_oo_id
			,COALESCE(d2.id,-1) AS d_ika_id
			,COALESCE(d3.id,-1) AS d_kansalaisuus_id
			,COALESCE(d4.id,-1) AS d_aidinkieli_id
			,COALESCE(d5.id,-1) AS d_sukupuoli_id
			,oo.[master_oid]
			,oo.[opiskeluoikeus_oid]
			,COALESCE(d13.id, -2) as d_koski_koulutusmuoto_muut_opiskeluoikeudet_id
			,muut_opiskeluoikeudet_rnk = max(case when ooa2.opiskeluoikeus_oid is null THEN 0 else 1 end) over (partition by oo.master_oid)
			,muut_opiskeluoikeudet = case when ooa2.opiskeluoikeus_oid is null THEN 0 else 1 end
			,oo.[koulutusmuoto]
			,oo.[tuva_jarjestamislupa]
			,oo.erityisopetus 
		
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
			-- 20.9. tiedot haetaan alempana
			,0 as tila_20_9
			,oppivelvollinen = 
				case
					when ov.master_oid is not null THEN 1
					else 0
				end
		FROM Koski_SA.sa.sa_temp_tuva_opiskeluoikeus oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo_master] AS h ON oo.master_oid = h.master_oid
		LEFT JOIN ANTERO.dw.d_kalenteri AS d1 ON @alkuPvm = d1.kalenteri_avain
		LEFT JOIN ANTERO.dw.d_kalenteri AS d1b ON d1b.kalenteri_avain = oo.alkamispaiva	--UUSI
		LEFT JOIN ANTERO.dw.d_ika AS d2 ON YEAR(@alkuPvm)-YEAR(h.syntymaaika) = d2.ika_avain
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d3 ON d3.maatjavaltiot2_koodi = CASE WHEN h.kansalaisuus like '%246%' THEN 246 ELSE LEFT(kansalaisuus,3) END
		LEFT JOIN ANTERO.dw.d_kieli AS d4 ON h.aidinkieli = d4.kieli_koodi
		LEFT JOIN ANTERO.dw.d_sukupuoli AS d5 ON h.sukupuoli = d5.sukupuoli_koodi
		LEFT JOIN ANTERO.dw.d_kytkin AS d6 ON oo.majoitus = d6.kytkin_koodi
		LEFT JOIN ANTERO.dw.d_kieli AS d7 ON oo.suorituskieli_koodiarvo = d7.kieli_koodi
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON oo.koulutustoimija_oid = d8.organisaatio_oid
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON oo.oppilaitos_oid = d9.organisaatio_oid
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d10 ON oo.toimipiste_oid = d10.organisaatio_oid
		LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d9.kunta_koodi = d11.kunta_koodi
		LEFT JOIN ANTERO.dw.d_alueluokitus d12 ON h.kotikunta = d12.kunta_koodi
		LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.master_oid = oo.master_oid and @alkuPvm BETWEEN ov.alkuPvm and ov.loppuPvm
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] AS oo2 on oo2.master_oid = oo.master_oid and oo2.koulutusmuoto not in ('tuva', 'perusopetuksenlisaopetus') and oo2.sisaltyy_opiskeluoikeuteen_oid is null 
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] AS ooa2 ON oo2.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid AND ooa2.tila IN ('lasna','loma')
		and ooa2.alku <= @loppuPvm and ooa2.loppu >= @alkuPvm and ooa2.alku <= oo.loppu and ooa2.loppu >= oo.alku
		LEFT JOIN ANTERO.dw.d_koski_koulutusmuoto d13 on d13.koodi = case when ooa2.opiskeluoikeus_oid is not null then oo2.koulutusmuoto else null end
		WHERE oo.alku <= @loppuPvm and oo.loppu >= @alkuPvm
	) f
	WHERE f.muut_opiskeluoikeudet = f.muut_opiskeluoikeudet_rnk

	-- 20.9. tiedot omille riveille

	IF MONTH(@alkuPvm) = 9 
	
	BEGIN
		
		INSERT INTO ANTERO.dw.f_koski_tuva_opiskelijat_kuukausittainen
		SELECT
			f.tilastovuosi
			,f.d_kalenteri_id
			,f.d_kalenteri_oo_id
			,f.d_ika_id
			,f.d_kansalaisuus_id
			,f.d_aidinkieli_id
			,f.d_sukupuoli_id
			,f.master_oid
			,f.opiskeluoikeus_oid
			,f.d_koski_koulutusmuoto_muut_opiskeluoikeudet_id
			,f.koulutusmuoto
			,f.tuva_jarjestamislupa
			,f.erityisopetus
			,f.d_kytkin_majoitus_id
			,f.d_suorituskieli_id
			,f.d_koulutuksen_jarjestaja_id
			,f.d_oppilaitos_id
			,f.d_toimipiste_id
			,f.d_alueluokitus_id
			,f.oo_alkamisajankohta 
			,f.oo_alkanut_kuussa_1_0
			,f.tila_20_9
			,f.oppivelvollinen 
		FROM (
			SELECT DISTINCT
				YEAR(@alkuPvm) AS tilastovuosi
				,COALESCE(d1.id,-1) AS d_kalenteri_id
				,COALESCE(d1b.id,-1) AS d_kalenteri_oo_id
				,COALESCE(d2.id,-1) AS d_ika_id
				,COALESCE(d3.id,-1) AS d_kansalaisuus_id
				,COALESCE(d4.id,-1) AS d_aidinkieli_id
				,COALESCE(d5.id,-1) AS d_sukupuoli_id
				,oo.[master_oid]
				,oo.[opiskeluoikeus_oid]
				,COALESCE(d13.id, '-2') as d_koski_koulutusmuoto_muut_opiskeluoikeudet_id
				,muut_opiskeluoikeudet_rnk = max(case when ooa2.opiskeluoikeus_oid is null THEN 0 else 1 end) over (partition by oo.master_oid)
				,muut_opiskeluoikeudet = case when ooa2.opiskeluoikeus_oid is null THEN 0 else 1 end
				,oo.[koulutusmuoto]
				,oo.[tuva_jarjestamislupa]
				,oo.erityisopetus
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

				,1 as tila_20_9
				,oppivelvollinen = 
					case
						when ov.master_oid is not null THEN 1
						else 0
					end
			FROM Koski_SA.sa.sa_temp_tuva_opiskeluoikeus oo
			LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo_master] AS h ON oo.master_oid = h.master_oid
			LEFT JOIN ANTERO.dw.d_kalenteri AS d1 ON @alkuPvm = d1.kalenteri_avain
			LEFT JOIN ANTERO.dw.d_kalenteri AS d1b ON d1b.kalenteri_avain = oo.alkamispaiva	--UUSI
			LEFT JOIN ANTERO.dw.d_ika AS d2 ON YEAR(@alkuPvm)-YEAR(h.syntymaaika) = d2.ika_avain
			LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d3 ON d3.maatjavaltiot2_koodi = CASE WHEN h.kansalaisuus like '%246%' THEN 246 ELSE LEFT(kansalaisuus,3) END
			LEFT JOIN ANTERO.dw.d_kieli AS d4 ON h.aidinkieli = d4.kieli_koodi
			LEFT JOIN ANTERO.dw.d_sukupuoli AS d5 ON h.sukupuoli = d5.sukupuoli_koodi
			LEFT JOIN ANTERO.dw.d_kytkin AS d6 ON oo.majoitus = d6.kytkin_koodi
			LEFT JOIN ANTERO.dw.d_kieli AS d7 ON oo.suorituskieli_koodiarvo = d7.kieli_koodi
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON oo.koulutustoimija_oid = d8.organisaatio_oid
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON oo.oppilaitos_oid = d9.organisaatio_oid
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d10 ON oo.toimipiste_oid = d10.organisaatio_oid
			LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d9.kunta_koodi = d11.kunta_koodi
			LEFT JOIN ANTERO.dw.d_alueluokitus d12 ON h.kotikunta = d12.kunta_koodi
			LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.master_oid = oo.master_oid and @alkuPvm BETWEEN ov.alkuPvm and ov.loppuPvm
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] AS oo2 on oo2.master_oid = oo.master_oid and oo2.koulutusmuoto not in ('tuva', 'perusopetuksenlisaopetus') and oo2.sisaltyy_opiskeluoikeuteen_oid is null 
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] AS ooa2 ON oo2.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid AND ooa2.tila IN ('lasna','loma')
			and DATEFROMPARTS(YEAR(@alkuPvm), 9, 20) BETWEEN ooa2.alku AND ooa2.loppu
			LEFT JOIN ANTERO.dw.d_koski_koulutusmuoto d13 on d13.koodi = case when ooa2.opiskeluoikeus_oid is not null then oo2.koulutusmuoto else null end
			WHERE DATEFROMPARTS(YEAR(@alkuPvm), MONTH(@alkuPvm), 20) BETWEEN oo.alku AND oo.loppu
		) f
		WHERE f.muut_opiskeluoikeudet = f.muut_opiskeluoikeudet_rnk

	END
	
	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)

END

DROP TABLE IF EXISTS Koski_SA.sa.sa_temp_tuva_opiskeluoikeus


GO


