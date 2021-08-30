USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot]    Script Date: 30.8.2021 8:36:03 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot]    Script Date: 30.8.2021 8:36:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot] AS



DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_opintojen_kulku_2d_taustatiedot

SELECT DISTINCT k1.oppija_oid
	,peruskoulu_keskiarvo = ka.keskiarvo
	,peruskoulu_keskiarvo_lukuaineet = ka.keskiarvo_lukuaineet
	--,peruskoulu_keskiarvo_kategoria =
	--	CASE 
	--		WHEN ka.keskiarvo IS NULL THEN 'Tieto puuttuu'
	--		WHEN ka.keskiarvo >= 9.5 THEN '9,5 - 10'
	--		WHEN ka.keskiarvo < 9.5 AND ka.keskiarvo >= 9.0 THEN '9,0 - 9,5'
	--		WHEN ka.keskiarvo < 9.0 AND ka.keskiarvo >= 8.5 THEN '8,5 - 9,0'
	--		WHEN ka.keskiarvo < 8.5 AND ka.keskiarvo >= 8.0 THEN '8,0 - 8,5'
	--		WHEN ka.keskiarvo < 8.0 AND ka.keskiarvo >= 7.5 THEN '7,5 - 8,0'
	--		WHEN ka.keskiarvo < 7.5 AND ka.keskiarvo >= 7.0 THEN '7,0 - 7,5'
	--		WHEN ka.keskiarvo < 7.0 AND ka.keskiarvo >= 6.5 THEN '6,5 - 7,0'
	--		WHEN ka.keskiarvo < 6.5 AND ka.keskiarvo >= 6.0 THEN '6,0 - 6,5'
	--		WHEN ka.keskiarvo < 6.0 AND ka.keskiarvo >= 5.5 THEN '5,5 - 6,0'
	--		WHEN ka.keskiarvo < 5.5 AND ka.keskiarvo >= 5.0 THEN '5,0 - 5,5'
	--		WHEN ka.keskiarvo < 5.0 AND ka.keskiarvo >= 4.5 THEN '4,5 - 5,0'
	--		WHEN ka.keskiarvo < 4.5 AND ka.keskiarvo >= 4.0 THEN '4,0 - 4,5'
	--		ELSE 'Tieto puuttuu'
	--		END
	,peruskoulu_keskiarvo_kategoria_koodi =
		CASE 
			WHEN ka.keskiarvo IS NULL THEN 99
			WHEN ka.keskiarvo >= 9.5 THEN 1
			WHEN ka.keskiarvo < 9.5 AND ka.keskiarvo >= 9.0 THEN 2
			WHEN ka.keskiarvo < 9.0 AND ka.keskiarvo >= 8.5 THEN 3
			WHEN ka.keskiarvo < 8.5 AND ka.keskiarvo >= 8.0 THEN 4
			WHEN ka.keskiarvo < 8.0 AND ka.keskiarvo >= 7.5 THEN 5
			WHEN ka.keskiarvo < 7.5 AND ka.keskiarvo >= 7.0 THEN 6
			WHEN ka.keskiarvo < 7.0 AND ka.keskiarvo >= 6.5 THEN 7
			WHEN ka.keskiarvo < 6.5 AND ka.keskiarvo >= 6.0 THEN 8
			WHEN ka.keskiarvo < 6.0 AND ka.keskiarvo >= 5.5 THEN 9
			WHEN ka.keskiarvo < 5.5 AND ka.keskiarvo >= 5.0 THEN 10
			WHEN ka.keskiarvo < 5.0 AND ka.keskiarvo >= 4.5 THEN 11
			WHEN ka.keskiarvo < 4.5 AND ka.keskiarvo >= 4.0 THEN 12
			ELSE 99
			END
	--,peruskoulu_keskiarvo_lukuaineet_kategoria =
	--	CASE 
	--		WHEN ka.keskiarvo_lukuaineet IS NULL THEN 'Tieto puuttuu'
	--		WHEN ka.keskiarvo_lukuaineet >= 9.5 THEN '9,5 - 10'
	--		WHEN ka.keskiarvo_lukuaineet < 9.5 AND ka.keskiarvo_lukuaineet >= 9.0 THEN '9,0 - 9,5'
	--		WHEN ka.keskiarvo_lukuaineet < 9.0 AND ka.keskiarvo_lukuaineet >= 8.5 THEN '8,5 - 9,0'
	--		WHEN ka.keskiarvo_lukuaineet < 8.5 AND ka.keskiarvo_lukuaineet >= 8.0 THEN '8,0 - 8,5'
	--		WHEN ka.keskiarvo_lukuaineet < 8.0 AND ka.keskiarvo_lukuaineet >= 7.5 THEN '7,5 - 8,0'
	--		WHEN ka.keskiarvo_lukuaineet < 7.5 AND ka.keskiarvo_lukuaineet >= 7.0 THEN '7,0 - 7,5'
	--		WHEN ka.keskiarvo_lukuaineet < 7.0 AND ka.keskiarvo_lukuaineet >= 6.5 THEN '6,5 - 7,0'
	--		WHEN ka.keskiarvo_lukuaineet < 6.5 AND ka.keskiarvo_lukuaineet >= 6.0 THEN '6,0 - 6,5'
	--		WHEN ka.keskiarvo_lukuaineet < 6.0 AND ka.keskiarvo_lukuaineet >= 5.5 THEN '5,5 - 6,0'
	--		WHEN ka.keskiarvo_lukuaineet < 5.5 AND ka.keskiarvo_lukuaineet >= 5.0 THEN '5,0 - 5,5'
	--		WHEN ka.keskiarvo_lukuaineet < 5.0 AND ka.keskiarvo_lukuaineet >= 4.5 THEN '4,5 - 5,0'
	--		WHEN ka.keskiarvo_lukuaineet < 4.5 AND ka.keskiarvo_lukuaineet >= 4.0 THEN '4,0 - 4,5'
	--		ELSE 'Tieto puuttuu'
	--		END
	,jarj_peruskoulu_keskiarvo_lukuaineet_kategoria =
		CASE 
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 99
			WHEN ka.keskiarvo_lukuaineet >= 9.5 THEN 1
			WHEN ka.keskiarvo_lukuaineet < 9.5 AND ka.keskiarvo_lukuaineet >= 9.0 THEN 2
			WHEN ka.keskiarvo_lukuaineet < 9.0 AND ka.keskiarvo_lukuaineet >= 8.5 THEN 3
			WHEN ka.keskiarvo_lukuaineet < 8.5 AND ka.keskiarvo_lukuaineet >= 8.0 THEN 4
			WHEN ka.keskiarvo_lukuaineet < 8.0 AND ka.keskiarvo_lukuaineet >= 7.5 THEN 5
			WHEN ka.keskiarvo_lukuaineet < 7.5 AND ka.keskiarvo_lukuaineet >= 7.0 THEN 6
			WHEN ka.keskiarvo_lukuaineet < 7.0 AND ka.keskiarvo_lukuaineet >= 6.5 THEN 7
			WHEN ka.keskiarvo_lukuaineet < 6.5 AND ka.keskiarvo_lukuaineet >= 6.0 THEN 8
			WHEN ka.keskiarvo_lukuaineet < 6.0 AND ka.keskiarvo_lukuaineet >= 5.5 THEN 9
			WHEN ka.keskiarvo_lukuaineet < 5.5 AND ka.keskiarvo_lukuaineet >= 5.0 THEN 10
			WHEN ka.keskiarvo_lukuaineet < 5.0 AND ka.keskiarvo_lukuaineet >= 4.5 THEN 11
			WHEN ka.keskiarvo_lukuaineet < 4.5 AND ka.keskiarvo_lukuaineet >= 4.0 THEN 12
			ELSE 99
			END
	--,keskiarvo_kvintiili = 
	--	CASE
	--		WHEN ka.keskiarvo IS NULL THEN 'Tieto puuttuu'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.8 THEN '5. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.6 THEN '4. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.4 THEN '3. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.2 THEN '2. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.0 THEN '1. kvintiili'
	--		ELSE 'Tieto puuttuu' END
	,keskiarvo_kvintiili_koodi = 
		CASE
			WHEN ka.keskiarvo IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.0 THEN 5
			ELSE 9 END
	--,keskiarvo_lukuaineet_kvintiili = 
	--	CASE
	--		WHEN ka.keskiarvo_lukuaineet IS NULL THEN 'Tieto puuttuu'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.8 THEN '5. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.6 THEN '4. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.4 THEN '3. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.2 THEN '2. kvintiili'
	--		WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.0 THEN '1. kvintiili'
	--		ELSE 'Tieto puuttuu' END
	,keskiarvo_lukuaineet_kvintiili_koodi = 
		CASE
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.0 THEN 5
			ELSE 9 END
INTO Koski_SA.sa.temp_koski_opintojen_kulku_2d_taustatiedot
FROM Koski_SA.sa.temp_opintojen_kulku_tarkastelupaivat_1 k1
LEFT JOIN Koski_SA.sa.temp_koski_perusaste_keskiarvot ka ON ka.oppija_oid = k1.oppija_oid
WHERE ka.oppija_oid IS NOT NULL



GO


USE ANTERO