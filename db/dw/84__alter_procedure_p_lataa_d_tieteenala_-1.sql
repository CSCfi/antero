ALTER PROCEDURE dbo.p_lataa_d_tieteenala AS
if not exists (select * from dbo.d_tieteenala where id=-1) begin
  set identity_insert dbo.d_tieteenala on;
  insert into dbo.d_tieteenala (
    id,
    tieteenala_koodi,
    tieteenala_nimi_fi,
    tieteenala_nimi_sv,
    tieteenala_nimi_en,
    paatieteenala_koodi,
    paatieteenala_nimi_fi,
    paatieteenala_nimi_sv,
    paatieteenala_nimi_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_tieteenala'
  from ANTERO_SA.dbo.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dbo.d_tieteenala off;
end else begin
  update d
  set tieteenala_koodi=s.koodi,
  tieteenala_nimi_fi=s.nimi,
  tieteenala_nimi_sv=s.nimi_sv,
  tieteenala_nimi_en=s.nimi_en,
  paatieteenala_koodi=s.koodi,
  paatieteenala_nimi_fi=s.nimi,
  paatieteenala_nimi_sv=s.nimi_sv,
  paatieteenala_nimi_en=s.nimi_en,
  source='ETL: p_lataa_d_tieteenala'
  from dbo.d_tieteenala d
  join ANTERO_SA.dbo.sa_koodistot s on s.koodi=d.tieteenala_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dbo.d_tieteenala AS target
USING (
  SELECT koodi
  ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
  ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
  ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
  ,paatieteenalakoodi
  ,COALESCE(paatieteenalanimi, paatieteenalanimi_sv, paatieteenalanimi_en) AS paatieteenalanimi
  ,COALESCE(paatieteenalanimi_sv, paatieteenalanimi, paatieteenalanimi_en) AS paatieteenalanimi_sv
  ,COALESCE(paatieteenalanimi_en, paatieteenalanimi, paatieteenalanimi_sv) AS paatieteenalanimi_en
	  ,'ETL: p_lataa_d_tieteenala' AS source
  FROM ANTERO_SA.dbo.sa_tieteenalaluokitus
  ) AS src
ON target.tieteenala_koodi = src.koodi
WHEN MATCHED THEN
	UPDATE SET tieteenala_nimi_fi = src.nimi,
				tieteenala_nimi_sv = src.nimi_sv,
				tieteenala_nimi_en = src.nimi_en,
				paatieteenala_koodi = src.paatieteenalakoodi,
				paatieteenala_nimi_fi = src.paatieteenalanimi,
				paatieteenala_nimi_sv = src.paatieteenalanimi_sv,
				paatieteenala_nimi_en = src.paatieteenalanimi_en,
				target.source = src.source
WHEN NOT MATCHED THEN
	INSERT (
	  tieteenala_koodi,
      tieteenala_nimi_fi,
      tieteenala_nimi_sv,
      tieteenala_nimi_en,
	  paatieteenala_koodi,
	  paatieteenala_nimi_fi,
	  paatieteenala_nimi_sv,
	  paatieteenala_nimi_en,
      source
	)
	VALUES (
	  src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
	  src.paatieteenalakoodi, src.paatieteenalanimi, src.paatieteenalanimi_sv, src.paatieteenalanimi_en,
	  src.source
	);
