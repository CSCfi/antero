USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_julkaisun_tekijan_rooli]    Script Date: 4.5.2023 10:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_julkaisun_tekijan_rooli] AS

if not exists (select * from dw.d_julkaisun_tekijan_rooli where id=-1) begin
  set identity_insert dw.d_julkaisun_tekijan_rooli on;
  insert into dw.d_julkaisun_tekijan_rooli (
    id,
    rooli_koodi,
    rooli_fi,
    rooli_sv,
    rooli_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_julkaisun_tekijan_rooli'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_julkaisun_tekijan_rooli off;
end else begin
  update d
  set rooli_koodi=s.koodi,
  rooli_fi=s.nimi,
  rooli_sv=s.nimi_sv,
  rooli_en=s.nimi_en,
  source='ETL: p_lataa_d_julkaisun_tekijan_rooli'
  from dw.d_julkaisun_tekijan_rooli d
  join sa.sa_koodistot s on s.koodi=d.rooli_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_julkaisun_tekijan_rooli AS target
USING (
  SELECT
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
	koodi as jarjestys,
    'ETL: p_lataa_d_julkaisun_tekijan_rooli' AS source
  FROM sa.sa_koodistot_suomi_fi
  where koodisto='TaidejulkaisuRooli'
) AS src
ON target.rooli_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    rooli_fi = src.nimi,
    rooli_sv = src.nimi_sv,
    rooli_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    rooli_koodi,
    rooli_fi,
    rooli_sv,
    rooli_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en, 
    src.source
  );

GO


USE [ANTERO]