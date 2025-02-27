ALTER PROCEDURE dw.p_lataa_d_koulutusluokitus AS

if not exists (select * from dw.d_koulutusluokitus where id=-1) begin
  set identity_insert dw.d_koulutusluokitus on;
  insert into dw.d_koulutusluokitus (
    id,
    koulutusluokitus_avain,
    koulutusluokitus_koodi,koulutusluokitus_fi,koulutusluokitus_sv,koulutusluokitus_en,
    koulutusastetaso1_koodi,koulutusastetaso1_fi,koulutusastetaso1_sv,koulutusastetaso1_en,
    koulutusastetaso2_koodi,koulutusastetaso2_fi,koulutusastetaso2_sv,koulutusastetaso2_en,
    koulutusalataso1_koodi,koulutusalataso1_fi,koulutusalataso1_sv,koulutusalataso1_en,
    koulutusalataso2_koodi,koulutusalataso2_fi,koulutusalataso2_sv,koulutusalataso2_en,
    koulutusalataso3_koodi,koulutusalataso3_fi,koulutusalataso3_sv,koulutusalataso3_en,
    okmohjauksenala_koodi,okmohjauksenala_fi,okmohjauksenala_sv,okmohjauksenala_en,
    source
  )
  select
    -1,
    koodi,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
    'ETL: p_lataa_d_koulutusluokitus'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_koulutusluokitus off;
end else begin
  update d
  set
    koulutusluokitus_avain=s.koodi,
    koulutusluokitus_koodi=s.koodi,koulutusluokitus_fi=s.nimi,koulutusluokitus_sv=s.nimi_sv,koulutusluokitus_en=s.nimi_en,
    koulutusastetaso1_koodi=s.koodi,koulutusastetaso1_fi=s.nimi,koulutusastetaso1_sv=s.nimi_sv,koulutusastetaso1_en=s.nimi_en,
    koulutusastetaso2_koodi=s.koodi,koulutusastetaso2_fi=s.nimi,koulutusastetaso2_sv=s.nimi_sv,koulutusastetaso2_en=s.nimi_en,
    koulutusalataso1_koodi=s.koodi,koulutusalataso1_fi=s.nimi,koulutusalataso1_sv=s.nimi_sv,koulutusalataso1_en=s.nimi_en,
    koulutusalataso2_koodi=s.koodi,koulutusalataso2_fi=s.nimi,koulutusalataso2_sv=s.nimi_sv,koulutusalataso2_en=s.nimi_en,
    koulutusalataso3_koodi=s.koodi,koulutusalataso3_fi=s.nimi,koulutusalataso3_sv=s.nimi_sv,koulutusalataso3_en=s.nimi_en,
    okmohjauksenala_koodi=s.koodi,okmohjauksenala_fi=s.nimi,okmohjauksenala_sv=s.nimi_sv,okmohjauksenala_en=s.nimi_en,
    source='ETL: p_lataa_d_koulutusluokitus'
  from dw.d_koulutusluokitus d
  join sa.sa_koodistot s on s.koodi=d.koulutusluokitus_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_koulutusluokitus AS target
