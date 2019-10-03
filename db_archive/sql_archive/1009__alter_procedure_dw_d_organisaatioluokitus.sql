USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 9.11.2017 14:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_organisaatioluokitus] AS
if not exists (select * from dw.d_organisaatioluokitus where id=-1) begin
  set identity_insert dw.d_organisaatioluokitus on;
  insert into dw.d_organisaatioluokitus (
    id,
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    oppilaitoksenopetuskieli_koodi,oppilaitoksenopetuskieli_fi,oppilaitoksenopetuskieli_sv,oppilaitoksenopetuskieli_en,
    organisaatio_oid,liitosorganisaatio_oid,ylaorganisaatio_oid,
    kunta_koodi,osoitetyyppi,katuosoite,postinumero,postitoimipaikka,
    latitude,longitude,
    source
  )
  select
    -1,
    koodi, --avain
    koodi,nimi,nimi_sv,nimi_en, --organisaatio
    koodi,nimi,nimi_sv,nimi_en, --oppilaitostyyppi
    koodi,nimi,nimi_sv,nimi_en, --oppilaitoksenopetuskieli
    koodi,koodi,koodi, --oid
    koodi,koodi,koodi,koodi,koodi, --address
    cast(koodi as float),cast(koodi as float), --coordinate
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_organisaatioluokitus off;
end else begin
  update d
  set organisaatio_avain=s.koodi,
  organisaatio_koodi=s.koodi,organisaatio_fi=s.nimi,organisaatio_sv=s.nimi_sv,organisaatio_en=s.nimi_en,
  oppilaitostyyppi_koodi=s.koodi,oppilaitostyyppi_fi=s.nimi,oppilaitostyyppi_sv=s.nimi_sv,oppilaitostyyppi_en=s.nimi_en,
  oppilaitoksenopetuskieli_koodi=s.koodi,oppilaitoksenopetuskieli_fi=s.nimi,oppilaitoksenopetuskieli_sv=s.nimi_sv,oppilaitoksenopetuskieli_en=s.nimi_en,
  organisaatio_oid=s.koodi,liitosorganisaatio_oid=s.koodi,ylaorganisaatio_oid=s.koodi,
  kunta_koodi=s.koodi,osoitetyyppi=s.koodi,katuosoite=s.koodi,postinumero=s.koodi,postitoimipaikka=s.koodi,
  latitude=cast(s.koodi as float),longitude=cast(s.koodi as float),
  source=s.source
  from dw.d_organisaatioluokitus d
  join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end
