USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_koski_tutkinnonosat]    Script Date: 13.12.2024 12.43.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_koski_tutkinnonosat] AS

IF (
	SELECT count(1)
	FROM dw.d_koski_tutkinnonosat
	WHERE koodi = '-1'
) = 0

BEGIN
	TRUNCATE TABLE dw.d_koski_tutkinnonosat

	set identity_insert dw.d_koski_tutkinnonosat on

	INSERT dw.d_koski_tutkinnonosat (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys_koodi
		,source
	)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		'etl: p_lataa_d_koski_tutkinnonosat'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_koski_tutkinnonosat off
END

ELSE 

BEGIN
	UPDATE d 
	SET koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys_koodi = 99,
		source = 'etl: p_lataa_d_koski_tutkinnonosat'
	FROM dw.d_koski_tutkinnonosat d
	join sa.sa_koodistot s on s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
END

MERGE dw.d_koski_tutkinnonosat AS target
USING (
	SELECT top(100) percent
		koodi,
		trim(coalesce(nimi, nimi_sv, nimi_en,'Tieto puuttuu')) AS selite_fi,
		trim(coalesce(nimi_sv, nimi, nimi_en,'Information saknas')) AS selite_sv,
		trim(coalesce(nimi_en, nimi, nimi_sv,'Missing data')) AS selite_en,
		koodi AS jarjestys_koodi,
		'virkailija.opintopolku.fi/koodisto-service/rest/json/tutkinnonosat/koodi' AS source
	FROM sa.sa_koodistot
	where koodisto = 'tutkinnonosat'
	order by koodi
) AS src
ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,jarjestys_koodi = src.jarjestys_koodi
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,jarjestys_koodi
			,source
		)
		VALUES (
			src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.jarjestys_koodi
			,src.source
		);

GO
