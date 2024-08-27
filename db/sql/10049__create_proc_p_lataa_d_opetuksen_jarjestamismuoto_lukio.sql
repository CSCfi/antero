USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_opetuksen_jarjestamismuoto_lukio]    Script Date: 26.8.2024 13:19:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_opetuksen_jarjestamismuoto_lukio] AS


IF (SELECT count(1) FROM dw.d_opetuksen_jarjestamismuoto_lukio WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_opetuksen_jarjestamismuoto_lukio
		
	SET IDENTITY_INSERT dw.d_opetuksen_jarjestamismuoto_lukio ON

	INSERT dw.d_opetuksen_jarjestamismuoto_lukio (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_opetuksen_jarjestamismuoto_lukio'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_opetuksen_jarjestamismuoto_lukio OFF
END

ELSE BEGIN
	UPDATE d
		SET
			koodi = s.koodi,
			selite_fi = s.nimi,
			selite_sv = s.nimi_sv,
			selite_en = s.nimi_en,
			jarjestys = 99,
			loadtime = getdate(),
			username = suser_name(),
			source = 'etl: p_lataa_d_opetuksen_jarjestamismuoto_lukio'
		FROM dw.d_opetuksen_jarjestamismuoto_lukio d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


MERGE dw.d_opetuksen_jarjestamismuoto_lukio AS target
USING (
	SELECT 
		koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys = koodi
		,'etl: p_lataa_d_opetuksen_jarjestamismuoto_lukio' AS source
	FROM sa.sa_koodistot
	where koodisto = 'lukiooikeussisaooppilaitosmuotoiseenkoulutukseen'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi
			,selite_sv = REPLACE(src.nimi_sv, 'Sisäoppilaitosmuotoinen ', '')
			,selite_en = src.nimi_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,jarjestys
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,REPLACE(src.nimi_sv, 'Sisäoppilaitosmuotoinen ', '')
			,src.nimi_en
			,src.jarjestys
			,src.source
			);


GO

