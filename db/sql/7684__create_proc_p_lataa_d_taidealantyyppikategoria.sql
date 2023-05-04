USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_taidealantyyppikategoria]    Script Date: 4.5.2023 10:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_taidealantyyppikategoria] AS

if not exists (select * from dw.d_taidealantyyppikategoria where id=-1) begin
  set identity_insert dw.d_taidealantyyppikategoria on;
  insert into dw.d_taidealantyyppikategoria (
    id,
    taidealantyyppikategoria_koodi,
    taidealantyyppikategoria_nimi_fi,
    taidealantyyppikategoria_nimi_sv,
    taidealantyyppikategoria_nimi_en,
	jarjestys_taidealantyyppikategoria_koodi,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
	999,
    'ETL: p_lataa_d_taidealantyyppikategoria'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_taidealantyyppikategoria off;
end else begin
  update d
  set taidealantyyppikategoria_koodi=s.koodi,
  taidealantyyppikategoria_nimi_fi=s.nimi,
  taidealantyyppikategoria_nimi_sv=s.nimi_sv,
  taidealantyyppikategoria_nimi_en=s.nimi_en,
  jarjestys_taidealantyyppikategoria_koodi=s.koodi,
  source='ETL: p_lataa_d_taidealantyyppikategoria'
  from dw.d_taidealantyyppikategoria d
  join sa.sa_koodistot s on s.koodi=d.taidealantyyppikategoria_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_taidealantyyppikategoria AS target
USING (
  SELECT
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
	koodi as jarjestys,
    'ETL: p_lataa_d_taidealantyyppikategoria' AS source
  FROM sa.sa_koodistot_suomi_fi
  where koodisto='TaidejulkaisuTyyppikategoria'
) AS src
ON target.taidealantyyppikategoria_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    taidealantyyppikategoria_nimi_fi = src.nimi,
    taidealantyyppikategoria_nimi_sv = src.nimi_sv,
    taidealantyyppikategoria_nimi_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    taidealantyyppikategoria_koodi,
    taidealantyyppikategoria_nimi_fi,
    taidealantyyppikategoria_nimi_sv,
    taidealantyyppikategoria_nimi_en,
	jarjestys_taidealantyyppikategoria_koodi,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.jarjestys,
    src.source
  );

GO

USE [ANTERO]