MERGE dw.d_organisaatioluokitus AS target
USING (

  SELECT 
    lower(s.tyyppi)+'_'+s.koodi AS avain,
    coalesce(s.koodi, t.koodi) as koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    coalesce(ot.koodi, t.koodi) as oppilaitostyyppikoodi,
    COALESCE(ot.nimi, ot.nimi_sv, ot.nimi_en, t.nimi) AS oppilaitostyyppinimi,
    COALESCE(ot.nimi_sv, ot.nimi, ot.nimi_en, t.nimi_sv) AS oppilaitostyyppinimi_sv,
    COALESCE(ot.nimi_en, ot.nimi, ot.nimi_sv, t.nimi_en) AS oppilaitostyyppinimi_en,
    --additional features
    --oppilaitoksenopetuskieli
    coalesce(ok.koodi, t.koodi) as oppilaitoksenopetuskielikoodi,
    COALESCE(ok.nimi, ok.nimi_sv, ok.nimi_en, t.nimi) AS oppilaitoksenopetuskielinimi,
    COALESCE(ok.nimi_sv, ok.nimi, ok.nimi_en, t.nimi_sv) AS oppilaitoksenopetuskielinimi_sv,
    COALESCE(ok.nimi_en, ok.nimi, ok.nimi_sv, t.nimi_en) AS oppilaitoksenopetuskielinimi_en,
    s.oid as organisaatio_oid,
    s.liitosoid as liitosorganisaatio_oid,
    s.parentoid as ylaorganisaatio_oid,
    s.kotikunta as kunta_koodi,
    s.osoitetyyppi,s.osoite as katuosoite,s.postinumero,s.postitoimipaikka,
    cast(s.latitude as float) as latitude,cast(s.longitude as float) as longitude,
    s.source
  FROM sa.sa_organisaatioluokitus s
  left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=s.oppilaitostyyppi
  left join sa.sa_koodistot ok on ok.koodisto='oppilaitoksenopetuskieli' and ok.koodi=s.oppilaitoksenopetuskieli
  cross join sa.sa_koodistot t
  where 1=1
  and t.koodisto='vipunenmeta' and t.koodi='-1'
  -- data has some sort of duplicates. TODO fix this:
  and s.koodi NOT in (
    select koodi from sa.sa_organisaatioluokitus
    group by tyyppi,koodi having count(*)>1
  )

  UNION --duplikaatit

      SELECT 
    lower(s.tyyppi)+'_'+s.koodi+'_'+cast(rnk.nro as nvarchar) AS avain,
    coalesce(s.koodi, t.koodi) as koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    coalesce(ot.koodi, t.koodi) as oppilaitostyyppikoodi,
    COALESCE(ot.nimi, ot.nimi_sv, ot.nimi_en, t.nimi) AS oppilaitostyyppinimi,
    COALESCE(ot.nimi_sv, ot.nimi, ot.nimi_en, t.nimi_sv) AS oppilaitostyyppinimi_sv,
    COALESCE(ot.nimi_en, ot.nimi, ot.nimi_sv, t.nimi_en) AS oppilaitostyyppinimi_en,
    --additional features
    --oppilaitoksenopetuskieli
    coalesce(ok.koodi, t.koodi) as oppilaitoksenopetuskielikoodi,
    COALESCE(ok.nimi, ok.nimi_sv, ok.nimi_en, t.nimi) AS oppilaitoksenopetuskielinimi,
    COALESCE(ok.nimi_sv, ok.nimi, ok.nimi_en, t.nimi_sv) AS oppilaitoksenopetuskielinimi_sv,
    COALESCE(ok.nimi_en, ok.nimi, ok.nimi_sv, t.nimi_en) AS oppilaitoksenopetuskielinimi_en,
    s.oid as organisaatio_oid,
    s.liitosoid as liitosorganisaatio_oid,
    s.parentoid as ylaorganisaatio_oid,
    s.kotikunta as kunta_koodi,
    s.osoitetyyppi,s.osoite as katuosoite,s.postinumero,s.postitoimipaikka,
    cast(s.latitude as float) as latitude,cast(s.longitude as float) as longitude,
    s.source
  FROM sa.sa_organisaatioluokitus s
  left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=s.oppilaitostyyppi
  left join sa.sa_koodistot ok on ok.koodisto='oppilaitoksenopetuskieli' and ok.koodi=s.oppilaitoksenopetuskieli
  cross join sa.sa_koodistot t
  --row numbers to each duplicate group
  inner join (select koodi,oid,ROW_NUMBER()OVER(PARTITION BY koodi ORDER BY koodi) as nro from sa.sa_organisaatioluokitus group by koodi,oid) as rnk on rnk.koodi=s.koodi and rnk.oid=s.oid
  where 1=1
  and t.koodisto='vipunenmeta' and t.koodi='-1'
  and s.koodi in (
    select koodi from sa.sa_organisaatioluokitus
    group by tyyppi,koodi having count(*)>1
  )



  UNION -- tutkimusorganisaatio

  SELECT
    lower(s.koodisto)+'_'+s.koodi AS avain,
    coalesce(s.koodi, t.koodi) as koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    t.koodi as oppilaitostyyppikoodi, t.nimi as oppilaitostyyppinimi, t.nimi_sv as oppilaitostyyppinimi_sv, t.nimi_en as oppilaitostyyppinimi_en,
    --lisäominaisuudet
    t.koodi as oppilaitoksenopetuskielikoodi, t.nimi as oppilaitoksenopetuskielinimi, t.nimi_sv as oppilaitoksenopetuskielinimi_sv, t.nimi_en as oppilaitoksenopetuskielinimi_en,
    t.koodi as organisaatio_oid, t.koodi as liitosorganisaatio_oid, t.koodi as ylaorganisaatio_oid,
    t.koodi as kunta_koodi, t.koodi as osoitetyyppi,t.koodi as katuosoite,t.koodi as postinumero,t.koodi as postitoimipaikka,
    cast(t.koodi as float) as latitude,cast(t.koodi as float) as longitude,
    s.source
  FROM sa.sa_koodistot s
  --left join sa.sa_oppilaitosluokitus l on l.koodi=s.koodi and s.koodisto='oppilaitosnumero'
  --left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=l.oppilaitostyyppikoodi
  cross join sa.sa_koodistot t
  where s.koodisto in ('tutkimusorganisaatio')
  and t.koodisto='vipunenmeta' and t.koodi='-1'

) AS src
ON target.organisaatio_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    -- could also update koodi but it should not be different from avain
    organisaatio_fi = src.nimi,
    organisaatio_sv = src.nimi_sv,
    organisaatio_en = src.nimi_en,
    oppilaitostyyppi_koodi = src.oppilaitostyyppikoodi,
    oppilaitostyyppi_fi = src.oppilaitostyyppinimi,
    oppilaitostyyppi_sv = src.oppilaitostyyppinimi_sv,
    oppilaitostyyppi_en = src.oppilaitostyyppinimi_en,
    oppilaitoksenopetuskieli_koodi = src.oppilaitoksenopetuskielikoodi,
    oppilaitoksenopetuskieli_fi = src.oppilaitoksenopetuskielinimi,
    oppilaitoksenopetuskieli_sv = src.oppilaitoksenopetuskielinimi_sv,
    oppilaitoksenopetuskieli_en = src.oppilaitoksenopetuskielinimi_en,
    organisaatio_oid = src.organisaatio_oid,
    liitosorganisaatio_oid = src.liitosorganisaatio_oid,
    ylaorganisaatio_oid = src.ylaorganisaatio_oid,
    kunta_koodi = src.kunta_koodi,
    osoitetyyppi = src.osoitetyyppi,
    katuosoite = src.katuosoite,
    postinumero = src.postinumero,
    postitoimipaikka = src.postitoimipaikka,
    latitude = src.latitude,
    longitude = src.longitude,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    oppilaitoksenopetuskieli_koodi,oppilaitoksenopetuskieli_fi,oppilaitoksenopetuskieli_sv,oppilaitoksenopetuskieli_en,
    organisaatio_oid,liitosorganisaatio_oid,ylaorganisaatio_oid,
    kunta_koodi,osoitetyyppi,katuosoite,postinumero,postitoimipaikka,
    latitude,longitude,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.oppilaitostyyppikoodi, src.oppilaitostyyppinimi, src.oppilaitostyyppinimi_sv, src.oppilaitostyyppinimi_en,
    src.oppilaitoksenopetuskielikoodi,src.oppilaitoksenopetuskielinimi,src.oppilaitoksenopetuskielinimi_sv,src.oppilaitoksenopetuskielinimi_en,
    src.organisaatio_oid,src.liitosorganisaatio_oid,src.ylaorganisaatio_oid,
    src.kunta_koodi,src.osoitetyyppi,src.katuosoite,src.postinumero,src.postitoimipaikka,
    src.latitude,src.longitude,
    src.source
  );

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatioluokitus' AND COLUMN_NAME='jarjestys_kunta_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatioluokitus ADD jarjestys_kunta_koodi AS case when kunta_koodi = '-1' then '99999' else cast(kunta_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatioluokitus' AND COLUMN_NAME='jarjestys_oppilaitoksenopetuskieli_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatioluokitus ADD jarjestys_oppilaitoksenopetuskieli_koodi AS case when oppilaitoksenopetuskieli_koodi = '-1' then '99999' else cast(oppilaitoksenopetuskieli_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatioluokitus' AND COLUMN_NAME='jarjestys_oppilaitostyyppi_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatioluokitus ADD jarjestys_oppilaitostyyppi_koodi AS case when oppilaitostyyppi_koodi = '-1' then '99999' else cast(oppilaitostyyppi_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatioluokitus' AND COLUMN_NAME='jarjestys_organisaatio_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatioluokitus ADD jarjestys_organisaatio_koodi AS case when organisaatio_koodi = '-1' then '99999' else cast(organisaatio_koodi as varchar(10))
  END
END
