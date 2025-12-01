USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 1.12.2025 9.50.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_organisaatioluokitus] AS

--muokattu tyhjien koodien juokseva numero määräytymään oidin perusteella (tyypeittäin), jotta dimension id ei useimmiten muutu esim. oppisopimustoimistoilla. JS 5.4.2023

--null-koodit aiheuttavat ongelmia. JS 15.3.2023
update [sa].[sa_organisaatioluokitus] set koodi = '' where koodi is null
;

--Opetuskielen osalta sa-taulu virheellinen. JS 6.10.2022
update s 
set oppilaitoksenopetuskieli = ca.opetuskielikoodi
FROM [sa].[sa_organisaatioluokitus] s
CROSS APPLY (
	select top 1 opetuskielikoodi--, opetuskieli, opetuskieli_sv, opetuskieli_en 
	from [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d 
	where d.oppilaitoskoodi = s.koodi
	and d.oppilaitoskoodi not in ('','-1','-2')
) ca
where s.tyyppi = 'oppilaitos'
;

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
	alkupvm,loppupvm, koulutuksen_jarjestajan_yritysmuoto, koulutuksen_jarjestajan_yritysmuoto_sv, koulutuksen_jarjestajan_yritysmuoto_en
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
	alkupvm, loppupvm, nimi, nimi_sv, nimi_en
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
  alkupvm=s.alkupvm,loppupvm=s.loppupvm, 
  koulutuksen_jarjestajan_yritysmuoto = s.nimi, koulutuksen_jarjestajan_yritysmuoto_sv = s.nimi_sv, koulutuksen_jarjestajan_yritysmuoto_en = s.nimi_en

  from dw.d_organisaatioluokitus d
  join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end

MERGE dw.d_organisaatioluokitus AS target

USING (
	SELECT
		LOWER(s1.tyyppi)+'_'+s1.koodi AS avain,
		COALESCE(s1.koodi, t.koodi) AS koodi,
		COALESCE(s7.nimi, s6.nimi, s5.nimi, s4.nimi, s3.nimi, s2.nimi, s1.nimi,  s1.nimi_sv, s1.nimi_en, t.nimi) AS nimi, 
		COALESCE(s7.nimi_sv, s6.nimi_sv, s5.nimi_sv, s4.nimi_sv, s3.nimi_sv, s2.nimi_sv, s1.nimi_sv, s1.nimi, s1.nimi_en, t.nimi_sv) AS nimi_sv, 
		COALESCE(s7.nimi_en, s6.nimi_en, s5.nimi_en, s4.nimi_en, s3.nimi_en, s2.nimi_en, s1.nimi_en, s1.nimi, s1.nimi_sv, t.nimi_en) AS nimi_en,
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
		s1.oid AS organisaatio_oid,
		s1.liitosoid AS liitosorganisaatio_oid,
		s1.parentoid /* COALESCE(s7.parentoid,s6.parentoid,s5.parentoid,s4.parentoid,s3.parentoid,s2.parentoid,s1.parentoid) */ AS ylaorganisaatio_oid,
		s1.kotikunta /* COALESCE(s7.kotikunta,s6.kotikunta,s5.kotikunta,s4.kotikunta,s3.kotikunta,s2.kotikunta,s1.kotikunta) */ AS kunta_koodi,
		s1.osoitetyyppi AS osoitetyyppi,
		s1.osoite AS katuosoite,
		s1.postinumero,
		s1.postitoimipaikka,
		CAST(s1.latitude AS float) AS latitude, CAST(s1.longitude AS float) AS longitude,
		s1.source,
		COALESCE(s7.koodi, s6.koodi, s5.koodi, s4.koodi, s3.koodi, s2.koodi, s1.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
		COALESCE(s1.nimi, s1.nimi_sv, s1.nimi_en, t.nimi) AS vanha_nimi_fi,
		COALESCE(s1.nimi_sv, s1.nimi, s1.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
		COALESCE(s1.nimi_en, s1.nimi, s1.nimi_sv, t.nimi_en) AS vanha_nimi_en,
		s1.alkupvm,
		case when s2.alkupvm = s1.loppupvm then dateadd(day,-1,s1.loppupvm) else s1.loppupvm end as loppupvm,
		COALESCE(ym.nimi, t.nimi) as koulutuksen_jarjestajan_yritysmuoto,
		COALESCE(ym.nimi_sv, t.nimi_sv) as koulutuksen_jarjestajan_yritysmuoto_sv,
		COALESCE(ym.nimi_en, t.nimi_en) as koulutuksen_jarjestajan_yritysmuoto_en

	FROM sa.sa_organisaatioluokitus s1
	left join sa.sa_organisaatioluokitus s2 on s2.oid = s1.liitosoid and s1.liitosoid is not null and s2.alkupvm <= getdate() and s1.loppupvm is not null
	left join sa.sa_organisaatioluokitus s3 on s3.oid = s2.liitosoid and s2.liitosoid is not null and s3.alkupvm <= getdate() and s2.loppupvm is not null
	left join sa.sa_organisaatioluokitus s4 on s4.oid = s3.liitosoid and s3.liitosoid is not null and s4.alkupvm <= getdate() and s3.loppupvm is not null
	left join sa.sa_organisaatioluokitus s5 on s5.oid = s4.liitosoid and s4.liitosoid is not null and s5.alkupvm <= getdate() and s4.loppupvm is not null
	left join sa.sa_organisaatioluokitus s6 on s6.oid = s5.liitosoid and s5.liitosoid is not null and s6.alkupvm <= getdate() and s5.loppupvm is not null
	left join sa.sa_organisaatioluokitus s7 on s7.oid = s6.liitosoid and s6.liitosoid is not null and s7.alkupvm <= getdate() and s6.loppupvm is not null
	left join sa.sa_koodistot ot on ot.koodisto = 'oppilaitostyyppi' and ot.koodi = s1.oppilaitostyyppi					--COALESCE(s7.oppilaitostyyppi,s6.oppilaitostyyppi,s5.oppilaitostyyppi,s4.oppilaitostyyppi,s3.oppilaitostyyppi,s2.oppilaitostyyppi,s1.oppilaitostyyppi)
	left join sa.sa_koodistot ok on ok.koodisto = 'oppilaitoksenopetuskieli' and ok.koodi = s1.oppilaitoksenopetuskieli	--COALESCE(s7.oppilaitoksenopetuskieli,s6.oppilaitoksenopetuskieli,s5.oppilaitoksenopetuskieli,s4.oppilaitoksenopetuskieli,s3.oppilaitoksenopetuskieli,s2.oppilaitoksenopetuskieli,s1.oppilaitoksenopetuskieli)
	left join sa.sa_organisaatio_v3 o3 on o3.oid = s1.oid	--COALESCE(s7.oid,s6.oid,s5.oid,s4.oid,s3.oid,s2.oid,s1.oid)
	left join sa.sa_koodistot ym on ym.koodisto = 'yritysmuoto' and ym.nimi = o3.yritysmuoto
	cross join sa.sa_koodistot t
	where 1=1
	and t.koodisto='vipunenmeta' and t.koodi='-1'
	-- data has some sort of duplicates. TODO fix this:
	and s1.koodi not in (
		select koodi 
		from sa.sa_organisaatioluokitus
		group by tyyppi,koodi 
		having count(*) > 1
	)

	UNION --duplikaatit, huom avaimeen lisätään rank numero

	SELECT
		LOWER(s1.tyyppi)+'_'+s1.koodi+'_'+CAST(rnk.nro AS nvarchar) AS avain,
		COALESCE(s1.koodi, t.koodi) AS koodi,
		COALESCE(s7.nimi, s6.nimi, s5.nimi, s4.nimi, s3.nimi, s2.nimi, s1.nimi,  s1.nimi_sv, s1.nimi_en, t.nimi) AS nimi, 
		COALESCE(s7.nimi_sv, s6.nimi_sv, s5.nimi_sv, s4.nimi_sv, s3.nimi_sv, s2.nimi_sv, s1.nimi_sv, s1.nimi, s1.nimi_en, t.nimi_sv) AS nimi_sv, 
		COALESCE(s7.nimi_en, s6.nimi_en, s5.nimi_en, s4.nimi_en, s3.nimi_en, s2.nimi_en, s1.nimi_en, s1.nimi, s1.nimi_sv, t.nimi_en) AS nimi_en,
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
		s1.oid AS organisaatio_oid,
		s1.liitosoid AS liitosorganisaatio_oid,
		s1.parentoid /* COALESCE(s7.parentoid,s6.parentoid,s5.parentoid,s4.parentoid,s3.parentoid,s2.parentoid,s1.parentoid) */ AS ylaorganisaatio_oid,
		s1.kotikunta /* COALESCE(s7.kotikunta,s6.kotikunta,s5.kotikunta,s4.kotikunta,s3.kotikunta,s2.kotikunta,s1.kotikunta) */ AS kunta_koodi,
		s1.osoitetyyppi AS osoitetyyppi,
		s1.osoite AS katuosoite,
		s1.postinumero,
		s1.postitoimipaikka,
		CAST(s1.latitude AS float) AS latitude, CAST(s1.longitude AS float) AS longitude,
		s1.source,
		COALESCE(s7.koodi, s6.koodi, s5.koodi, s4.koodi, s3.koodi, s2.koodi, s1.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
		COALESCE(s1.nimi, s1.nimi_sv, s1.nimi_en, t.nimi) AS vanha_nimi_fi,
		COALESCE(s1.nimi_sv, s1.nimi, s1.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
		COALESCE(s1.nimi_en, s1.nimi, s1.nimi_sv, t.nimi_en) AS vanha_nimi_en,
		s1.alkupvm,
		s1.loppupvm,
		COALESCE(ym.nimi, t.nimi) as koulutuksen_jarjestajan_yritysmuoto,
		COALESCE(ym.nimi_sv, t.nimi_sv) as koulutuksen_jarjestajan_yritysmuoto_sv,
		COALESCE(ym.nimi_en, t.nimi_en) as koulutuksen_jarjestajan_yritysmuoto_en
	FROM sa.sa_organisaatioluokitus s1
	left join sa.sa_organisaatioluokitus s2 on s2.oid = s1.liitosoid and s1.liitosoid is not null and s2.alkupvm <= getdate() and s1.loppupvm is not null
	left join sa.sa_organisaatioluokitus s3 on s3.oid = s2.liitosoid and s2.liitosoid is not null and s3.alkupvm <= getdate() and s2.loppupvm is not null
	left join sa.sa_organisaatioluokitus s4 on s4.oid = s3.liitosoid and s3.liitosoid is not null and s4.alkupvm <= getdate() and s3.loppupvm is not null
	left join sa.sa_organisaatioluokitus s5 on s5.oid = s4.liitosoid and s4.liitosoid is not null and s5.alkupvm <= getdate() and s4.loppupvm is not null
	left join sa.sa_organisaatioluokitus s6 on s6.oid = s5.liitosoid and s5.liitosoid is not null and s6.alkupvm <= getdate() and s5.loppupvm is not null
	left join sa.sa_organisaatioluokitus s7 on s7.oid = s6.liitosoid and s6.liitosoid is not null and s7.alkupvm <= getdate() and s6.loppupvm is not null
	left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=s1.oppilaitostyyppi
	left join sa.sa_koodistot ok on ok.koodisto='oppilaitoksenopetuskieli' and ok.koodi=s1.oppilaitoksenopetuskieli
	left join sa.sa_organisaatio_v3 o3 on o3.oid = s1.oid
	left join sa.sa_koodistot ym on ym.koodisto='yritysmuoto' and ym.nimi=o3.yritysmuoto
	cross join sa.sa_koodistot t
	--row numbers to each duplicate group
	inner join (
		select tyyppi, koodi, oid, ROW_NUMBER() OVER(PARTITION BY tyyppi, koodi ORDER BY oid) AS nro 
		from sa.sa_organisaatioluokitus 
		group by tyyppi, koodi, oid
	) AS rnk on rnk.tyyppi = s1.tyyppi and rnk.koodi = s1.koodi and rnk.oid = s1.oid
	where 1=1
	and t.koodisto='vipunenmeta' and t.koodi='-1'
	and s1.koodi in (
		select koodi
		from sa.sa_organisaatioluokitus
		group by tyyppi, koodi 
		having count(*) > 1
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
		concat(s.koodi, '_', t.koodi) AS organisaatio_oid, concat(s.koodi, '_', t.koodi) AS liitosorganisaatio_oid, t.koodi AS ylaorganisaatio_oid,
		t.koodi AS kunta_koodi, t.koodi AS osoitetyyppi,t.koodi AS katuosoite,t.koodi AS postinumero,t.koodi AS postitoimipaikka,
		CAST(t.koodi AS float) AS latitude,CAST(t.koodi AS float) AS longitude,
		s.source,
		COALESCE(s.koodi, t.koodi) AS organisaatio_nykyinen_koodi,
		COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS vanha_nimi_fi,
		COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS vanha_nimi_sv,
		COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS vanha_nimi_en,
		s.alkupvm,
		s.loppupvm,
		t.nimi as koulutuksen_jarjestajan_yritysmuoto,
		t.nimi_sv as koulutuksen_jarjestajan_yritysmuoto_sv,
		t.nimi_en as koulutuksen_jarjestajan_yritysmuoto_en
	FROM sa.sa_koodistot s
	--left join sa.sa_oppilaitosluokitus l on l.koodi=s.koodi and s.koodisto='oppilaitosnumero'
	--left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=l.oppilaitostyyppikoodi
	cross join sa.sa_koodistot t
	where s.koodisto in ('tutkimusorganisaatio')
	and t.koodisto='vipunenmeta' and t.koodi='-1'
	-- Pudottaa pois oppilaitokset
	and s.koodi not in (
		select koodi 
		from sa.sa_organisaatioluokitus
	)

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
	target.koulutuksen_jarjestajan_yritysmuoto = src.koulutuksen_jarjestajan_yritysmuoto,
	target.koulutuksen_jarjestajan_yritysmuoto_sv = src.koulutuksen_jarjestajan_yritysmuoto_sv,
	target.koulutuksen_jarjestajan_yritysmuoto_en = src.koulutuksen_jarjestajan_yritysmuoto_en

WHEN NOT MATCHED BY target THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    oppilaitoksenopetuskieli_koodi,oppilaitoksenopetuskieli_fi,oppilaitoksenopetuskieli_sv,oppilaitoksenopetuskieli_en,
    organisaatio_oid,liitosorganisaatio_oid,ylaorganisaatio_oid,
    kunta_koodi,osoitetyyppi,katuosoite,postinumero,postitoimipaikka,
    latitude,longitude,
    source, organisaatio_nykyinen_koodi, organisaatio_vanha_fi,organisaatio_vanha_sv,organisaatio_vanha_en,
	alkupvm, loppupvm, koulutuksen_jarjestajan_yritysmuoto, koulutuksen_jarjestajan_yritysmuoto_sv, koulutuksen_jarjestajan_yritysmuoto_en
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
	src.alkupvm,src.loppupvm, koulutuksen_jarjestajan_yritysmuoto, koulutuksen_jarjestajan_yritysmuoto_sv, koulutuksen_jarjestajan_yritysmuoto_en
  )

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_organisaatioluokitus) > 0 THEN DELETE
;


GO

