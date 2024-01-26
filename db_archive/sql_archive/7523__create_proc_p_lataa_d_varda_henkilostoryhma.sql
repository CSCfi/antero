USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_henkilostoryhma]    Script Date: 30.3.2023 14:00:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_varda_henkilostoryhma]
AS
IF NOT EXISTS (SELECT * FROM dw.d_varda_henkilostoryhma WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_varda_henkilostoryhma ON;

	  INSERT INTO dw.d_varda_henkilostoryhma (
		id
		,koodi, selite_fi, selite_sv, selite_en, jarjestys
		,source, loadtime, username
	  )
	SELECT
		-1,
		koodi,nimi,nimi_sv,nimi_en, 99999,
		'ETL: p_lataa_d_varda_henkilostoryhma',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_varda_henkilostoryhma OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			koodi=s.koodi,
			selite_fi=s.nimi_fi,
			selite_sv=s.nimi_sv,
			selite_en=COALESCE(s.nimi_en, '*EN'),
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_varda_henkilostoryhma'
		FROM dw.d_varda_henkilostoryhma d
		JOIN [ANTERO].[sa].[sa_varda_koodistot] s ON s.koodi = d.koodi
		WHERE s.koodisto = 'vardatehtavanimike'
		;
	END





MERGE dw.d_varda_henkilostoryhma AS target
USING (
	SELECT koodi as koodi
		,nimi_fi as selite_fi
		,nimi_sv AS selite_sv
		,COALESCE(s.nimi_en, '*EN') AS selite_en
		, row_number() over (order by koodi) AS jarjestys
		,'ETL: p_lataa_d_varda_henkilostoryhma' AS source
	FROM [ANTERO].[sa].[sa_varda_koodistot] s 
	WHERE s.koodisto = 'vardatehtavanimike'

	) AS src
	ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,jarjestys = src.jarjestys
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
				koodi, selite_fi, selite_sv, selite_en, jarjestys
				,source
				)
		VALUES (
				src.koodi, src.selite_fi, src.selite_sv, src.selite_en, src.jarjestys
				,src.source
				);


GO


