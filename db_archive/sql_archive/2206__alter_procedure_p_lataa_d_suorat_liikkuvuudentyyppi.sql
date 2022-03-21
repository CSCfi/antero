USE [ANTERO]
GO
ALTER PROCEDURE [dw].[p_lataa_d_suorat_liikkuvuudentyyppi] AS
IF NOT EXISTS (SELECT * FROM dw.d_suorat_liikkuvuudentyyppi
				WHERE koodi = '-1')
BEGIN
	TRUNCATE TABLE dw.d_suorat_liikkuvuudentyyppi
	SET IDENTITY_INSERT dw.d_suorat_liikkuvuudentyyppi ON
	INSERT dw.d_suorat_liikkuvuudentyyppi (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	SELECT
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    source
  FROM sa.sa_koodistot
  WHERE koodisto='vipunenmeta'
  and koodi='-1'
  ;
	SET IDENTITY_INSERT dw.d_suorat_liikkuvuudentyyppi OFF
END
ELSE BEGIN
UPDATE d
  SET
    koodi=s.koodi,
    selite_fi=s.nimi,
    selite_sv=s.nimi_sv,
    selite_en=s.nimi_en,
    d.source=s.source
  FROM  dw.d_suorat_liikkuvuudentyyppi d
  JOIN sa.sa_koodistot s ON s.koodi=d.koodi
  WHERE s.koodisto='vipunenmeta'
  AND s.koodi='-1';
END

MERGE dw.d_suorat_liikkuvuudentyyppi AS target
USING (
	SELECT 1 AS  koodi
		,'Pitkä vierailu' AS  selite_fi
		,'Lång vistelse' AS  selite_sv
		,'Long visit' AS  selite_en
		,'etl: p_lataa_d_suorat_liikkuvuuden_tyyppi' AS   source
	UNION ALL
	SELECT 2 AS   koodi
		,'Lyhyt vierailu' AS   selite_fi
		,'Kort vistelse' AS   selite_sv
		,'Short visit' AS   selite_en
		,'etl: p_lataa_d_suorat_liikkuvuuden_tyyppi' AS  source
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
	ALTER TABLE dw.d_suorat_liikkuvuudentyyppi ADD jarjestys_koodi AS  case when koodi = -1 THEN '99999' ELSE cast(koodi AS  varchar(10))
	END
END