USING (
  SELECT DISTINCT
    'koulutus_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    isced2011koulutusastetaso1koodi,
    COALESCE(isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_sv, isced2011koulutusastetaso1nimi_en) AS isced2011koulutusastetaso1nimi,
    COALESCE(isced2011koulutusastetaso1nimi_sv, isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_en) AS isced2011koulutusastetaso1nimi_sv,
    COALESCE(isced2011koulutusastetaso1nimi_en, isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_sv) AS isced2011koulutusastetaso1nimi_en,
    isced2011koulutusastetaso2koodi,
    COALESCE(isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_sv, isced2011koulutusastetaso2nimi_en) AS isced2011koulutusastetaso2nimi,
    COALESCE(isced2011koulutusastetaso2nimi_sv, isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_en) AS isced2011koulutusastetaso2nimi_sv,
    COALESCE(isced2011koulutusastetaso2nimi_en, isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_sv) AS isced2011koulutusastetaso2nimi_en,
    isced2011koulutusalataso1koodi,
    COALESCE(isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_sv, isced2011koulutusalataso1nimi_en) AS isced2011koulutusalataso1nimi,
    COALESCE(isced2011koulutusalataso1nimi_sv, isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_en) AS isced2011koulutusalataso1nimi_sv,
    COALESCE(isced2011koulutusalataso1nimi_en, isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_sv) AS isced2011koulutusalataso1nimi_en,
    isced2011koulutusalataso2koodi,
    COALESCE(isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_sv, isced2011koulutusalataso2nimi_en) AS isced2011koulutusalataso2nimi,
    COALESCE(isced2011koulutusalataso2nimi_sv, isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_en) AS isced2011koulutusalataso2nimi_sv,
    COALESCE(isced2011koulutusalataso2nimi_en, isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_sv) AS isced2011koulutusalataso2nimi_en,
    isced2011koulutusalataso3koodi,
    COALESCE(isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_sv, isced2011koulutusalataso3nimi_en) AS isced2011koulutusalataso3nimi,
    COALESCE(isced2011koulutusalataso3nimi_sv, isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_en) AS isced2011koulutusalataso3nimi_sv,
    COALESCE(isced2011koulutusalataso3nimi_en, isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_sv) AS isced2011koulutusalataso3nimi_en,
    okmohjauksenalakoodi,
    COALESCE(okmohjauksenalanimi, okmohjauksenalanimi_sv, okmohjauksenalanimi_en) AS okmohjauksenalanimi,
    COALESCE(okmohjauksenalanimi_sv, okmohjauksenalanimi, okmohjauksenalanimi_en) AS okmohjauksenalanimi_sv,
    COALESCE(okmohjauksenalanimi_en, okmohjauksenalanimi, okmohjauksenalanimi_sv) AS okmohjauksenalanimi_en,
    'ETL: p_lataa_d_koulutusluokitus' AS source
  FROM sa.sa_koulutusluokitus
) AS src
ON target.koulutusluokitus_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    koulutusluokitus_fi = src.nimi,
    koulutusluokitus_sv = src.nimi_sv,
    koulutusluokitus_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koulutusluokitus_avain,
    koulutusluokitus_koodi,
    koulutusluokitus_fi,
    koulutusluokitus_sv,
    koulutusluokitus_en,
    koulutusastetaso1_koodi,
    koulutusastetaso1_fi,
    koulutusastetaso1_sv,
    koulutusastetaso1_en,
    koulutusastetaso2_koodi,
    koulutusastetaso2_fi,
    koulutusastetaso2_sv,
    koulutusastetaso2_en,
    koulutusalataso1_koodi,
    koulutusalataso1_fi,
    koulutusalataso1_sv,
    koulutusalataso1_en,
    koulutusalataso2_koodi,
    koulutusalataso2_fi,
    koulutusalataso2_sv,
    koulutusalataso2_en,
    koulutusalataso3_koodi,
    koulutusalataso3_fi,
    koulutusalataso3_sv,
    koulutusalataso3_en,
    okmohjauksenala_koodi,
    okmohjauksenala_fi,
    okmohjauksenala_sv,
    okmohjauksenala_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    isced2011koulutusastetaso1koodi,
    isced2011koulutusastetaso1nimi,
    isced2011koulutusastetaso1nimi_sv,
    isced2011koulutusastetaso1nimi_en,
    isced2011koulutusastetaso2koodi,
    isced2011koulutusastetaso2nimi,
    isced2011koulutusastetaso2nimi_sv,
    isced2011koulutusastetaso2nimi_en,
    isced2011koulutusalataso1koodi,
    isced2011koulutusalataso1nimi,
    isced2011koulutusalataso1nimi_sv,
    isced2011koulutusalataso1nimi_en,
    isced2011koulutusalataso2koodi,
    isced2011koulutusalataso2nimi,
    isced2011koulutusalataso2nimi_sv,
    isced2011koulutusalataso2nimi_en,
    isced2011koulutusalataso3koodi,
    isced2011koulutusalataso3nimi,
    isced2011koulutusalataso3nimi_sv,
    isced2011koulutusalataso3nimi_en,
    okmohjauksenalakoodi,
    okmohjauksenalanimi,
    okmohjauksenalanimi_sv,
    okmohjauksenalanimi_en,
    src.source
  );
