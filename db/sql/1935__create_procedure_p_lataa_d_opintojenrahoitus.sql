USE [ANTERO]
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = object_id('dw.p_lataa_d_opintojenrahoitus') AND type IN ('p', 'pc'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure dw.p_lataa_d_opintojenrahoitus as'
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_opintojenrahoitus]
AS
IF (
		SELECT count(1)
		FROM dw.d_opintojenrahoitus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_opintojenrahoitus
	set identity_insert dw.d_opintojenrahoitus on
	INSERT dw.d_opintojenrahoitus (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'virkailija.opintopolku.fi/koodisto-service/rest/json/opintojenrahoitus/koodi'
		)
	set identity_insert dw.d_opintojenrahoitus off
END


MERGE dw.d_opintojenrahoitus AS target
USING (
	SELECT TOP(100) PERCENT
	koodi,
	coalesce(nimi, nimi_sv, nimi_en,'Tieto puuttuu') AS selite_fi,
	coalesce(nimi_sv, nimi, nimi_en,'Information saknas') AS selite_sv,
	coalesce(nimi_en, nimi, nimi_sv,'Missing data') AS selite_en,
	'virkailija.opintopolku.fi/koodisto-service/rest/json/opintojenrahoitus/koodi' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opintojenrahoitus'
	order by koodi

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
