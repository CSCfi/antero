USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu]    Script Date: 3.9.2022 1:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* 
KAKSI SILMUKKAA: TOINEN KAUSI KERRALLAAN, TOINEN PÄIVÄ KERRALLAAN KAUDEN ALUSTA LOPPUUN.
KAKSI TEMP-TAULUA: EKAAN HAETAAN LUKUKAUDEN AIKANA OPISKELLEIDEN PERUSJOUKKO. TOISEEN KIRJOITETAAN PÄIVÄKOHTAISET TIEDOT.
*/

ALTER PROCEDURE [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu] AS

DECLARE @pvm_alku as date
DECLARE @pvm_loppu as date
DECLARE @pvm_pv as date
DECLARE @pvm_vika as date
DECLARE @vali as int

SET @pvm_vika = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) --edellisen kuukauden vika päivä
SET @vali = 6
SET @pvm_alku = '2018-01-01'
SET @pvm_loppu = EOMONTH(dateadd(month, @vali-1, @pvm_alku))

DROP TABLE IF EXISTS [dbo].[lukio_opiskelijat_netto_valitaulu] 

--EXEC [sa].[p_lataa_amm_paatason_suoritus]

--TRUNCATE TABLE [dbo].[amm_opiskelijat_lukio_valitaulu]

CREATE TABLE #taulu2 (
	vuosi int
	,kuukausi int
	,paiva int
	,sukupuoli varchar(1)
	,aidinkieli varchar(2)
	,ika varchar(3)
	,kansalaisuus varchar(25)
	,majoitus int
	,tavoitetutkinto varchar(100)
	,oppimaara varchar(100)
	,koulutus varchar(100)
	,jarj_koulutus int
	,jarj_tavoitetutkinto int
	,suorituskieli_koodiarvo char(2)
	,toimipiste_oid varchar(100)
	,oppilaitos_oid varchar(100)
	,koulutustoimija_oid varchar(100)
	,oppija_oid varchar(100)
)


WHILE @pvm_alku < @pvm_vika 

BEGIN

	SELECT 
		oo.oppija_oid
		,ooa.alku
		,ooa.loppu
		,ooa.tila
		,sukupuoli = h.sukupuoli
		,aidinkieli = h.aidinkieli
		,ika = YEAR(@pvm_alku) - YEAR(h.syntymaaika) 
		,kansalaisuus = LEFT(kansalaisuus, 3)
		,majoitus =
			CASE					
				WHEN ooa.majoitus = 1 THEN 2
				WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
				WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
				ELSE 1
			END
		,ps.tavoitetutkinto
		,ps.oppimaara
		,ps.koulutus
		,ps.jarj_koulutus
		,ps.jarj_tavoitetutkinto
		,ps.suorituskieli_koodiarvo
		,ps.toimipiste_oid
		,oo.oppilaitos_oid
		,oo.koulutustoimija_oid
	
	INTO #taulu1

	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	JOIN sa.sa_lukio_paatason_suoritus ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ps.rnk = 1

	WHERE ooa.tila in ('lasna','loma')
	AND ooa.alku <= @pvm_loppu AND ooa.loppu >= @pvm_alku
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL


	SET @pvm_pv = @pvm_alku

	--jakson ekasta päivästä viimeiseen 
	WHILE @pvm_pv <= @pvm_loppu

	BEGIN
		
		INSERT INTO #taulu2

		SELECT distinct
			 vuosi = YEAR(@pvm_pv)
			,kuukausi = MONTH(@pvm_pv)
			,paiva = DAY(@pvm_pv)
			,sukupuoli
			,aidinkieli
			,ika
			,kansalaisuus
			,majoitus
			,tavoitetutkinto
			,oppimaara
			,koulutus
			,jarj_tavoitetutkinto
			,jarj_koulutus
			,suorituskieli_koodiarvo
			,toimipiste_oid
			,oppilaitos_oid
			,koulutustoimija_oid
			,oppija_oid
		FROM #taulu1 t
		WHERE @pvm_pv between alku and loppu 

		SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

	END

	DROP TABLE #taulu1

	SET @pvm_alku = DATEADD(MONTH, @vali, @pvm_alku)
	SET @pvm_loppu = CASE WHEN @pvm_vika < EOMONTH(dateadd(month, @vali, @pvm_loppu)) THEN @pvm_vika ELSE EOMONTH(dateadd(month, @vali, @pvm_loppu)) END

END


--tiedot välitauluun
SELECT 
	vuosi 
	,kuukausi 
	,sukupuoli
	,aidinkieli
	,ika
	,kansalaisuus
	,majoitus
	,tavoitetutkinto
	,oppimaara
	,koulutus
	,jarj_tavoitetutkinto
	,jarj_koulutus
	,suorituskieli_koodiarvo
	,toimipiste_oid
	,oppilaitos_oid
	,koulutustoimija_oid
	,ka = count(oppija_oid) / (day(eomonth(datefromparts(vuosi, kuukausi, 1))) * 1.0)
INTO [dbo].[lukio_opiskelijat_netto_valitaulu] 
FROM #taulu2 t
GROUP BY 
	vuosi
	,kuukausi
	,sukupuoli
	,aidinkieli
	,ika
	,kansalaisuus
	,majoitus
	,tavoitetutkinto
	,oppimaara
	,koulutus
	,jarj_tavoitetutkinto
	,jarj_koulutus
	,suorituskieli_koodiarvo
	,toimipiste_oid
	,oppilaitos_oid
	,koulutustoimija_oid

ORDER BY vuosi,kuukausi,ka DESC

DROP TABLE #taulu2
