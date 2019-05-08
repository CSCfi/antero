USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opintoala95]    Script Date: 8.5.2019 15:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_opintoala95] AS

IF (
		SELECT count(1)
		FROM dw.d_opintoala95
		WHERE opintoala95_koodi = '-1'
		) = 0
BEGIN
	SET IDENTITY_INSERT dw.d_opintoala95 ON;
	INSERT INTO dw.d_opintoala95 (
		id,
		opintoala95_koodi,
		opintoala95_nimi_fi,
		opintoala95_nimi_sv,
		opintoala95_nimi_en,
		source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		'ETL: p_lataa_d_opintoala95'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_opintoala95 OFF;
	END
ELSE
	BEGIN
		UPDATE d
		SET
			opintoala95_koodi = s.koodi,
			opintoala95_nimi_fi=s.nimi,
			opintoala95_nimi_sv=s.nimi_sv,
			opintoala95_nimi_en=s.nimi_en,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'ETL: p_lataa_d_opintoala95'
		FROM dw.d_opintoala95 d
		JOIN sa.sa_koodistot s ON s.koodi=d.opintoala95_koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_opintoala95 AS target
USING (SELECT koodi
      ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
      ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
      ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
	  ,'ETL: p_lataa_d_opintoala95' AS source
	  FROM sa.sa_koodistot
	  WHERE koodisto = 'opintoalaoph1995' and loppupvm IS NULL) AS src
ON target.opintoala95_koodi = src.koodi
WHEN MATCHED THEN
	UPDATE SET opintoala95_nimi_fi = src.nimi,
				opintoala95_nimi_sv = src.nimi_sv,
				opintoala95_nimi_en = src.nimi_en,
				target.source = src.source
WHEN NOT MATCHED THEN
	INSERT (opintoala95_koodi
           ,opintoala95_nimi_fi
           ,opintoala95_nimi_sv
           ,opintoala95_nimi_en
           ,source)
	VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_opintoala95' AND COLUMN_NAME='jarjestys_opintoala95_koodi')

BEGIN
	ALTER TABLE dw.d_opintoala95 ADD jarjestys_opintoala95_koodi AS case when opintoala95_koodi = -1 then '99999' else cast(opintoala95_koodi as varchar(10))
  END
END
