USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_koulutusala_1995]
AS
IF (
		SELECT count(1)
		FROM dw.d_koulutusala_1995
		WHERE koodi = '-1'
		) = 0
    BEGIN
	SET IDENTITY_INSERT dw.d_koulutusala_1995 ON;
		INSERT INTO dw.d_koulutusala_1995 (
			id,
			koodi,
			selite_fi,
			selite_sv,
			selite_en
			,source
			)
		SELECT
			-1,
			koodi,nimi,nimi_sv,nimi_en,
			'etl: p_lataa_d_koulutusala_1995'
		FROM sa.sa_koodistot
		WHERE koodisto='vipunenmeta'
		  AND koodi='-1';
	  SET IDENTITY_INSERT dw.d_koulutusala_1995 OFF;
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
			source = 'etl: p_lataa_d_koulutusala_1995'
		FROM dw.d_koulutusala_1995 d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE  dw.d_koulutusala_1995 AS target
USING (
	SELECT
		koodi
		,COALESCE(nimi, nimi_sv, nimi_en) as selite_fi
		,COALESCE(nimi_sv, nimi, nimi_en) as selite_sv
		,COALESCE(nimi_en, nimi, nimi_sv) as selite_en
		,'etl: p_lataa_d_koulutusala_1995' AS source
	FROM sa.sa_koodistot
	-- koodirajaus 2015 suorien käsikirjasta
	where koodisto = 'opintoalaoph1995' AND koodi <95 AND koodi >74

	) AS src
	ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,source
			)
		VALUES (
			src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.source
			);
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusala_1995' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
  ALTER TABLE dw.d_koulutusala_1995 ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
  END
END
