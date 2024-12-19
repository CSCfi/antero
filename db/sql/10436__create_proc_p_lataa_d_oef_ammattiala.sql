USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oef_ammattiala]    Script Date: 19.12.2024 15.34.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_oef_ammattiala]
AS
IF NOT EXISTS (SELECT * FROM dw.d_oef_ammattiala WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_oef_ammattiala ON;

	  INSERT INTO dw.d_oef_ammattiala (
		 id,koodi
		,ammattiala_taso1_koodi,ammattiala_taso1_fi,ammattiala_taso1_sv,ammattiala_taso1_en
		,ammattiala_taso2_koodi,ammattiala_taso2_fi,ammattiala_taso2_sv,ammattiala_taso2_en
		,ammattiala_taso3_koodi,ammattiala_taso3_fi,ammattiala_taso3_sv,ammattiala_taso3_en
		,source, loadtime, username
	  )
	SELECT
		-1,'99.99.99',
		'99',nimi,nimi_sv,nimi_en,
		'99.99',nimi,nimi_sv,nimi_en,
		'99.99.99',nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_oef_ammattiala',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_oef_ammattiala OFF;

	END 
	
	ELSE

	BEGIN

	SET IDENTITY_INSERT dw.d_oef_ammattiala OFF;

	END

MERGE dw.d_oef_ammattiala AS target
USING (
	SELECT 
		*, 
		'ETL: p_lataa_d_oef_ammattiala' as source 
	FROM (
		SELECT
			s3.koodi,
			s1.nimi as ammattiala_taso1_fi,
			s1.nimi_sv as ammattiala_taso1_sv,
			s1.nimi_en as ammattiala_taso1_en,
			s1.koodi as ammattiala_taso1_koodi,
			s2.nimi as ammattiala_taso2_fi,
			s2.nimi_sv as ammattiala_taso2_sv,
			s2.nimi_en as ammattiala_taso2_en,
			s2.koodi as ammattiala_taso2_koodi,
			s3.nimi as ammattiala_taso3_fi,
			s3.nimi_sv as ammattiala_taso3_sv,
			s3.nimi_en as ammattiala_taso3_en,
			s3.koodi as ammattiala_taso3_koodi
		FROM ANTERO.sa.sa_koodistot  s1
		LEFT JOIN ANTERO.sa.sa_koodistot  s2 on s2.koodisto = 'ammattialaluokitusoeftaso2' and  s1.koodi = LEFT(s2.koodi,2)
		LEFT JOIN ANTERO.sa.sa_koodistot  s3 on s3.koodisto = 'ammattialaluokitusoeftaso3' and  s2.koodi = LEFT(s3.koodi,5)
		WHERE s1.koodisto = 'ammattialaluokitusoeftaso1'

		UNION ALL

		SELECT
			s2.koodi,
			s1.nimi as ammattiala_taso1_fi,
			s1.nimi_sv as ammattiala_taso1_sv,
			s1.nimi_en as ammattiala_taso1_en,
			s1.koodi as ammattiala_taso1_koodi,
			s2.nimi as ammattiala_taso2_fi,
			s2.nimi_sv as ammattiala_taso2_sv,
			s2.nimi_en as ammattiala_taso2_en,
			s2.koodi as ammattiala_taso2_koodi,
			'Tieto puuttuu' as ammattiala_taso3_fi,
			'Information saknas' as ammattiala_taso3_sv,
			'Missing data' as ammattiala_taso3_en,
			'-1' as ammattiala_taso3_koodi
		FROM ANTERO.sa.sa_koodistot  s1
		LEFT JOIN ANTERO.sa.sa_koodistot  s2 on s2.koodisto = 'ammattialaluokitusoeftaso2' and  s1.koodi = LEFT(s2.koodi,2)
		WHERE s1.koodisto = 'ammattialaluokitusoeftaso1'

		UNION ALL

		SELECT
			s1.koodi,
			s1.nimi as ammattiala_taso1_fi,
			s1.nimi_sv as ammattiala_taso1_sv,
			s1.nimi_en as ammattiala_taso1_en,
			s1.koodi as ammattiala_taso1_koodi,
			'Tieto puuttuu' as ammattiala_taso2_fi,
			'Information saknas' as ammattiala_taso2_sv,
			'Missing data' as ammattiala_taso2_en,
			'-1' as ammattiala_taso2_koodi,
			'Tieto puuttuu' as ammattiala_taso3_fi,
			'Information saknas' as ammattiala_taso3_sv,
			'Missing data' as ammattiala_taso3_en,
			'-1' as ammattiala_taso3_koodi
		FROM ANTERO.sa.sa_koodistot  s1
		WHERE s1.koodisto = 'ammattialaluokitusoeftaso1'
	) s
) AS src ON target.koodi = src.koodi 
WHEN MATCHED
	THEN
		UPDATE
		SET target.koodi = src.koodi,
			target.ammattiala_taso1_koodi = src.ammattiala_taso1_koodi,
			target.ammattiala_taso1_fi = src.ammattiala_taso1_fi,
			target.ammattiala_taso1_sv = src.ammattiala_taso1_sv,
			target.ammattiala_taso1_en = src.ammattiala_taso1_en,
			target.ammattiala_taso2_koodi = src.ammattiala_taso2_koodi,
			target.ammattiala_taso2_fi = src.ammattiala_taso2_fi,
			target.ammattiala_taso2_sv = src.ammattiala_taso2_sv,
			target.ammattiala_taso2_en = src.ammattiala_taso2_en,
			target.ammattiala_taso3_koodi = src.ammattiala_taso3_koodi,
			target.ammattiala_taso3_fi = src.ammattiala_taso3_fi,
			target.ammattiala_taso3_sv = src.ammattiala_taso3_sv,
			target.ammattiala_taso3_en = src.ammattiala_taso3_en,
			target.source = src.source
			
WHEN NOT MATCHED
	THEN
		INSERT (
				koodi,ammattiala_taso1_koodi,ammattiala_taso1_fi,ammattiala_taso1_sv,ammattiala_taso1_en,
				ammattiala_taso2_koodi,ammattiala_taso2_fi,ammattiala_taso2_sv,ammattiala_taso2_en,
				ammattiala_taso3_koodi,ammattiala_taso3_fi,ammattiala_taso3_sv,ammattiala_taso3_en,
				source
				)
		VALUES (
				src.koodi,src.ammattiala_taso1_koodi,src.ammattiala_taso1_fi,src.ammattiala_taso1_sv,src.ammattiala_taso1_en,
				src.ammattiala_taso2_koodi,src.ammattiala_taso2_fi,src.ammattiala_taso2_sv,src.ammattiala_taso2_en,
				src.ammattiala_taso3_koodi,src.ammattiala_taso3_fi,src.ammattiala_taso3_sv,src.ammattiala_taso3_en,
				src.source
				);

GO


