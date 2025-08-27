USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_ammatillinen_oppiaine]    Script Date: 24.1.2025 10.31.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_ammatillinen_oppiaine]
AS
IF NOT EXISTS (SELECT * FROM dw.d_ammatillinen_oppiaine WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_ammatillinen_oppiaine ON;

	  INSERT INTO dw.d_ammatillinen_oppiaine (
		id,koodi, nimi, nimi_sv, nimi_en, source, loadtime, username
	  )
	SELECT
		-1, koodi,
		nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_ammatillinen_oppiaine',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_ammatillinen_oppiaine OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			koodi = s.koodi,
			nimi=s.nimi,
			nimi_sv=s.nimi_sv,
			nimi_en=s.nimi_en,
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_ammatillinen_oppiaine'
		FROM dw.d_ammatillinen_oppiaine d
			JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
		;
	END

MERGE dw.d_ammatillinen_oppiaine AS target
USING (
	SELECT
		koodi,
		COALESCE(nimi, nimi_sv, nimi_en) as nimi,
		COALESCE(nimi_sv, nimi, nimi_en) as nimi_sv,
		COALESCE(nimi_en,nimi,nimi_sv) as nimi_en,
		source = 'ETL: p_lataa_d_ammatillinen_oppiaine'
	FROM ANTERO.sa.sa_koodistot s
	WHERE koodisto = 'ammatillisenoppiaineet'
		
) AS src
ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  koodi = src.koodi
			,nimi = src.nimi
			,nimi_sv = src.nimi_sv
			,nimi_en = src.nimi_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				koodi, nimi, nimi_sv, nimi_en, source
				)
		VALUES (
				src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source
				);

GO

USE [ANTERO]