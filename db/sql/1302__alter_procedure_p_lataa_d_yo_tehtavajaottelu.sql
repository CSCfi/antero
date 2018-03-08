ALTER PROCEDURE [dw].[p_lataa_d_yo_tehtavanjaottelu]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_tehtavanjaottelu
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_tehtavanjaottelu
	set identity_insert dw.d_yo_tehtavanjaottelu on
	INSERT dw.d_yo_tehtavanjaottelu (
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
		,N'Tuntematon'
		,N'Okänd'
		,N'Unknown'
		,N'etl: p_lataa_d_yo_tehtavanjaottelu'
		)
	set identity_insert dw.d_yo_tehtavanjaottelu off
END

MERGE dw.d_yo_tehtavanjaottelu AS target
USING (
	SELECT TOP 100 PERCENT koodi
		,COALESCE(nimi, nimi_sv, nimi_en) as selite_fi
		,COALESCE(nimi_sv, nimi, nimi_en) as selite_sv
		,COALESCE(nimi_en, nimi, nimi_sv) as selite_en
		,'etl: p_lataa_d_yo_tehtavanjaottelu' AS source
	FROM sa.sa_koodistot
	where koodisto = 'suorathenkilostoyotehtavajaottelu'
	ORDER BY koodi
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
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_tehtavanjaottelu' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_yo_tehtavanjaottelu ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
	END
END
