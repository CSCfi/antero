ALTER PROCEDURE [dw].[p_lataa_d_tutkinnon_taso]
AS
IF (
		SELECT count(1)
		FROM dw.d_tutkinnon_taso
		WHERE id = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_tutkinnon_taso
	set identity_insert dw.d_tutkinnon_taso on
	INSERT dw.d_tutkinnon_taso (
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
		,N'etl: p_lataa_d_tutkinnon_taso'
		)
	set identity_insert dw.d_tutkinnon_taso off
END


MERGE dw.d_tutkinnon_taso AS target
USING (
	SELECT koodi
		,selite_fi
		,selite_sv
		,selite_en
		,'etl: p_lataa_d_tutkinnon_taso' AS source
	FROM sa.sa_suorat_koodistot_tutkinnon_taso
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
