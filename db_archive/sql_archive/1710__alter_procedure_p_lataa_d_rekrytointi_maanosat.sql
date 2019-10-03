USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_rekrytointi_maanosat]    Script Date: 4.7.2018 10.32.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dw].[p_lataa_d_rekrytointi_maanosat] AS
if not exists (select * from dw.d_rekrytointi_maanosat where id=-1) begin
  set identity_insert dw.d_rekrytointi_maanosat on;
  insert into dw.d_rekrytointi_maanosat (
	id,
    rekrytointi_maanosat_koodi,
    rekrytointi_maanosat_fi,
    rekrytointi_maanosat_sv,
    rekrytointi_maanosat_en,
  	maanosat0_koodi,
  	maanosat0_fi,
    maanosat0_sv,
    maanosat0_en,
  	maanosat_koodi,
  	maanosat_fi,
    maanosat_sv,
    maanosat_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_rekrytointi_maanosat off;
end else begin
  update d
  set
    rekrytointi_maanosat_koodi=s.koodi,
    rekrytointi_maanosat_fi=s.nimi,
    rekrytointi_maanosat_sv=s.nimi_sv,
    rekrytointi_maanosat_en=s.nimi_en,
  	maanosat0_koodi=s.koodi,
  	maanosat0_fi=s.nimi,
    maanosat0_sv=s.nimi_sv,
    maanosat0_en=s.nimi_en,
  	maanosat_koodi=s.koodi,
    maanosat_fi=s.nimi,
    maanosat_sv=s.nimi_sv,
    maanosat_en=s.nimi_en,
    source=s.source
  from dw.d_rekrytointi_maanosat d
  join sa.sa_koodistot s on s.koodi=d.rekrytointi_maanosat_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_rekrytointi_maanosat AS target
USING (
  SELECT DISTINCT
  	 s.koodi
  	,s.nimi
  	,s.nimi_sv
  	,s.nimi_en
  	,CASE WHEN s.koodi IN ('4') THEN 2  ELSE s2.maanosatkoodi  END AS maanosat0koodi
  	,CASE WHEN s.koodi IN ('4') THEN s.nimi ELSE s2.maanosatnimi END AS maanosat0nimi
  	,CASE WHEN s.koodi IN ('4') THEN s.nimi_sv ELSE s2.maanosatnimi_sv END AS maanosat0nimi_sv
  	,CASE WHEN s.koodi IN ('4') THEN s.nimi_sv ELSE s2.maanosatnimi_sv END AS maanosat0nimi_en
  	,CASE
  		WHEN s.koodi in ('1','5','6','7','8')
  			THEN s2.maanosatkoodi
  		WHEN s.koodi in ('2','3')
  			THEN s2.maanosat2koodi
  		ELSE   '-1'
  	 END
  	 AS maanosat2koodi
  	 ,CASE
  		WHEN s.koodi in ('1','5','6','7','8')
  			THEN s2.maanosatnimi
  		WHEN s.koodi in ('2','3')
  			THEN s2.maanosat2nimi
  		ELSE   'Tieto puuttuu'
  	 END
  	 AS maanosat2nimi
  	 ,CASE
  		WHEN s.koodi in ('1','5','6','7','8')
  			THEN s2.maanosatnimi_sv
  		WHEN s.koodi in ('2','3')
  			THEN s2.maanosat2nimi_sv
  		ELSE   'Information saknas'
  	 END
  	 AS maanosat2nimi_sv
  	 ,CASE
  		WHEN s.koodi in ('1','5','6','7','8')
  			THEN s2.maanosatnimi_en
  		WHEN s.koodi in ('2','3')
  			THEN s2.maanosat2nimi_en
  		ELSE   'Missing data'
  	 END
  	 AS maanosat2nimi_en
	,source=s.source
  FROM sa.sa_koodistot s
  	LEFT JOIN sa.sa_maaluokitus s2 ON   s2.maanosatkoodi =
  	CASE
  		WHEN s.koodi = '1'
  			THEN   '1'
  		WHEN s.koodi = '2'
  			THEN '2'
  		WHEN s.koodi = '3'
  			THEN '2'
  		WHEN s.koodi = '4'
  			THEN '2'
  		WHEN s.koodi = '5'
  			THEN '3'
  		WHEN s.koodi = '6'
  			THEN '4'
  		WHEN s.koodi = '7'
  			THEN '5'
  		WHEN s.koodi = '8'
  			THEN '6'
  		ELSE   '-1'
  	END
  	AND s.nimi =
  	CASE
  		WHEN s2.maanosatkoodi IN ('1','3','4','5','6')
  			THEN s2.maanosatnimi
  		WHEN s2.maanosatkoodi IN ('2')
  			THEN s2.maanosat2nimi
  		ELSE   '-1'
  	END

  WHERE koodisto = 'suoratrekrytointimaanosat'

) AS src
ON target.rekrytointi_maanosat_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    rekrytointi_maanosat_koodi = src.koodi,
    rekrytointi_maanosat_fi = src.nimi,
    rekrytointi_maanosat_sv = src.nimi_sv,
    rekrytointi_maanosat_en = src.nimi_en,
    maanosat0_koodi=src.maanosat0koodi,
	  maanosat0_fi=src.maanosat0nimi,
    maanosat0_sv=src.maanosat0nimi_sv,
    maanosat0_en=src.maanosat0nimi_en,
	  maanosat_koodi=src.maanosat2koodi,
    maanosat_fi=src.maanosat2nimi,
    maanosat_sv=src.maanosat2nimi_sv,
    maanosat_en=src.maanosat2nimi_en,
	  source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    rekrytointi_maanosat_koodi,
    rekrytointi_maanosat_fi,
    rekrytointi_maanosat_sv,
    rekrytointi_maanosat_en,
    maanosat0_koodi,
	  maanosat0_fi,
    maanosat0_sv,
    maanosat0_en,
	  maanosat_koodi,
    maanosat_fi,
    maanosat_sv,
    maanosat_en,
    source
  )
  VALUES (
    src.koodi,
    src.nimi,
    src.nimi_sv,
    src.nimi_en,
    src.maanosat0koodi,
	  src.maanosat0nimi,
    src.maanosat0nimi_sv,
	  src.maanosat0nimi_en,
	  src.maanosat2koodi,
    src.maanosat2nimi,
    src.maanosat2nimi_sv,
    src.maanosat2nimi_en,
    src.source
  );

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_rekrytointi_maanosat' AND COLUMN_NAME='jarjestys_rekrytointi_maanosat_koodi')

BEGIN
  ALTER TABLE dw.d_rekrytointi_maanosat ADD jarjestys_rekrytointi_maanosat_koodi AS case when rekrytointi_maanosat_koodi = -1 then '99999' else cast(rekrytointi_maanosat_koodi as varchar(10))
  END
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_rekrytointi_maanosat' AND COLUMN_NAME='jarjestys_maanosat0_koodi')

BEGIN
  ALTER TABLE dw.d_rekrytointi_maanosat ADD jarjestys_maanosat0_koodi AS case when maanosat0_koodi = -1 then '99999' else cast(maanosat0_koodi as varchar(10))
  END
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_rekrytointi_maanosat' AND COLUMN_NAME='jarjestys_maanosat_koodi')

BEGIN
  ALTER TABLE dw.d_rekrytointi_maanosat ADD jarjestys_maanosat_koodi AS case when maanosat_koodi = '-1' then '99999' else cast(maanosat_koodi as varchar(10))
  END
END
