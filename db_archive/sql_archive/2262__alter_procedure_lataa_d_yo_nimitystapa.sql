USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_yo_nimitystapa]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_nimitystapa
		WHERE id = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_nimitystapa
	set identity_insert dw.d_yo_nimitystapa on
	INSERT dw.d_yo_nimitystapa (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)

		SELECT
			-1,
			koodi,
			nimi,
			nimi_sv,
			nimi_en,
			'ETL: p_lataa_d_yo_nimitystapa'
		FROM sa.sa_koodistot
		WHERE koodisto='vipunenmeta'
		  AND koodi='-1';

		SET IDENTITY_INSERT dw.d_yo_nimitystapa OFF;
END
ELSE
	BEGIN
		UPDATE d
		SET
			koodi = s.koodi,
			selite_fi=s.nimi,
			selite_sv=s.nimi_sv,
			selite_en=s.nimi_en,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'ETL: p_lataa_d_yo_nimitystapa'
		FROM dw.d_yo_nimitystapa d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_yo_nimitystapa AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='nimitystapa'
) AS src
ON target.koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    selite_fi = src.nimi,
    selite_sv = src.nimi_sv,
    selite_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_nimitystapa' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_yo_nimitystapa ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
  END
END
