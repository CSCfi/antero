USE [ANTERO]

GO

CREATE OR ALTER PROCEDURE dw.p_lataa_d_opintojen_kulku_kohortit AS

IF EXISTS (
    SELECT 1
    FROM Koski_SA.INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'temp_opintojen_kulku_4_koonti'
)

BEGIN

	TRUNCATE TABLE ANTERO.dw.d_opintojen_kulku_kohortit

	INSERT INTO ANTERO.dw.d_opintojen_kulku_kohortit
	SELECT
		kohortti_vp,
		aloitusajankohta,
		aloitusvuosi,
		aloitusvuosipuolisko_fi,
		'' as aloitusvuosipuolisko_se,
		'' as aloitusvuosipuolisko_en,
		RANK() OVER (ORDER BY kohortti_vp) as jarj_aloitusajankohta,
		jarj_vuosipuolisko
	FROM (
		SELECT DISTINCT
			kohortti_vp,
			CASE 
				WHEN RIGHT(kohortti_vp,1) = '1' THEN CONCAT('1.1. - 30.6.', LEFT(kohortti_vp, 4)) 
				WHEN RIGHT(kohortti_vp,1) = '2' THEN CONCAT('1.7. - 31.12.', LEFT(kohortti_vp, 4))
				ELSE NULL
			END as aloitusajankohta,
			LEFT(kohortti_vp, 4) as aloitusvuosi,
			CASE 
				WHEN RIGHT(kohortti_vp,1) = '1' THEN '1. vuosipuolisko' 
				WHEN RIGHT(kohortti_vp,1) = '2' THEN '2. vuosipuolisko'
				ELSE NULL
			END as aloitusvuosipuolisko_fi,
			CASE 
				WHEN RIGHT(kohortti_vp,1) = '1' THEN 1 
				WHEN RIGHT(kohortti_vp,1) = '2' THEN 2
				ELSE NULL
			END as jarj_vuosipuolisko
		FROM Koski_SA.sa.temp_opintojen_kulku_4_koonti
	) f

END