USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oppisopimuksen_perusta]    Script Date: 15.3.2022 10:36:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_oppisopimuksen_perusta]
AS

IF (
		SELECT count(1)
		FROM dw.d_oppisopimuksen_perusta
		WHERE koodi = '-1'
) = 0

	BEGIN

	  SET IDENTITY_INSERT dw.d_oppisopimuksen_perusta ON;
	  INSERT INTO dw.d_oppisopimuksen_perusta (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys_koodi
		,source
	  )
	  SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_oppisopimuksen_perusta'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  AND koodi='-1';

	  SET IDENTITY_INSERT dw.d_oppisopimuksen_perusta OFF;

	END

ELSE

	BEGIN
		UPDATE d
			SET
				koodi = s.koodi,
				selite_fi=s.nimi,
				selite_sv=s.nimi_sv,
				selite_en=s.nimi_en,
				jarjestys_koodi=9,
				loadtime = getdate(),
				username = suser_name(),
				source = 'etl: p_lataa_d_oppisopimuksen_perusta'
			FROM dw.d_oppisopimuksen_perusta d
			JOIN sa.sa_koodistot s ON s.koodi=d.koodi
			WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_oppisopimuksen_perusta AS target
USING (
	SELECT koodi
		,selite_fi = nimi
		,selite_sv = nimi_sv
		,selite_en = coalesce(nimi_en,	case koodi 
											when '1' then 'Employment, contractual employment or public service employment relationship'
											when '2' then 'Entrepreneur'
										end)
		,jarjestys_koodi = koodi
		,'etl: p_lataa_d_oppisopimuksen_perusta' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'oppisopimuksenperusta'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE
	SET selite_fi = src.selite_fi
		,selite_sv = src.selite_sv
		,selite_en = src.selite_en
		,jarjestys_koodi = src.jarjestys_koodi
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys_koodi
		,source
	)
	VALUES (
		src.koodi
		,src.selite_fi
		,src.selite_sv
		,src.selite_en
		,src.jarjestys_koodi
		,src.source
	);


IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_oppisopimuksen_perusta' AND COLUMN_NAME='jarjestys_koodi'
)
	BEGIN
		ALTER TABLE dw.d_oppisopimuksen_perusta ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
		END
	END

