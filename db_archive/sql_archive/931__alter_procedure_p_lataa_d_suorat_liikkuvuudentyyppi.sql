ALTER PROCEDURE [dw].[p_lataa_d_suorat_liikkuvuudentyyppi] AS
IF (
		SELECT count(1)
		FROM dw.d_suorat_liikkuvuudentyyppi
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_suorat_liikkuvuudentyyppi
	set identity_insert dw.d_suorat_liikkuvuudentyyppi on
	INSERT dw.d_suorat_liikkuvuudentyyppi (
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
		,N'etl: p_lataa_d_suorat_liikkuvuuden_tyyppi'
		)
	set identity_insert dw.d_suorat_liikkuvuudentyyppi off
END

MERGE dw.d_suorat_liikkuvuudentyyppi AS target
USING (
	SELECT 1 as koodi
		,'Pitkä vierailu' as selite_fi
		,'Lång vistelse' as selite_sv
		,'Long visit' as selite_en
		,'etl: p_lataa_d_suorat_liikkuvuuden_tyyppi' AS source
	UNION ALL
	SELECT 2 as koodi
		,'Lyhyt vierailu' as selite_fi
		,'Kort vistelse' as selite_sv
		,'Short visit' as selite_en
		,'etl: p_lataa_d_suorat_liikkuvuuden_tyyppi' AS source
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
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_suorat_liikkuvuudentyyppi' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_suorat_liikkuvuudentyyppi ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
	END
END
