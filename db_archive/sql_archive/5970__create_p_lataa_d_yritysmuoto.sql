USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_yritysmuoto]    Script Date: 1.3.2022 16.37.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create or alter PROCEDURE [dw].[p_lataa_d_yritysmuoto] AS
if not exists (select * from dw.d_yritysmuoto where id=-1) begin
  set identity_insert dw.d_yritysmuoto on;
  insert into dw.d_yritysmuoto (
    id,
    koodi,
    nimi_fi,
    nimi_sv,
    nimi_en,
	kuvaus_fi,
	kuvaus_sv,
	kuvaus_en,
    source
  )
  select
    -1,
    koodi,
	nimi,
	nimi_sv,
	nimi_en,
	nimi,
	nimi_sv,
	nimi_en,
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_yritysmuoto off;
end else begin
  update d
  set
    koodi=s.koodi,
    nimi_fi=s.nimi,
    nimi_sv=s.nimi_sv,
    nimi_en=s.nimi_en,
	kuvaus_fi=s.nimi,
    kuvaus_sv=s.nimi_sv,
    kuvaus_en=s.nimi_en,
	d.source=s.source
  from dw.d_yritysmuoto d
  join sa.sa_koodistot s on s.koodi=d.koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_yritysmuoto AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
	COALESCE(nimi, nimi_sv, nimi_en) AS kuvaus,
    COALESCE(nimi_sv, nimi, nimi_en) AS kuvaus_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS kuvaus_en,
    source
  FROM sa.sa_koodistot
  where koodisto='yritysmuoto'
) AS src
ON target.koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    nimi_fi = src.nimi,
    nimi_sv = src.nimi_sv,
    nimi_en = src.nimi_en,
	kuvaus_fi = src.nimi,
    kuvaus_sv = src.nimi_sv,
    kuvaus_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koodi,
    nimi_fi,
    nimi_sv,
    nimi_en,
	kuvaus_fi,
    kuvaus_sv,
    kuvaus_en,
    source
  )
  VALUES (
    src.koodi,
	src.nimi,
	src.nimi_sv,
	src.nimi_en,
	src.nimi,
	src.nimi_sv,
	src.nimi_en,
    src.source
  )
  ;							



