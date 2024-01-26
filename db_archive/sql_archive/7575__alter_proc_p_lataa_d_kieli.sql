USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_kieli]    Script Date: 11.4.2023 9:58:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_kieli] AS

IF NOT EXISTS (SELECT * FROM dw.d_kieli WHERE kieli_koodi = '-1')
BEGIN
	SET IDENTITY_INSERT dw.d_kieli ON
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
		,kieliryhma2_koodi
		,kieliryhma2_fi
		,kieliryhma2_sv
		,kieliryhma2_en
		,source
		)
	select
		id = -1
		,kieli_koodi = s.koodi
		,kieli_fi = lower(s.nimi)
		,kieli_sv = lower(s.nimi_sv)
		,kieli_en = lower(s.nimi_en)
		,kieliryhma1_koodi = s.koodi
		,kieliryhma1_fi = lower(s.nimi)
		,kieliryhma1_sv = lower(s.nimi_sv)
		,kieliryhma1_en = lower(s.nimi_en)
		,kieliryhma2_koodi = s.koodi
		,kieliryhma2_fi = lower(s.nimi)
		,kieliryhma2_sv = lower(s.nimi_sv)
		,kieliryhma2_en = lower(s.nimi_en)
		,source = 'etl: p_lataa_d_kieli'
	from sa.sa_koodistot s
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
	SET IDENTITY_INSERT dw.d_kieli OFF
END
ELSE BEGIN
	update d
	set 
		kieli_koodi = s.koodi
		,kieli_fi = lower(s.nimi)
		,kieli_sv = lower(s.nimi_sv)
		,kieli_en = lower(s.nimi_en)
		,kieliryhma1_koodi = s.koodi
		,kieliryhma1_fi = lower(s.nimi)
		,kieliryhma1_sv = lower(s.nimi_sv)
		,kieliryhma1_en = lower(s.nimi_en)
		,kieliryhma2_koodi = s.koodi
		,kieliryhma2_fi = lower(s.nimi)
		,kieliryhma2_sv = lower(s.nimi_sv)
		,kieliryhma2_en = lower(s.nimi_en)
		,source = 'ETL: p_lataa_d_kieli'
	from dw.d_kieli d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
END

IF NOT EXISTS (SELECT * FROM dw.d_kieli WHERE kieli_koodi = '-2')
BEGIN
	SET IDENTITY_INSERT dw.d_kieli ON
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
		,kieliryhma2_koodi
		,kieliryhma2_fi
		,kieliryhma2_sv
		,kieliryhma2_en
		,source
	)
	VALUES (
		N'-2'
		,N'-2'
		,N'ei luvanmukainen suorituskieli'
		,N'sv*ei luvanmukainen suorituskieli'
		,N'en*ei luvanmukainen suorituskieli'
		,N'-2'
		,N'ei luvanmukainen suorituskieli'
		,N'sv*ei luvanmukainen suorituskieli'
		,N'en*ei luvanmukainen suorituskieli'
		,N'-2'
		,N'ei luvanmukainen suorituskieli'
		,N'sv*ei luvanmukainen suorituskieli'
		,N'en*ei luvanmukainen suorituskieli'
		,N'ETL: p_lataa_d_kieli'
	)
	SET IDENTITY_INSERT dw.d_kieli OFF
END
ELSE BEGIN
	update d
	set 
		kieli_koodi = '-2'
		,kieli_fi = 'ei luvanmukainen suorituskieli'
		,kieli_sv = 'sv*ei luvanmukainen suorituskieli'
		,kieli_en = 'en*ei luvanmukainen suorituskieli'
		,kieliryhma1_koodi = '-2'
		,kieliryhma1_fi = 'ei luvanmukainen suorituskieli'
		,kieliryhma1_sv = 'sv*ei luvanmukainen suorituskieli'
		,kieliryhma1_en = 'en*ei luvanmukainen suorituskieli'
		,kieliryhma2_koodi = '-2'
		,kieliryhma2_fi = 'ei luvanmukainen suorituskieli'
		,kieliryhma2_sv = 'sv*ei luvanmukainen suorituskieli'
		,kieliryhma2_en = 'en*ei luvanmukainen suorituskieli'
		,source = 'ETL: p_lataa_d_kieli'
	from dw.d_kieli d
	where id = '-2'
END


