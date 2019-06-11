USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_amk_tehtavaryhma]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_tehtavaryhma
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk_tehtavaryhma
	SET IDENTITY_INSERT dw.d_amk_tehtavaryhma ON;
	INSERT INTO dw.d_amk_tehtavaryhma (
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
		'etl: p_lataa_d_amk_tehtavaryhma'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_amk_tehtavaryhma OFF;
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
			source = 'etl: p_lataa_d_amk_tehtavaryhma'
		FROM dw.d_amk_tehtavaryhma d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_amk_tehtavaryhma AS target
USING (
	SELECT koodi
		,selite_fi
		,selite_sv
		,selite_en
		,'etl: p_lataa_d_amk_tehtavaryhma' AS source
	FROM sa.sa_suorat_koodistot_amk_tehtavaryhma
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
