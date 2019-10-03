ALTER PROCEDURE [dw].[p_lataa_d_amk_paatoimiset_opettajat]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_paatoimiset_opettajat
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk_paatoimiset_opettajat
	set identity_insert dw.d_amk_paatoimiset_opettajat on
	INSERT dw.d_amk_paatoimiset_opettajat (
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
		,N'etl: p_lataa_d_amk_paatoimiset_opettajat'
		)
	set identity_insert dw.d_amk_paatoimiset_opettajat off
END

MERGE dw.d_amk_paatoimiset_opettajat AS target
USING (
	SELECT koodi
		,selite_fi
		,selite_sv
		,selite_en
		,'etl: p_lataa_d_amk_paatoimiset_opettajat' AS source
	FROM sa.sa_suorat_koodistot_amk_paatoimiset_opettajat
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