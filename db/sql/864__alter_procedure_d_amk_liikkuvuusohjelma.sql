ALTER PROCEDURE [dw].[p_lataa_d_amk_liikkuvuusohjelma]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_liikkuvuusohjelma
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk_liikkuvuusohjelma
	set identity_insert dw.d_amk_liikkuvuusohjelma on
	INSERT dw.d_amk_liikkuvuusohjelma (
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
		,N'etl: p_lataa_d_amk_liikkuvuusohjelma'
		)
	set identity_insert dw.d_amk_liikkuvuusohjelma off
END

MERGE dw.d_amk_liikkuvuusohjelma AS target
USING (
	SELECT koodi
		,selite_fi
		,selite_sv
		,selite_en
		,'etl: p_lataa_d_amk_liikkuvuusohjelma' AS source
	FROM sa.sa_suorat_koodistot_liikkuvuusohjelma
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
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_liikkuvuusohjelma' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
		ALTER TABLE dw.d_amk_liikkuvuusohjelma ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
		END
END
