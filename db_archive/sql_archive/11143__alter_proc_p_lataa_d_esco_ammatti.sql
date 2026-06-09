USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_esco_ammatti]    Script Date: 5.9.2025 7.30.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_d_esco_ammatti]
AS
IF NOT EXISTS (SELECT * FROM dw.d_esco_ammatti WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_esco_ammatti ON;

	  INSERT INTO dw.d_esco_ammatti (
		id,koodit_ammatti
		,koodit_ammatti_taso1,ammatti_taso1_fi,ammatti_taso1_sv,ammatti_taso1_en
		,koodit_ammatti_taso2,ammatti_taso2_fi,ammatti_taso2_sv,ammatti_taso2_en
		,koodit_ammatti_taso3,ammatti_taso3_fi,ammatti_taso3_sv,ammatti_taso3_en
		,koodit_ammatti_taso4,ammatti_taso4_fi,ammatti_taso4_sv,ammatti_taso4_en
		,source, loadtime, username
	  )
	SELECT
		-1,koodi,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_esco_ammatti',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_esco_ammatti OFF;

	END 
	
	ELSE

	BEGIN

	SET IDENTITY_INSERT dw.d_esco_ammatti OFF;

	END

MERGE dw.d_esco_ammatti AS target
USING (
	SELECT * FROM (
		SELECT 
			s1.koodi as koodit_ammatti,
			s1.koodi as koodit_ammatti_taso1,
			s1.ammatti_fi as ammatti_taso1_fi,
			s1.ammatti_sv as ammatti_taso1_sv,
			s1.ammatti_en as ammatti_taso1_en,
			NULL as koodit_ammatti_taso2,
			NULL as ammatti_taso2_fi,
			NULL as ammatti_taso2_sv,
			NULL as ammatti_taso2_en,
			NULL as koodit_ammatti_taso3,
			NULL as ammatti_taso3_fi,
			NULL as ammatti_taso3_sv,
			NULL as ammatti_taso3_en,
			NULL as koodit_ammatti_taso4,
			NULL as ammatti_taso4_fi,
			NULL as ammatti_taso4_sv,
			NULL as ammatti_taso4_en,
			'ETL: p_lataa_d_esco_ammatti' AS source
		FROM ANTERO.sa.sa_esco_ammatit s1
		WHERE LEN(s1.koodi) = 4

		UNION ALL

		SELECT 
			s1.koodi as koodit_ammatti,
			s2.koodi as koodit_ammatti_taso1,
			s2.ammatti_fi as ammatti_taso1_fi,
			s2.ammatti_sv as ammatti_taso1_sv,
			s2.ammatti_en as ammatti_taso1_en,
			s1.koodi as koodit_ammatti_taso2,
			s1.ammatti_fi as ammatti_taso2_fi,
			s1.ammatti_sv as ammatti_taso2_sv,
			s1.ammatti_en as ammatti_taso2_en,
			NULL as koodit_ammatti_taso3,
			NULL as ammatti_taso3_fi,
			NULL as ammatti_taso3_sv,
			NULL as ammatti_taso3_en,
			NULL as koodit_ammatti_taso4,
			NULL as ammatti_taso4_fi,
			NULL as ammatti_taso4_sv,
			NULL as ammatti_taso4_en,
			'ETL: p_lataa_d_esco_ammatti' AS source
		FROM ANTERO.sa.sa_esco_ammatit s1
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s2 on s2.koodi = LEFT(s1.koodi, LEN(s2.koodi) ) AND LEN(s2.koodi) = 4
		WHERE LEN(s1.koodi) - LEN(REPLACE(s1.koodi, '.', '')) = 1

		UNION ALL

		SELECT 
			s1.koodi as koodit_ammatti,
			s3.koodi as koodit_ammatti_taso1,
			s3.ammatti_fi as ammatti_taso1_fi,
			s3.ammatti_sv as ammatti_taso1_sv,
			s3.ammatti_en as ammatti_taso1_en,
			s2.koodi as koodit_ammatti_taso2,
			s2.ammatti_fi as ammatti_taso2_fi,
			s2.ammatti_sv as ammatti_taso2_sv,
			s2.ammatti_en as ammatti_taso2_en,
			s1.koodi as koodit_ammatti_taso3,
			s1.ammatti_fi as ammatti_taso3_fi,
			s1.ammatti_sv as ammatti_taso3_sv,
			s1.ammatti_en as ammatti_taso3_en,
			NULL as koodit_ammatti_taso4,
			NULL as ammatti_taso4_fi,
			NULL as ammatti_taso4_sv,
			NULL as ammatti_taso4_en,
			'ETL: p_lataa_d_esco_ammatti' AS source
		FROM ANTERO.sa.sa_esco_ammatit s1
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s2 on s1.koodi like '%' + s2.koodi + '.%' AND LEN(s2.koodi) - LEN(REPLACE(s2.koodi, '.', '')) = 1
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s3 on s1.koodi like '%' + s3.koodi + '%' AND LEN(s3.koodi) = 4
		WHERE LEN(s1.koodi) - LEN(REPLACE(s1.koodi, '.', '')) = 2

		UNION ALL

		SELECT 
			s1.koodi as koodit_ammatti,
			s4.koodi as koodit_ammatti_taso1,
			s4.ammatti_fi as ammatti_taso1_fi,
			s4.ammatti_sv as ammatti_taso1_sv,
			s4.ammatti_en as ammatti_taso1_en,
			s3.koodi as koodit_ammatti_taso2,
			s3.ammatti_fi as ammatti_taso2_fi,
			s3.ammatti_sv as ammatti_taso2_sv,
			s3.ammatti_en as ammatti_taso2_en,
			s2.koodi as koodit_ammatti_taso3,
			s2.ammatti_fi as ammatti_taso3_fi,
			s2.ammatti_sv as ammatti_taso3_sv,
			s2.ammatti_en as ammatti_taso3_en,
			s1.koodi as koodit_ammatti_taso4,
			s1.ammatti_fi as ammatti_taso4_fi,
			s1.ammatti_sv as ammatti_taso4_sv,
			s1.ammatti_en as ammatti_taso4_en,
			'ETL: p_lataa_d_esco_ammatti' AS source
		FROM ANTERO.sa.sa_esco_ammatit s1
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s2 on s1.koodi like '%' + s2.koodi + '.%' AND LEN(s2.koodi) - LEN(REPLACE(s2.koodi, '.', '')) = 2
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s3 on s1.koodi like '%' + s3.koodi + '.%' AND LEN(s3.koodi) - LEN(REPLACE(s3.koodi, '.', '')) = 1
		LEFT JOIN ANTERO.sa.sa_esco_ammatit s4 on s1.koodi like '%' + s4.koodi + '%' AND LEN(s4.koodi) = 4
		WHERE LEN(s1.koodi) - LEN(REPLACE(s1.koodi, '.', '')) = 3
	) f
) AS src ON target.koodit_ammatti = src.koodit_ammatti
WHEN MATCHED
	THEN
		UPDATE
		SET target.koodit_ammatti = src.koodit_ammatti,
			target.koodit_ammatti_taso1 = src.koodit_ammatti_taso1,
			target.ammatti_taso1_fi = src.ammatti_taso1_fi,
			target.ammatti_taso1_sv = src.ammatti_taso1_sv,
			target.ammatti_taso1_en = src.ammatti_taso1_en,
			target.koodit_ammatti_taso2 = src.koodit_ammatti_taso2,
			target.ammatti_taso2_fi = src.ammatti_taso2_fi,
			target.ammatti_taso2_sv = src.ammatti_taso2_sv,
			target.ammatti_taso2_en = src.ammatti_taso2_en,
			target.koodit_ammatti_taso3 = src.koodit_ammatti_taso3,
			target.ammatti_taso3_fi = src.ammatti_taso3_fi,
			target.ammatti_taso3_sv = src.ammatti_taso3_sv,
			target.ammatti_taso3_en = src.ammatti_taso3_en,
			target.koodit_ammatti_taso4 = src.koodit_ammatti_taso4,
			target.ammatti_taso4_fi = src.ammatti_taso4_fi,
			target.ammatti_taso4_sv = src.ammatti_taso4_sv,
			target.ammatti_taso4_en = src.ammatti_taso4_en,
			target.source = src.source
			
WHEN NOT MATCHED
	THEN
		INSERT (
				koodit_ammatti,koodit_ammatti_taso1,ammatti_taso1_fi,ammatti_taso1_sv,ammatti_taso1_en,
				koodit_ammatti_taso2,ammatti_taso2_fi,ammatti_taso2_sv,ammatti_taso2_en,
				koodit_ammatti_taso3,ammatti_taso3_fi,ammatti_taso3_sv,ammatti_taso3_en,
				koodit_ammatti_taso4,ammatti_taso4_fi,ammatti_taso4_sv,ammatti_taso4_en,source
				)
		VALUES (
				src.koodit_ammatti,src.koodit_ammatti_taso1,src.ammatti_taso1_fi,src.ammatti_taso1_sv,src.ammatti_taso1_en,
				src.koodit_ammatti_taso2,src.ammatti_taso2_fi,src.ammatti_taso2_sv,src.ammatti_taso2_en,
				src.koodit_ammatti_taso3,src.ammatti_taso3_fi,src.ammatti_taso3_sv,src.ammatti_taso3_en,
				src.koodit_ammatti_taso4,src.ammatti_taso4_fi,src.ammatti_taso4_sv,src.ammatti_taso4_en,src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_esco_ammatit) > 0 THEN DELETE;

GO
