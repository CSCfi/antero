USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amk_tehtavaryhma]    Script Date: 31.1.2018 9:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_amk_tehtavaryhma]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_tehtavaryhma
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk_tehtavaryhma
	set identity_insert dw.d_amk_tehtavaryhma on
	INSERT dw.d_amk_tehtavaryhma (
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
		,N'etl: p_lataa_d_amk_tehtavaryhma'
		)
	set identity_insert dw.d_amk_tehtavaryhma off
END

MERGE dw.d_amk_tehtavaryhma AS target
USING (
	SELECT koodi
		,selite_fi
		,selite_sv
		,selite_en
		,'etl: p_lataa_d_amk_tehtavaryhma' AS source
	FROM sa.sa_suorat_koodistot_amk_tehtavaryhma
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
