USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_valintatapajono]    Script Date: 13.8.2024 13:07:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_valintatapajono] AS

if not exists (select * from dw.d_valintatapajono where id=-1) begin
  set identity_insert dw.d_valintatapajono on;
  insert into dw.d_valintatapajono (
    id,
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
	jarjestys,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
	'öö',
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_valintatapajono off;
end else begin
  update d
  set
    koodi=s.koodi,
    selite_fi=s.nimi,
    selite_sv=s.nimi_sv,
    selite_en=s.nimi_en,
	jarjestys='öö',
    d.source=s.source
  from dw.d_valintatapajono d
  join sa.sa_koodistot s on s.koodi=d.koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

if not exists (select * from dw.d_valintatapajono where koodi='jh') begin
  insert into dw.d_valintatapajono (
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
	jarjestys,
    source
  )
  select
	'jh' as koodi, 
	'Jatkuva haku' as selite_fi, 
	'Kontinuerlig ansökan', 
	'Rolling admisson',
	'jh' as jarjestys,
    'manuaalinen' as source
end

MERGE dw.d_valintatapajono AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
	jarjestys = koodi,
    source
  FROM sa.sa_koodistot
  where koodisto='valintatapajono'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED THEN
  UPDATE SET
    selite_fi = src.nimi,
    selite_sv = src.nimi_sv,
    selite_en = src.nimi_en,
	jarjestys = src.koodi,
    target.source = src.source

WHEN NOT MATCHED THEN
  INSERT (
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
	jarjestys,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.jarjestys,
    src.source
  )
  ;
  

GO
