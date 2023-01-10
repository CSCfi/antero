USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto]    Script Date: 10.1.2023 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto] AS

/*
	Osaamisen hankkimiseen käytettyjen päivien laskenta hankkimistavan ja työnantajan mukaan neljänneksittäin opiskeluoikeuden keston perusteella
*/

DECLARE @alku as date, @loppu as date, @pvm as date
SET @alku = '2018-01-01'

DROP TABLE IF EXISTS #pvm_taulu
DROP TABLE IF EXISTS #jaksot
DROP TABLE IF EXISTS #neljannekset
DROP TABLE IF EXISTS #yhdistetty
DROP TABLE IF EXISTS #temp_ehoks_netto

CREATE TABLE #pvm_taulu (pv date)


SET NOCOUNT ON

WHILE @alku < GETDATE()
BEGIN

	--Kaksi uusinta vuotta tai jos vuoden tiedot puuttuvat kohdetaulusta
	IF NOT EXISTS (SELECT TOP 1 1 FROM sa.sa_ehoks_osaamisen_hankkimisjaksot_netto WHERE vuosi = year(@alku)) OR year(@alku) >= year(getdate())-1
	BEGIN
		SET @loppu = DATEADD(yy, 1, @alku)

		--pvm:t tauluun
		SET @pvm = @alku
		TRUNCATE TABLE #pvm_taulu

		WHILE @pvm < (case when @loppu > GETDATE() then GETDATE() else @loppu end)
		BEGIN 
			INSERT INTO #pvm_taulu VALUES (@pvm)
			SET @pvm = DATEADD(dd, 1, @pvm)
		END
		--
		--PRINT ('1: ' + cast(year(@alku) as char(4))+ ': ' + CONVERT( VARCHAR(24), GETDATE(), 121))
		--Osaamisen hankkimisen jaksot
		SELECT 
			ehoks_id
			,h.opiskeluoikeus_oid
			,ca1.alkamispaiva
			,ca1.paattymispaiva
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus = left(ltrim(replace(tyopaikan_ytunnus,char(160),'')),9)
			,ca2.alku
			,ca2.loppu
		INTO #jaksot
		FROM [ANTERO].[sa].[sa_ehoks_hato] h
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=h.opiskeluoikeus_oid
		LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
		OUTER APPLY (
			SELECT 
				alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
				,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva, getdate())
		) ca1
		OUTER APPLY (
			SELECT 
				alku = case when h.alku < ca1.alkamispaiva then ca1.alkamispaiva else h.alku end
				,loppu = case when coalesce(h.loppu,'9999-12-31') > ca1.paattymispaiva then ca1.paattymispaiva else h.loppu end
		) ca2
		WHERE 1=1
		and osaamisen_hankkimistapa_koodi is not null
		and ca2.alku is not null and ca2.loppu is not null
		and ca2.alku <= ca2.loppu
		and ca2.alku < @loppu and ca2.loppu >= @alku
		and ps.rnk=1
	
		--PRINT ('2: ' + cast(year(@alku) as char(4)) + ': ' + CONVERT( VARCHAR(24), GETDATE(), 121))
		--Opiskeluoikeuksien jako neljänneksiin
		SELECT
			opiskeluoikeus_oid
			,neljannes = left(pvm, 1)
			,neljannes_paivat
			,alku = jakso
			,loppu = jakso2
		INTO #neljannekset
		FROM (
			SELECT distinct
				opiskeluoikeus_oid
				,alkamispaiva
				,paattymispaiva
				,neljannes_paivat
				,[1_alku] = alkamispaiva
				,[1_loppu] = dateadd(day,neljannes_paivat-1,alkamispaiva)
				,[2_alku] = dateadd(day,neljannes_paivat,alkamispaiva)
				,[2_loppu] = dateadd(day,neljannes_paivat*2-1,alkamispaiva)
				,[3_alku] = dateadd(day,neljannes_paivat*2,alkamispaiva)
				,[3_loppu] = dateadd(day,neljannes_paivat*3-1,alkamispaiva)
				,[4_alku] = dateadd(day,neljannes_paivat*3,alkamispaiva)
				,[4_loppu] = paattymispaiva
			FROM #jaksot
			OUTER APPLY (SELECT neljannes_paivat = (datediff(day, alkamispaiva, paattymispaiva) + 1) / 4.0) ca
		) q
		UNPIVOT (
			jakso for pvm in ([1_alku],[2_alku],[3_alku],[4_alku])
		) unpvt
		UNPIVOT (
			jakso2 for pvm2 in ([1_loppu],[2_loppu],[3_loppu],[4_loppu])
		) unpvt
		WHERE left(unpvt.pvm, 1) = left(unpvt.pvm2, 1)	
	
		---PRINT ('3: ' + cast(year(@alku) as char(4)) + ': ' + CONVERT( VARCHAR(24), GETDATE(), 121))
		--Taulujen yhdistäminen
		SELECT 
			pv
			,ehoks_id
			,oo.opiskeluoikeus_oid
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus
			,nel.neljannes
			,nel.neljannes_paivat
			,paallekkaiset = count(*) over (partition by ehoks_id,pv)
		INTO #yhdistetty
		FROM #jaksot oo
		INNER JOIN #pvm_taulu p ON p.pv between oo.alku and oo.loppu
		INNER JOIN #neljannekset nel on nel.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and p.pv between nel.alku and nel.loppu
		WHERE 1=1	

		--PRINT ('4: ' +cast(year(@alku) as char(4)) + ': ' + CONVERT( VARCHAR(24), GETDATE(), 121))
		--Päivien summaus
		SELECT 
			 vuosi = year(@alku)
			,ehoks_id
			,opiskeluoikeus_oid
			,neljannes
			,neljannes_paivat
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus
			,paivat = sum(1.0/paallekkaiset)
		INTO #temp_ehoks_netto
		FROM #yhdistetty
		GROUP BY 
			 neljannes
			,neljannes_paivat
			,ehoks_id
			,opiskeluoikeus_oid
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus

		--
		DELETE FROM sa.sa_ehoks_osaamisen_hankkimisjaksot_netto WHERE vuosi = year(@alku)
		INSERT INTO sa.sa_ehoks_osaamisen_hankkimisjaksot_netto (vuosi,ehoks_id,opiskeluoikeus_oid,neljannes,neljannes_paivat,osaamisen_hankkimistapa_koodi,tyopaikan_ytunnus,paivat) 
		SELECT vuosi,ehoks_id,opiskeluoikeus_oid,neljannes,neljannes_paivat,osaamisen_hankkimistapa_koodi,tyopaikan_ytunnus,paivat FROM #temp_ehoks_netto
		--
		DROP TABLE #jaksot
		DROP TABLE #neljannekset
		DROP TABLE #yhdistetty
		DROP TABLE #temp_ehoks_netto
		--

	END
	
	SET @alku =  DATEADD(yy, 1, @alku)


END

DROP TABLE #pvm_taulu