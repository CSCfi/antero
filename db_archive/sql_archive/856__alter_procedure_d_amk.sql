ALTER PROCEDURE [dw].[p_lataa_d_amk]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk
		WHERE amk_tunnus = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk

	set identity_insert dw.d_amk on
	INSERT dw.d_amk (
		id
		,amk_tunnus
		,amk_nimi_fi
		,amk_nimi_sv
		,amk_nimi_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'Okänd'
		,N'Unknown'
		,N'etl: p_lataa_d_amk'
		)
	set identity_insert dw.d_amk off
END

MERGE dw.d_amk AS target
USING (
	SELECT koodi
		,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,'ETL: p_lataa_d_amk' AS source
	FROM sa.sa_oppilaitosluokitus
	WHERE oppilaitostyyppikoodi = '41'

	UNION

	SELECT koodi
		,selite_fi AS nimi
		,selite_sv AS nimi_sv
		,selite_en AS nimi_en
		,'ETL: p_lataa_d_amk' AS source
	FROM sa.sa_suorat_koodistot_ammattikorkeakoulut
	WHERE koodi IN (
			SELECT koodi
			FROM sa.sa_suorat_koodistot_ammattikorkeakoulut

			EXCEPT

			SELECT koodi
			FROM sa.sa_oppilaitosluokitus
			WHERE oppilaitostyyppikoodi = '41'
			)
	) AS src
	ON target.amk_tunnus = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET amk_nimi_fi = src.nimi
			,amk_nimi_sv = src.nimi_sv
			,amk_nimi_en = src.nimi_en
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			amk_tunnus
			,amk_nimi_fi
			,amk_nimi_sv
			,amk_nimi_en
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);
IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk' AND COLUMN_NAME='jarjestys_amk_tunnus')

BEGIN
		ALTER TABLE dw.d_amk ADD jarjestys_amk_tunnus AS
		case when amk_tunnus = -1 then '99999' else cast(amk_tunnus as varchar(10))
		END
END