MERGE dw.d_kieli AS target
USING (
	SELECT
		koodi,
		COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
		COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
		COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,kieliryhma1_koodi =
			CASE 
				WHEN koodi in ('FI','SE') THEN 1
				WHEN koodi = 'SV' THEN 2
				ELSE 3
			END
		,kieliryhma1_fi = 
			CASE 
				WHEN koodi in ('FI','SE') THEN 'suomi (sis. saame)'
				WHEN koodi = 'SV' THEN 'ruotsi'
				ELSE 'muut kielet'
			END 
		,kieliryhma1_sv =
			CASE 
				WHEN koodi in ('FI','SE') THEN 'finska (inkl. samiska)'
				WHEN koodi = 'SV' THEN 'svenska'
				ELSE 'övriga språk'
			END 
		,kieliryhma1_en =
			CASE 
				WHEN koodi in ('FI','SE') THEN 'Finnish (incl. Sámi)'
				WHEN koodi = 'SV' THEN 'Swedish'
				ELSE 'other languages'
			END 
		,kieliryhma2_koodi =
			CASE 
				WHEN koodi = 'FI' THEN 1
				WHEN koodi = 'SV' THEN 2
				WHEN koodi = 'SE' THEN 3
				ELSE 4
			END
		,kieliryhma2_fi = 
			CASE 
				WHEN koodi = 'FI' THEN 'suomi'
				WHEN koodi = 'SV' THEN 'ruotsi'
				WHEN koodi = 'SE' THEN 'saame'
				ELSE 'muut kielet'
			END 
		,kieliryhma2_sv =
			CASE 
				WHEN koodi = 'FI' THEN 'finska'
				WHEN koodi = 'SV' THEN 'svenska'
				WHEN koodi = 'SE' THEN 'samiska'
				ELSE 'övriga språk'
			END 
		,kieliryhma2_en =
			CASE 
				WHEN koodi = 'FI' THEN 'Finnish'
				WHEN koodi = 'SV' THEN 'Swedish'
				WHEN koodi = 'SE' THEN 'Sámi'
				ELSE 'other languages'
			END 
		,'ETL: p_lataa_d_kieli' AS source
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
	CASE 
		WHEN kieli_avain = 'FI' THEN 1
		WHEN kieli_avain = 'SV' THEN 2
		WHEN kieli_avain = 'SE' THEN 3
		ELSE 4
	END 
	AS kieliryhma2_kieli_avain,
	CASE 
		WHEN kieli_avain = 'FI' THEN 'suomi'
		WHEN kieli_avain = 'SV' THEN 'ruotsi'
		WHEN kieli_avain = 'SE' THEN 'saame'
		ELSE 'muut kielet'
	END 
	AS kieliryhma2_fi,
	CASE 
		WHEN kieli_avain = 'FI' THEN 'finska'
		WHEN kieli_avain = 'SV' THEN 'svenska'
		WHEN kieli_avain = 'SE' THEN 'samiska'
		ELSE 'övriga språk'
	END 
	AS kieliryhma2_sv,
	CASE 
		WHEN kieli_avain = 'FI' THEN 'Finnish'
		WHEN kieli_avain = 'SV' THEN 'Swedish'
		WHEN kieli_avain = 'SE' THEN 'Sámi'
		ELSE 'other languages'
	END 
	AS kieliryhma2_en,
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
	kieliryhma2_koodi = src.kieliryhma2_koodi,
	kieliryhma2_fi = src.kieliryhma2_fi,
	kieliryhma2_sv = src.kieliryhma2_sv,
	kieliryhma2_en = src.kieliryhma2_en,
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
	kieliryhma2_koodi,
	kieliryhma2_fi,
	kieliryhma2_sv,
	kieliryhma2_en,
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
	src.kieliryhma2_koodi,
	src.kieliryhma2_fi,
	src.kieliryhma2_sv,
	src.kieliryhma2_en,
    src.source
  );

  --pohjoissaamen tuunaus ennen johdettuja tietoja
  UPDATE k
  SET 
    kieli_fi = 'saame', 
	kieli_en = 'Sámi'
  FROM dw.d_kieli k
  where kieli_koodi = 'SE'

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

  --lisaa Koski-raportoinnissa kaytetyt suorituskielet; tarvittaessa vaihda alle kaatoluokan selitteet ja irrota yleissivistavasta esi- ja perusopetus
  UPDATE k
  SET 
    k.suorituskieli_yleissivistava_fi = case when kieli_koodi in ('-1', 'EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK') then k.kieli_fi else ca.kieli_fi end,
    k.suorituskieli_yleissivistava_sv = case when kieli_koodi in ('-1', 'EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK') then k.kieli_sv else ca.kieli_sv end,
	k.suorituskieli_yleissivistava_en = case when kieli_koodi in ('-1', 'EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK') then k.kieli_en else ca.kieli_en end,
	k.suorituskieli_ammatillinen_fi = case when kieli_koodi in ('-1', 'EN', 'RI', 'SV', 'SE', 'FI', 'RU', 'VK') then k.kieli_fi else ca.kieli_fi end,
    k.suorituskieli_ammatillinen_sv = case when kieli_koodi in ('-1', 'EN', 'RI', 'SV', 'SE', 'FI', 'RU', 'VK') then k.kieli_sv else ca.kieli_sv end,
	k.suorituskieli_ammatillinen_en = case when kieli_koodi in ('-1', 'EN', 'RI', 'SV', 'SE', 'FI', 'RU', 'VK') then k.kieli_en else ca.kieli_en end
  FROM dw.d_kieli k
  CROSS APPLY (select top 1 kieli_fi, kieli_sv, kieli_en from dw.d_kieli where kieli_koodi = 'XX') ca

  --
  IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kieli' AND COLUMN_NAME='jarjestys_kieliryhma1')

  BEGIN
    ALTER TABLE dw.d_kieli ADD jarjestys_kieliryhma1 AS case when kieliryhma1_koodi = '-1' then 99999 else kieliryhma1_koodi END
  END
  IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kieli' AND COLUMN_NAME='jarjestys_kieliryhma2')

  BEGIN
    ALTER TABLE dw.d_kieli ADD jarjestys_kieliryhma2 AS case when kieliryhma2_koodi = '-1' then 99999 else kieliryhma2_koodi END
  END

GO

USE [ANTERO]