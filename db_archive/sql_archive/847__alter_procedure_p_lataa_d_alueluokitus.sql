USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_alueluokitus]    Script Date: 18.10.2017 10:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_alueluokitus] AS
if not exists (select * from dw.d_alueluokitus where id=-1) begin
  set identity_insert dw.d_alueluokitus on;
  insert into dw.d_alueluokitus (
    id,alueluokitus_avain,
    kunta_koodi,kunta_fi,kunta_sv,kunta_en,
    maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
    avi_koodi,avi_fi,avi_sv,avi_en,
    ely_koodi,ely_fi,ely_sv,ely_en,
    kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
    seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
    kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
    source
  )
  select
    -1,koodi,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta' and koodi='-1'
  ;
  set identity_insert dw.d_alueluokitus off;
end else begin
  update d
  set alueluokitus_avain=s.koodi,
  kunta_koodi=s.koodi, kunta_fi=s.nimi, kunta_sv=s.nimi_sv, kunta_en=s.nimi_en,
  maakunta_koodi=s.koodi, maakunta_fi=s.nimi, maakunta_sv=s.nimi_sv, maakunta_en=s.nimi_en,
  avi_koodi=s.koodi, avi_fi=s.nimi, avi_sv=s.nimi_sv, avi_en=s.nimi_en,
  ely_koodi=s.koodi, ely_fi=s.nimi, ely_sv=s.nimi_sv, ely_en=s.nimi_en,
  kielisuhde_koodi=s.koodi, kielisuhde_fi=s.nimi, kielisuhde_sv=s.nimi_sv, kielisuhde_en=s.nimi_en,
  seutukunta_koodi=s.koodi, seutukunta_fi=s.nimi, seutukunta_sv=s.nimi_sv, seutukunta_en=s.nimi_en,
  kuntaryhma_koodi=s.koodi, kuntaryhma_fi=s.nimi, kuntaryhma_sv=s.nimi_sv, kuntaryhma_en=s.nimi_en,
  source=s.source
  from dw.d_alueluokitus d
  join sa.sa_koodistot s on s.koodi=d.alueluokitus_avain
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end


MERGE dw.d_alueluokitus AS target
USING (
  SELECT DISTINCT
    'kunta_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    maakuntakoodi,
    COALESCE(maakuntanimi, maakuntanimi_sv, maakuntanimi_en) AS maakuntanimi,
    COALESCE(maakuntanimi_sv, maakuntanimi, maakuntanimi_en) AS maakuntanimi_sv,
    COALESCE(maakuntanimi_en, maakuntanimi, maakuntanimi_sv) AS maakuntanimi_en,
    avikoodi,
    COALESCE(avinimi, avinimi_sv, avinimi_en) AS avinimi,
    COALESCE(avinimi_sv, avinimi, avinimi_en) AS avinimi_sv,
    COALESCE(avinimi_en, avinimi, avinimi_sv) AS avinimi_en,
    elykoodi,
    COALESCE(elynimi, elynimi_sv, elynimi_en) AS elynimi,
    COALESCE(elynimi_sv, elynimi, elynimi_en) AS elynimi_sv,
    COALESCE(elynimi_en, elynimi, elynimi_sv) AS elynimi_en,
    kielisuhdekoodi,
    COALESCE(kielisuhdenimi, kielisuhdenimi_sv, kielisuhdenimi_en) AS kielisuhdenimi,
    COALESCE(kielisuhdenimi_sv, kielisuhdenimi, kielisuhdenimi_en) AS kielisuhdenimi_sv,
    COALESCE(kielisuhdenimi_en, kielisuhdenimi, kielisuhdenimi_sv) AS kielisuhdenimi_en,
    seutukuntakoodi,
    COALESCE(seutukuntanimi, seutukuntanimi_sv, seutukuntanimi_en) AS seutukuntanimi,
    COALESCE(seutukuntanimi_sv, seutukuntanimi, seutukuntanimi_en) AS seutukuntanimi_sv,
    COALESCE(seutukuntanimi_en, seutukuntanimi, seutukuntanimi_sv) AS seutukuntanimi_en,
    kuntaryhmakoodi,
    COALESCE(kuntaryhmanimi, kuntaryhmanimi_sv, kuntaryhmanimi_en) AS kuntaryhmanimi,
    COALESCE(kuntaryhmanimi_sv, kuntaryhmanimi, kuntaryhmanimi_en) AS kuntaryhmanimi_sv,
    COALESCE(kuntaryhmanimi_en, kuntaryhmanimi, kuntaryhmanimi_sv) AS kuntaryhmanimi_en,
    source
  FROM sa.sa_alueluokitus
) AS src
ON target.alueluokitus_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    kunta_fi=src.nimi, kunta_sv=src.nimi_sv, kunta_en=src.nimi_en,
    maakunta_koodi=src.maakuntakoodi, maakunta_fi=src.maakuntanimi, maakunta_sv=src.maakuntanimi_sv, maakunta_en=src.maakuntanimi_en,
    avi_koodi=src.avikoodi, avi_fi=src.avinimi, avi_sv=src.avinimi_sv, avi_en=src.avinimi_en,
    ely_koodi=src.elykoodi, ely_fi=src.elynimi, ely_sv=src.elynimi_sv, ely_en=src.elynimi_en,
    kielisuhde_koodi=src.kielisuhdekoodi, kielisuhde_fi=src.kielisuhdenimi, kielisuhde_sv=src.kielisuhdenimi_sv, kielisuhde_en=src.kielisuhdenimi_en,
    seutukunta_koodi=src.seutukuntakoodi, seutukunta_fi=src.seutukuntanimi, seutukunta_sv=src.seutukuntanimi_sv, seutukunta_en=src.seutukuntanimi_en,
    kuntaryhma_koodi=src.kuntaryhmakoodi, kuntaryhma_fi=src.kuntaryhmanimi, kuntaryhma_sv=src.kuntaryhmanimi_sv, kuntaryhma_en=src.kuntaryhmanimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    alueluokitus_avain,
    kunta_koodi,kunta_fi,kunta_sv,kunta_en,
    maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
    avi_koodi,avi_fi,avi_sv,avi_en,
    ely_koodi,ely_fi,ely_sv,ely_en,
    kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
    seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
    kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.maakuntakoodi, src.maakuntanimi, src.maakuntanimi_sv, src.maakuntanimi_en,
    src.avikoodi, src.avinimi, src.avinimi_sv, src.avinimi_en,
    src.elykoodi, src.elynimi, src.elynimi_sv, src.elynimi_en,
    src.kielisuhdekoodi, src.kielisuhdenimi, src.kielisuhdenimi_sv, src.kielisuhdenimi_en,
    src.seutukuntakoodi, src.seutukuntanimi, src.seutukuntanimi_sv, src.seutukuntanimi_en,
    src.kuntaryhmakoodi, src.kuntaryhmanimi, src.kuntaryhmanimi_sv, src.kuntaryhmanimi_en,
    src.source
  );
  GO
  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_aineistotyyppi' AND COLUMN_NAME='jarjestys_aineistotyyppi_koodi')

  BEGIN
  	ALTER TABLE dw.d_aineistotyyppi ADD jarjestys_aineistotyyppi_koodi AS case when aineistotyyppi_koodi = -1 then '99999' else cast(aineistotyyppi_koodi as varchar(10)) END
  END;
  GO
