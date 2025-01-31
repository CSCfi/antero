USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_erityinen_koulutustehtava_lukio]    Script Date: 2.2.2024 11:22:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_erityinen_koulutustehtava_lukio] AS


IF (SELECT count(1) FROM dw.d_erityinen_koulutustehtava_lukio WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_erityinen_koulutustehtava_lukio
		
	SET IDENTITY_INSERT dw.d_erityinen_koulutustehtava_lukio ON

	INSERT dw.d_erityinen_koulutustehtava_lukio (
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
		'etl: p_lataa_d_erityinen_koulutustehtava_lukio'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_erityinen_koulutustehtava_lukio OFF
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
			source = 'etl: p_lataa_d_erityinen_koulutustehtava_lukio'
		FROM dw.d_erityinen_koulutustehtava_lukio d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


MERGE dw.d_erityinen_koulutustehtava_lukio AS target
USING (
	SELECT 
		koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys = koodi
		,'etl: p_lataa_d_erityinen_koulutustehtava_lukio' AS source
	FROM sa.sa_koodistot
	where koodisto = 'lukioerityinenkoulutustehtavauusi'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi
			,selite_sv = src.nimi_sv
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
			,src.nimi_sv
			,src.nimi_en
			,src.jarjestys
			,src.source
			);



GO


