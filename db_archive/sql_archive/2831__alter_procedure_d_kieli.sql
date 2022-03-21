USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_kieli]    Script Date: 7.2.2020 15:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_kieli] AS
IF (
		SELECT count(1)
		FROM dw.d_kieli
		WHERE kieli_koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_kieli
	set identity_insert dw.d_kieli on
	INSERT dw.d_kieli (
		id
		,kieli_koodi
		,kieli_fi
		,kieli_sv
		,kieli_en
		,kieliryhma1_koodi
		,kieliryhma1_fi
		,kieliryhma1_sv
		,kieliryhma1_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_kieli'
		)
	set identity_insert dw.d_kieli off
END
MERGE dw.d_kieli AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
	CASE 
		WHEN koodi in ('FI','SE') THEN 1
		WHEN koodi = 'SV' THEN 2
		ELSE 3
	END 
	AS kieliryhma1_koodi,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'suomi (sis. saame)'
		WHEN koodi = 'SV' THEN 'ruotsi'
		ELSE 'muut kielet'
	END 
	AS kieliryhma1_fi,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'finska (inkl. samiska)'
		WHEN koodi = 'SV' THEN 'svenska'
		ELSE 'övriga språk'
	END 
	AS kieliryhma1_sv,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'Finnish (incl. Sámi)'
		WHEN koodi = 'SV' THEN 'Swedish'
		ELSE 'other languages'
	END 
	AS kieliryhma1_en,
    'ETL: p_lataa_d_kieli' AS source
  FROM sa.sa_koodistot
  where koodisto='kieli'

UNION

	SELECT
    kieli_avain,
    NULL AS nimi,
    NULL AS nimi_sv,
    NULL AS nimi_en,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 1
		WHEN kieli_avain = 'SV' THEN 2
		ELSE 3
	END 
	AS kieliryhma1_kieli_avain,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'suomi (sis. saame)'
		WHEN kieli_avain = 'SV' THEN 'ruotsi'
		ELSE 'muut kielet'
	END 
	AS kieliryhma1_fi,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'finska (inkl. samiska)'
		WHEN kieli_avain = 'SV' THEN 'svenska'
		ELSE 'övriga språk'
	END 
	AS kieliryhma1_sv,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'Finnish (incl. Sámi)'
		WHEN kieli_avain = 'SV' THEN 'Swedish'
		ELSE 'other languages'
	END 
	AS kieliryhma1_en,
    'ETL: p_lataa_d_kieli' AS source
	FROM sa.sa_hakukohde_kielet
	WHERE LEN(kieli_avain)>2

) AS src
ON target.kieli_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    kieli_fi = src.nimi,
    kieli_sv = src.nimi_sv,
    kieli_en = src.nimi_en,
	kieliryhma1_koodi = src.kieliryhma1_koodi,
	kieliryhma1_fi = src.kieliryhma1_fi,
	kieliryhma1_sv = src.kieliryhma1_sv,
	kieliryhma1_en = src.kieliryhma1_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    kieli_koodi,
    kieli_fi,
    kieli_sv,
    kieli_en,
	kieliryhma1_koodi,
	kieliryhma1_fi,
	kieliryhma1_sv,
	kieliryhma1_en,
    source
  )
  VALUES (
    src.koodi, 
	src.nimi, 
	src.nimi_sv, 
	src.nimi_en,
	src.kieliryhma1_koodi,
	src.kieliryhma1_fi,
	src.kieliryhma1_sv,
	src.kieliryhma1_en,
    src.source
  );
  --lisaa hakuraportoinnissa tarvittavat kielikombinaatiot
  UPDATE k
  SET 
  kieli_fi = k1.kieli_fi + ', ' + k2.kieli_fi + case when k3.kieli_fi is not null then ', ' + k3.kieli_fi else '' end,
  kieli_sv = k1.kieli_sv + ', ' + k2.kieli_sv + case when k3.kieli_sv is not null then ', ' + k3.kieli_sv else '' end,
  kieli_en = k1.kieli_en + ', ' + k2.kieli_en + case when k3.kieli_en is not null then ', ' + k3.kieli_en else '' end
  FROM dw.d_kieli k
  left join dw.d_kieli k1 on k1.kieli_koodi=LEFT(k.kieli_koodi,2)
  left join dw.d_kieli k2 on k2.kieli_koodi=SUBSTRING(k.kieli_koodi,3,2)
  left join dw.d_kieli k3 on k3.kieli_koodi=SUBSTRING(k.kieli_koodi,5,2)
  where k.kieli_fi is null
  

  IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kieli' AND COLUMN_NAME='jarjestys_kieliryhma1')

BEGIN
  ALTER TABLE dw.d_kieli ADD jarjestys_kieliryhma1 AS case when kieliryhma1_koodi = '-1' then 99999 else kieliryhma1_koodi END
END