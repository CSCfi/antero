USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_pohjakoulutus]    Script Date: 12.12.2017 10:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_pohjakoulutus]
AS
IF (
		SELECT count(1)
		FROM dw.d_pohjakoulutus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_pohjakoulutus
	set identity_insert dw.d_pohjakoulutus on
	INSERT dw.d_pohjakoulutus (
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
		,N'etl: p_lataa_d_pohjakoulutus'
		)
	set identity_insert dw.d_pohjakoulutus off
END


MERGE dw.d_pohjakoulutus AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_pohjakoulutus' AS source
	FROM sa.sa_koodistot
	where koodisto = 'pohjakoulutustoinenaste'

	UNION 

	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_pohjakoulutus' AS source
	FROM sa.sa_koodistot
	where koodisto = 'pohjakoulutuskkodw'
	
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
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);


