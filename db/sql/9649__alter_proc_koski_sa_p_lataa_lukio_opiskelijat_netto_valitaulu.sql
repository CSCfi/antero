USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu]    Script Date: 23.2.2024 8:36:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* 
KAKSI SILMUKKAA: TOINEN KUUKAUSI KERRALLAAN, TOINEN PÄIVÄ KERRALLAAN KAUDEN ALUSTA LOPPUUN.
KAKSI TEMP-TAULUA: EKAAN HAETAAN KUUKAUDEN AIKANA OPISKELLEIDEN PERUSJOUKKO. TOISEEN KIRJOITETAAN PÄIVÄKOHTAISET TIEDOT.
*/

ALTER PROCEDURE [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu] AS

DECLARE @pvm_alku as date
DECLARE @pvm_loppu as date
DECLARE @pvm_pv as date
DECLARE @pvm_vika as date
DECLARE @vali as int

SET @pvm_vika = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) --edellisen kuukauden vika päivä
SET @pvm_alku = '2018-01-01'
SET @pvm_loppu = EOMONTH(@pvm_alku)


DROP TABLE IF EXISTS [dbo].[lukio_opiskelijat_netto_valitaulu]
DROP TABLE IF EXISTS #taulu1
DROP TABLE IF EXISTS #taulu2

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
	,oppivelvollinen int
)

-- alku- ja loppupäivämääristä riippumattomat tiedot temp-tauluun

DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskeluoikeudet

SELECT * INTO Koski_SA.sa.temp_lukio_opiskeluoikeudet FROM (
	SELECT
		oo.oppija_oid,
		CASE WHEN ooa.alku >= ps.alku THEN ooa.alku ELSE ps.alku END as alku,
		ooa.loppu,
		ooa.tila,
		majoitus =
			CASE					
				WHEN ooa.majoitus = 1 THEN 2
				WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
				WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
				ELSE 1
			END,
		ps.tavoitetutkinto,
		ps.oppimaara,
		ps.koulutus,
		ps.jarj_koulutus,
		ps.jarj_tavoitetutkinto,
		ps.suorituskieli_koodiarvo,
		ps.toimipiste_oid,
		oo.oppilaitos_oid,
		oo.koulutustoimija_oid,
		ov.alkuPvm as ov_alku,
		ov.loppuPvm as ov_loppu,
		h.sukupuoli,
		h.aidinkieli,
		h.syntymaaika,
		LEFT(h.kansalaisuus, 3) as kansalaisuus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	JOIN sa.sa_lukio_paatason_suoritus ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ps.rnk = 1
	JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	LEFT JOIN sa.sa_oppivelvolliset ov on ov.oppija_oid = oo.oppija_oid
	WHERE ooa.tila in ('lasna','loma') and oo.sisaltyy_opiskeluoikeuteen_oid IS NULL and ooa.loppu >= ps.alku
) f


WHILE @pvm_alku < @pvm_vika 

BEGIN

	SELECT 
		loo.oppija_oid
		,loo.alku
		,loo.loppu
		,loo.tila
		,loo.sukupuoli
		,loo.aidinkieli
		,ika = YEAR(@pvm_alku) - YEAR(loo.syntymaaika) 
		,loo.kansalaisuus
		,loo.majoitus
		,loo.tavoitetutkinto
		,loo.oppimaara
		,loo.koulutus
		,loo.jarj_koulutus
		,loo.jarj_tavoitetutkinto
		,loo.suorituskieli_koodiarvo
		,loo.toimipiste_oid
		,loo.oppilaitos_oid
		,loo.koulutustoimija_oid
		,case when loo.ov_alku <= @pvm_alku and loo.ov_loppu > @pvm_alku then 1 else 0 end as oppivelvollinen
	
	INTO #taulu1

	FROM sa.temp_lukio_opiskeluoikeudet loo
	WHERE loo.alku <= @pvm_loppu AND loo.loppu >= @pvm_alku 


	SET @pvm_pv = @pvm_alku

	--kuukauden ekasta päivästä viimeiseen 
	WHILE @pvm_pv <= @pvm_loppu

	BEGIN
		
		INSERT INTO #taulu2

		SELECT DISTINCT
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
			,oppivelvollinen
		FROM #taulu1 t
		WHERE @pvm_pv between alku and loppu 
		AND NOT EXISTS (
			SELECT * FROM sa.tuva_lasna_loma_jaksot tuvat 
			WHERE t.koulutus != 'Tutkintokoulutukseen valmentava koulutus'
			AND tuvat.oppija_oid = t.oppija_oid
			AND @pvm_pv between tuvat.alku and tuvat.loppu
		)

		SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

	END

	DROP TABLE #taulu1

	SET @pvm_alku = DATEADD(MONTH, 1, @pvm_alku)
	SET @pvm_loppu = CASE WHEN @pvm_vika < EOMONTH(dateadd(month, 1, @pvm_alku)) THEN @pvm_vika ELSE EOMONTH(dateadd(month, 1, @pvm_alku)) END

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
	,oppivelvollinen
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
	,oppivelvollinen
ORDER BY vuosi,kuukausi,ka DESC

DROP TABLE IF EXISTS Koski_SA.sa.temp_lukio_opiskeluoikeudet
DROP TABLE #taulu2

GO

USE [ANTERO]