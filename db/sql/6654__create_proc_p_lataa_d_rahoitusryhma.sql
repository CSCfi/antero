USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_rahoitusryhma]    Script Date: 17.11.2022 11:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_rahoitusryhma] AS


IF (SELECT count(1) FROM dw.d_rahoitusryhma WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_rahoitusryhma
		
	SET IDENTITY_INSERT dw.d_rahoitusryhma ON

	INSERT dw.d_rahoitusryhma (
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
		'etl: p_lataa_d_rahoitusryhma'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_rahoitusryhma OFF
END


MERGE dw.d_rahoitusryhma AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys = cast(koodi as int)
		,'etl: p_lataa_d_rahoitusryhma' AS source
	FROM sa.sa_koodistot
	where koodisto = 'rahoitusryhma'
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




