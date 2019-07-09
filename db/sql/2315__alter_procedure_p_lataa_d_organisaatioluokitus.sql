USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 5.7.2019 12:04:48 ******/
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
    source, organisaatio_nykyinen_koodi,organisaatio_vanha_fi,organisaatio_vanha_sv,organisaatio_vanha_en,
	alkupvm,loppupvm, koulutuksen_jarjestajan_yritysmuoto
  )
  select
    -1,
    koodi, --avain
    koodi,nimi,nimi_sv,nimi_en, --organisaatio
    koodi,nimi,nimi_sv,nimi_en, --oppilaitostyyppi
    koodi,nimi,nimi_sv,nimi_en, --oppilaitoksenopetuskieli
    koodi,koodi,koodi, --oid
    koodi,koodi,koodi,koodi,koodi, --address
    CAST(koodi AS float),CAST(koodi AS float), --coordinate
    source,  koodi,nimi,nimi_sv,nimi_en,
	alkupvm, loppupvm, nimi
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
  latitude=CAST(s.koodi AS float),longitude=CAST(s.koodi AS float),
  source=s.source, organisaatio_nykyinen_koodi=s.koodi, organisaatio_vanha_fi = s.nimi, organisaatio_vanha_sv = s.nimi_sv, organisaatio_vanha_en= s.nimi_en,
  alkupvm=s.alkupvm,loppupvm=s.loppupvm, koulutuksen_jarjestajan_yritysmuoto= s.nimi

  from dw.d_organisaatioluokitus d
  join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end

