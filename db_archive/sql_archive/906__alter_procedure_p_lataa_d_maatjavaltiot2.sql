ALTER PROCEDURE [dw].[p_lataa_d_maatjavaltiot2] AS

if not exists (select * from dw.d_maatjavaltiot2 where id=-1) begin
  set identity_insert dw.d_maatjavaltiot2 on;
  insert into dw.d_maatjavaltiot2 (
    id,
    maatjavaltiot2_koodi,maatjavaltiot2_fi,maatjavaltiot2_sv,maatjavaltiot2_en,
    maanosa_koodi,maanosa_fi,maanosa_sv,maanosa_en,
    maanosa2_koodi,maanosa2_fi,maanosa2_sv,maanosa2_en,
    maanosa3_koodi,maanosa3_fi,maanosa3_sv,maanosa3_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en, --maa
    koodi,nimi,nimi_sv,nimi_en, --maanosa
    koodi,nimi,nimi_sv,nimi_en, --maanosa2
    koodi,nimi,nimi_sv,nimi_en, --maanosa3
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_maatjavaltiot2 off;
end else begin
  update d
  set
    maatjavaltiot2_koodi=s.koodi,maatjavaltiot2_fi=s.nimi,maatjavaltiot2_sv=s.nimi_sv,maatjavaltiot2_en=s.nimi_en,
    maanosa_koodi=s.koodi,maanosa_fi=s.nimi,maanosa_sv=s.nimi_sv,maanosa_en=s.nimi_en,
    maanosa2_koodi=s.koodi,maanosa2_fi=s.nimi,maanosa2_sv=s.nimi_sv,maanosa2_en=s.nimi_en,
    maanosa3_koodi=s.koodi,maanosa3_fi=s.nimi,maanosa3_sv=s.nimi_sv,maanosa3_en=s.nimi_en,
    d.source=s.source
  from dw.d_maatjavaltiot2 d
  join sa.sa_koodistot s on s.koodi=d.maatjavaltiot2_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_maatjavaltiot2 AS target
USING (
  SELECT
    s.koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv) AS nimi_en,
    -- CSCVIPUNEN-518: alter amerikas
    case when maanosatkoodi='2' then coalesce(maanosat2koodi,m.koodi)
    else coalesce(maanosatkoodi,m.koodi)
    end as maanosatkoodi,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi, maanosat2nimi_sv, maanosat2nimi_en),m.nimi)
    else coalesce(COALESCE(maanosatnimi, maanosatnimi_sv, maanosatnimi_en),m.nimi)
    end AS maanosatnimi,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi_sv, maanosat2nimi, maanosat2nimi_en),m.nimi_sv)
    else coalesce(COALESCE(maanosatnimi_sv, maanosatnimi, maanosatnimi_en),m.nimi_sv)
    end AS maanosatnimi_sv,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi_en, maanosat2nimi, maanosat2nimi_sv),m.nimi_en)
    else coalesce(COALESCE(maanosatnimi_en, maanosatnimi, maanosatnimi_sv),m.nimi_en)
    end AS maanosatnimi_en,

    coalesce(maanosat2koodi,m.koodi) as maanosat2koodi,
    coalesce(COALESCE(maanosat2nimi, maanosat2nimi_sv, maanosat2nimi_en),m.nimi) AS maanosat2nimi,
    coalesce(COALESCE(maanosat2nimi_sv, maanosat2nimi, maanosat2nimi_en),m.nimi_sv) AS maanosat2nimi_sv,
    coalesce(COALESCE(maanosat2nimi_en, maanosat2nimi, maanosat2nimi_sv),m.nimi_en) AS maanosat2nimi_en,
    coalesce(maanosat3koodi,m.koodi) as maanosat3koodi,
    coalesce(COALESCE(maanosat3nimi, maanosat3nimi_sv, maanosat3nimi_en),m.nimi) AS maanosat3nimi,
    coalesce(COALESCE(maanosat3nimi_sv, maanosat3nimi, maanosat3nimi_en),m.nimi_sv) AS maanosat3nimi_sv,
    coalesce(COALESCE(maanosat3nimi_en, maanosat3nimi, maanosat3nimi_sv),m.nimi_en) AS maanosat3nimi_en,
    s.source
  FROM sa.sa_maaluokitus s
  left join sa.sa_koodistot m on m.koodisto='vipunenmeta' and m.koodi='-1'
) AS src
ON target.maatjavaltiot2_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    maatjavaltiot2_fi=src.nimi,maatjavaltiot2_sv=src.nimi_sv,maatjavaltiot2_en=src.nimi_en,
    maanosa_koodi=src.maanosatkoodi,maanosa_fi=src.maanosatnimi,maanosa_sv=src.maanosatnimi_sv,maanosa_en=src.maanosatnimi_en,
    maanosa2_koodi=src.maanosat2koodi,maanosa2_fi=src.maanosat2nimi,maanosa2_sv=src.maanosat2nimi_sv,maanosa2_en=src.maanosat2nimi_en,
    maanosa3_koodi=src.maanosat3koodi,maanosa3_fi=src.maanosat3nimi,maanosa3_sv=src.maanosat3nimi_sv,maanosa3_en=src.maanosat3nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    maatjavaltiot2_koodi,maatjavaltiot2_fi,maatjavaltiot2_sv,maatjavaltiot2_en,
    maanosa_koodi,maanosa_fi,maanosa_sv,maanosa_en,
    maanosa2_koodi,maanosa2_fi,maanosa2_sv,maanosa2_en,
    maanosa3_koodi,maanosa3_fi,maanosa3_sv,maanosa3_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.maanosatkoodi,src.maanosatnimi,src.maanosatnimi_sv,src.maanosatnimi_en,
    src.maanosat2koodi,src.maanosat2nimi,src.maanosat2nimi_sv,src.maanosat2nimi_en,
    src.maanosat3koodi,src.maanosat3nimi,src.maanosat3nimi_sv,src.maanosat3nimi_en,
    src.source
  );
  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa_koodi AS case when maanosa_koodi = '-1' then 'ZZZZZ' else cast(maanosa_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa2_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa2_koodi AS case when maanosa2_koodi = '-1' then 'ZZZZZ' else cast(maanosa2_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa3_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa3_koodi AS case when maanosa3_koodi = '-1' then 'ZZZZZ' else cast(maanosa3_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maatjavaltiot2_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maatjavaltiot2_koodi AS case when maatjavaltiot2_koodi = '-1' then 'ZZZZZ' else cast(maatjavaltiot2_koodi as varchar(10))
    END
  END