MERGE dw.d_organisaatioluokitus AS target
USING (

  SELECT
    LOWER(s.tyyppi)+'_'+s.koodi AS avain,
    COALESCE(s.koodi, t.koodi) AS koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    COALESCE(ot.koodi, t.koodi) AS oppilaitostyyppikoodi,
    COALESCE(ot.nimi, ot.nimi_sv, ot.nimi_en, t.nimi) AS oppilaitostyyppinimi,
    COALESCE(ot.nimi_sv, ot.nimi, ot.nimi_en, t.nimi_sv) AS oppilaitostyyppinimi_sv,
    COALESCE(ot.nimi_en, ot.nimi, ot.nimi_sv, t.nimi_en) AS oppilaitostyyppinimi_en,
    --additional features
    --oppilaitoksenopetuskieli
    COALESCE(ok.koodi, t.koodi) AS oppilaitoksenopetuskielikoodi,
    COALESCE(ok.nimi, ok.nimi_sv, ok.nimi_en, t.nimi) AS oppilaitoksenopetuskielinimi,
    COALESCE(ok.nimi_sv, ok.nimi, ok.nimi_en, t.nimi_sv) AS oppilaitoksenopetuskielinimi_sv,
    COALESCE(ok.nimi_en, ok.nimi, ok.nimi_sv, t.nimi_en) AS oppilaitoksenopetuskielinimi_en,
    s.oid AS organisaatio_oid,
    s.liitosoid AS liitosorganisaatio_oid,
    s.parentoid AS ylaorganisaatio_oid,
    s.kotikunta AS kunta_koodi,
    s.osoitetyyppi,s.osoite AS katuosoite,s.postinumero,s.postitoimipaikka,
    CAST(s.latitude AS float) AS latitude, CAST(s.longitude AS float) AS longitude,
    s.source,
	COALESCE(s.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
	COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS vanha_nimi_fi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS vanha_nimi_en,
	s.alkupvm,
	s.loppupvm,
	COALESCE(o3.yritysmuoto,'Tieto puuttuu') as koulutuksen_jarjestajan_yritysmuoto

  FROM sa.sa_organisaatioluokitus s
  left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=s.oppilaitostyyppi
  left join sa.sa_koodistot ok on ok.koodisto='oppilaitoksenopetuskieli' and ok.koodi=s.oppilaitoksenopetuskieli
  left join sa.sa_organisaatio_v3 o3 on o3.oid = s.oid
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
    LOWER(s.tyyppi)+'_'+s.koodi+'_'+CAST(rnk.nro AS nvarchar) AS avain,
    COALESCE(s.koodi, t.koodi) AS koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    COALESCE(ot.koodi, t.koodi) AS oppilaitostyyppikoodi,
    COALESCE(ot.nimi, ot.nimi_sv, ot.nimi_en, t.nimi) AS oppilaitostyyppinimi,
    COALESCE(ot.nimi_sv, ot.nimi, ot.nimi_en, t.nimi_sv) AS oppilaitostyyppinimi_sv,
    COALESCE(ot.nimi_en, ot.nimi, ot.nimi_sv, t.nimi_en) AS oppilaitostyyppinimi_en,
    --additional features
    --oppilaitoksenopetuskieli
    COALESCE(ok.koodi, t.koodi) AS oppilaitoksenopetuskielikoodi,
    COALESCE(ok.nimi, ok.nimi_sv, ok.nimi_en, t.nimi) AS oppilaitoksenopetuskielinimi,
    COALESCE(ok.nimi_sv, ok.nimi, ok.nimi_en, t.nimi_sv) AS oppilaitoksenopetuskielinimi_sv,
    COALESCE(ok.nimi_en, ok.nimi, ok.nimi_sv, t.nimi_en) AS oppilaitoksenopetuskielinimi_en,
    s.oid AS organisaatio_oid,
    s.liitosoid AS liitosorganisaatio_oid,
    s.parentoid AS ylaorganisaatio_oid,
    s.kotikunta AS kunta_koodi,
    s.osoitetyyppi,s.osoite AS katuosoite,s.postinumero,s.postitoimipaikka,
    CAST(s.latitude AS float) AS latitude,CAST(s.longitude AS float) AS longitude,
    s.source,
	COALESCE(s.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
	COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS  vanha_nimi_fi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS vanha_nimi_en,
	s.alkupvm,
	s.loppupvm,
	COALESCE(o3.yritysmuoto,'Tieto puuttuu') as koulutuksen_jarjestajan_yritysmuoto
  FROM sa.sa_organisaatioluokitus s
  left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=s.oppilaitostyyppi
  left join sa.sa_koodistot ok on ok.koodisto='oppilaitoksenopetuskieli' and ok.koodi=s.oppilaitoksenopetuskieli
  left join sa.sa_organisaatio_v3 o3 on o3.oid = s.oid
  cross join sa.sa_koodistot t
  --row numbers to each duplicate group
  inner join (select koodi,oid,ROW_NUMBER()OVER(PARTITION BY koodi ORDER BY koodi) AS nro from sa.sa_organisaatioluokitus group by koodi,oid) AS rnk on rnk.koodi=s.koodi and rnk.oid = s.oid
  where 1=1
  and t.koodisto='vipunenmeta' and t.koodi='-1'
  and s.koodi in (
    select koodi from sa.sa_organisaatioluokitus
    group by tyyppi,koodi having count(*)>1
  )



  UNION -- tutkimusorganisaatio

  SELECT
    LOWER(s.koodisto)+'_'+s.koodi AS avain,
    COALESCE(s.koodi, t.koodi) AS koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    t.koodi AS oppilaitostyyppikoodi, t.nimi AS oppilaitostyyppinimi, t.nimi_sv AS oppilaitostyyppinimi_sv, t.nimi_en AS oppilaitostyyppinimi_en,
    --lisäominaisuudet
    t.koodi AS oppilaitoksenopetuskielikoodi, t.nimi AS oppilaitoksenopetuskielinimi, t.nimi_sv AS oppilaitoksenopetuskielinimi_sv, t.nimi_en AS oppilaitoksenopetuskielinimi_en,
    t.koodi AS organisaatio_oid, t.koodi AS liitosorganisaatio_oid, t.koodi AS ylaorganisaatio_oid,
    t.koodi AS kunta_koodi, t.koodi AS osoitetyyppi,t.koodi AS katuosoite,t.koodi AS postinumero,t.koodi AS postitoimipaikka,
    CAST(t.koodi AS float) AS latitude,CAST(t.koodi AS float) AS longitude,
    s.source,
	COALESCE(s.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
	COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS vanha_nimi_fi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS vanha_nimi_en,
	s.alkupvm,
	s.loppupvm,
	'Tieto puuttuu' as koulutuksen_jarjestajan_yritysmuoto
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
    target.organisaatio_fi = src.nimi,
    target.organisaatio_sv = src.nimi_sv,
    target.organisaatio_en = src.nimi_en,
    target.oppilaitostyyppi_koodi = src.oppilaitostyyppikoodi,
    target.oppilaitostyyppi_fi = src.oppilaitostyyppinimi,
    target.oppilaitostyyppi_sv = src.oppilaitostyyppinimi_sv,
    target.oppilaitostyyppi_en = src.oppilaitostyyppinimi_en,
    target.oppilaitoksenopetuskieli_koodi = src.oppilaitoksenopetuskielikoodi,
    target.oppilaitoksenopetuskieli_fi = src.oppilaitoksenopetuskielinimi,
    target.oppilaitoksenopetuskieli_sv = src.oppilaitoksenopetuskielinimi_sv,
    target.oppilaitoksenopetuskieli_en = src.oppilaitoksenopetuskielinimi_en,
    target.organisaatio_oid = src.organisaatio_oid,
    target.liitosorganisaatio_oid = src.liitosorganisaatio_oid,
    target.ylaorganisaatio_oid = src.ylaorganisaatio_oid,
    target.kunta_koodi = src.kunta_koodi,
    target.osoitetyyppi = src.osoitetyyppi,
    target.katuosoite = src.katuosoite,
    target.postinumero = src.postinumero,
    target.postitoimipaikka = src.postitoimipaikka,
    target.latitude = src.latitude,
    target.longitude = src.longitude,
    target.source = src.source,
	target.organisaatio_nykyinen_koodi = src.organisaatio_nykyinen_koodi,
	target.organisaatio_vanha_fi = src.vanha_nimi_fi,
	target.organisaatio_vanha_sv = src.vanha_nimi_sv,
	target.organisaatio_vanha_en = src.vanha_nimi_en,
	target.alkupvm = src.alkupvm,
	target.loppupvm = src.loppupvm,
	target.koulutuksen_jarjestajan_yritysmuoto = src.koulutuksen_jarjestajan_yritysmuoto
WHEN NOT MATCHED THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    oppilaitoksenopetuskieli_koodi,oppilaitoksenopetuskieli_fi,oppilaitoksenopetuskieli_sv,oppilaitoksenopetuskieli_en,
    organisaatio_oid,liitosorganisaatio_oid,ylaorganisaatio_oid,
    kunta_koodi,osoitetyyppi,katuosoite,postinumero,postitoimipaikka,
    latitude,longitude,
    source, organisaatio_nykyinen_koodi, organisaatio_vanha_fi,organisaatio_vanha_sv,organisaatio_vanha_en,
	alkupvm, loppupvm, koulutuksen_jarjestajan_yritysmuoto
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.oppilaitostyyppikoodi, src.oppilaitostyyppinimi, src.oppilaitostyyppinimi_sv, src.oppilaitostyyppinimi_en,
    src.oppilaitoksenopetuskielikoodi,src.oppilaitoksenopetuskielinimi,src.oppilaitoksenopetuskielinimi_sv,src.oppilaitoksenopetuskielinimi_en,
    src.organisaatio_oid,src.liitosorganisaatio_oid,src.ylaorganisaatio_oid,
    src.kunta_koodi,src.osoitetyyppi,src.katuosoite,src.postinumero,src.postitoimipaikka,
    src.latitude,src.longitude,
    src.source,src.organisaatio_nykyinen_koodi,src.vanha_nimi_fi,src.vanha_nimi_sv,src.vanha_nimi_en,
	src.alkupvm,src.loppupvm, koulutuksen_jarjestajan_yritysmuoto

  );

--
-- update new organisation names for universities and universities of applied science
--
MERGE dw.d_organisaatioluokitus AS TARGET2
USING (
SELECT
	koodi
	,(SELECT COALESCE(nimi, nimi_sv,nimi_en,'Tuntematon') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi
	,(SELECT COALESCE(nimi_sv, nimi,nimi_en,'Okänd') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi_sv
	,(SELECT COALESCE(nimi_en, nimi,nimi_sv,'Unknownn') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi_en
	,(SELECT koodi FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS nykyinen_tunnus
	,COALESCE(nimi, nimi_sv,nimi_en,'Tuntematon') AS vanha_nimi
	,COALESCE(nimi_sv, nimi,nimi_en,'Okänd') AS vanha_nimi_sv
	,COALESCE(nimi_en, nimi,nimi_sv,'Unknownn') AS vanha_nimi_en
	,'modified sa.sa_organisaatioluokitus' AS source2
	,s.alkupvm
	,s.loppupvm
 FROM sa.sa_organisaatioluokitus  s
LEFT JOIN sa.sa_korkeakoulu_koodi_historia kkh ON kkh.korkeakoulun_koodi=s.koodi
WHERE koodi =  kkh.korkeakoulun_koodi ) AS SRC2
	ON target2.organisaatio_koodi = src2.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET target2.organisaatio_fi = src2.uusi_nimi
			,target2.organisaatio_sv = src2.uusi_nimi_sv
			,target2.organisaatio_en = src2.uusi_nimi_en
			,target2.organisaatio_nykyinen_koodi = src2.nykyinen_tunnus
			,target2.organisaatio_vanha_fi = src2.vanha_nimi
  			,target2.organisaatio_vanha_sv = src2.vanha_nimi_sv
  			,target2.organisaatio_vanha_en = src2.vanha_nimi_en
			,target2.source = src2.source2
			,target2.alkupvm=src2.alkupvm
			,target2.loppupvm=src2.loppupvm;

--
-- UPDATE OLD name for a current universities and universities of applied science which has changed  name
--
MERGE dw.d_organisaatioluokitus AS TARGET3
USING (
SELECT
	 korkeakoulun_koodi as koodi
	,COALESCE(vanha_nimi,'Tuntematon') AS vanha_nimi
	,COALESCE(vanha_nimi,'Okänd') AS vanha_nimi_sv
	,COALESCE(vanha_nimi,'Unknownn') AS vanha_nimi_en
	,'history values from sa_korkeakoulu_koodi_historia' AS source3
	,alkupvm
	,loppupvm
	,loadtime
 FROM sa.sa_korkeakoulu_koodi_historia kkh
WHERE kkh.korkeakoulun_koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS SRC3
	ON target3.organisaatio_koodi = src3.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET
			target3.organisaatio_vanha_fi = src3.vanha_nimi
  			,target3.organisaatio_vanha_sv = src3.vanha_nimi_sv
  			,target3.organisaatio_vanha_en = src3.vanha_nimi_en
			,target3.source = src3.source3
			,target3.alkupvm=src3.alkupvm
			,target3.loppupvm=src3.loppupvm
			,target3.loadtime=src3.loadtime
			,target3.username=suser_name();
