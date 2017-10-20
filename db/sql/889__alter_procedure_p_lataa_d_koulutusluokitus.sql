ALTER PROCEDURE [dw].[p_lataa_d_koulutusluokitus] AS

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
    koulutussektori_koodi, koulutussektori_fi, koulutussektori_sv, koulutussektori_en,
    tutkintotyyppi_koodi, tutkintotyyppi_fi, tutkintotyyppi_sv, tutkintotyyppi_en,
    source
  )
  select
    -1,
    koodi,
    koodi,nimi,nimi_sv,nimi_en, --koulutus
    koodi,nimi,nimi_sv,nimi_en, --astetaso1
    koodi,nimi,nimi_sv,nimi_en, --astetaso2
    koodi,nimi,nimi_sv,nimi_en, --alataso1
    koodi,nimi,nimi_sv,nimi_en, --alataso2
    koodi,nimi,nimi_sv,nimi_en, --alataso3
    koodi,nimi,nimi_sv,nimi_en, --ohjauksenala
    koodi,nimi,nimi_sv,nimi_en, --koulutussektori
    koodi,nimi,nimi_sv,nimi_en, --tutkintotyyppi
    source
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
    koulutussektori_koodi=s.koodi,koulutussektori_fi=s.nimi,koulutussektori_sv=s.nimi_sv,koulutussektori_en=s.nimi_en,
    tutkintotyyppi_koodi=s.koodi,tutkintotyyppi_fi=s.nimi,tutkintotyyppi_sv=s.nimi_sv,tutkintotyyppi_en=s.nimi_en,
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
    'koulutus_'+s.koodi AS avain,
    s.koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv) AS nimi_en,
    coalesce(isced2011koulutusastetaso1koodi,t.koodi) as isced2011koulutusastetaso1koodi,
    COALESCE(isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_sv, isced2011koulutusastetaso1nimi_en, t.nimi) AS isced2011koulutusastetaso1nimi,
    COALESCE(isced2011koulutusastetaso1nimi_sv, isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_en, t.nimi_sv) AS isced2011koulutusastetaso1nimi_sv,
    COALESCE(isced2011koulutusastetaso1nimi_en, isced2011koulutusastetaso1nimi, isced2011koulutusastetaso1nimi_sv, t.nimi_en) AS isced2011koulutusastetaso1nimi_en,
    coalesce(isced2011koulutusastetaso2koodi,t.koodi) as isced2011koulutusastetaso2koodi,
    COALESCE(isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_sv, isced2011koulutusastetaso2nimi_en, t.nimi) AS isced2011koulutusastetaso2nimi,
    COALESCE(isced2011koulutusastetaso2nimi_sv, isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_en, t.nimi_sv) AS isced2011koulutusastetaso2nimi_sv,
    COALESCE(isced2011koulutusastetaso2nimi_en, isced2011koulutusastetaso2nimi, isced2011koulutusastetaso2nimi_sv, t.nimi_en) AS isced2011koulutusastetaso2nimi_en,
    coalesce(isced2011koulutusalataso1koodi,t.koodi) as isced2011koulutusalataso1koodi,
    COALESCE(isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_sv, isced2011koulutusalataso1nimi_en, t.nimi) AS isced2011koulutusalataso1nimi,
    COALESCE(isced2011koulutusalataso1nimi_sv, isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_en, t.nimi_sv) AS isced2011koulutusalataso1nimi_sv,
    COALESCE(isced2011koulutusalataso1nimi_en, isced2011koulutusalataso1nimi, isced2011koulutusalataso1nimi_sv, t.nimi_en) AS isced2011koulutusalataso1nimi_en,
    coalesce(isced2011koulutusalataso2koodi,t.koodi) as isced2011koulutusalataso2koodi,
    COALESCE(isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_sv, isced2011koulutusalataso2nimi_en, t.nimi) AS isced2011koulutusalataso2nimi,
    COALESCE(isced2011koulutusalataso2nimi_sv, isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_en, t.nimi_sv) AS isced2011koulutusalataso2nimi_sv,
    COALESCE(isced2011koulutusalataso2nimi_en, isced2011koulutusalataso2nimi, isced2011koulutusalataso2nimi_sv, t.nimi_en) AS isced2011koulutusalataso2nimi_en,
    coalesce(isced2011koulutusalataso3koodi,t.koodi) as isced2011koulutusalataso3koodi,
    COALESCE(isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_sv, isced2011koulutusalataso3nimi_en, t.nimi) AS isced2011koulutusalataso3nimi,
    COALESCE(isced2011koulutusalataso3nimi_sv, isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_en, t.nimi_sv) AS isced2011koulutusalataso3nimi_sv,
    COALESCE(isced2011koulutusalataso3nimi_en, isced2011koulutusalataso3nimi, isced2011koulutusalataso3nimi_sv, t.nimi_en) AS isced2011koulutusalataso3nimi_en,
    coalesce(okmohjauksenalakoodi,t.koodi) as okmohjauksenalakoodi,
    COALESCE(okmohjauksenalanimi, okmohjauksenalanimi_sv, okmohjauksenalanimi_en, t.nimi) AS okmohjauksenalanimi,
    COALESCE(okmohjauksenalanimi_sv, okmohjauksenalanimi, okmohjauksenalanimi_en, t.nimi_sv) AS okmohjauksenalanimi_sv,
    COALESCE(okmohjauksenalanimi_en, okmohjauksenalanimi, okmohjauksenalanimi_sv, t.nimi_en) AS okmohjauksenalanimi_en,
    --nb! no koulutussektori in sa, yet anyway
    -- but we need tutkintotyyppi for evaluating koulutussektori
    case
    when s.koodi in ('001101','201100') then '1'
    when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then '2' --01=Yleissivistävä koulutus
    when tutkintotyyppikoodi='02' then '3' --Ammatilliset perustutkinnot
    when tutkintotyyppikoodi='03' then '3' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
    when tutkintotyyppikoodi='06' then '4' --Ammattikorkeakoulutus
    when tutkintotyyppikoodi='09' then '3' --Muu ammatillinen koulutus
    when tutkintotyyppikoodi='10' then (select top 1 koodi from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
    when tutkintotyyppikoodi='12' then '4' --Ylempi ammattikorkeakoulututkinto
    when tutkintotyyppikoodi='13' then '5' --Alempi korkeakoulututkinto
    when tutkintotyyppikoodi='14' then '5' --Ylempi korkeakoulututkinto
    when tutkintotyyppikoodi='15' then '5' --Lisensiaatin tutkinto
    when tutkintotyyppikoodi='16' then '5' --Tohtorin tutkinto
    else t.koodi
    end as koulutussektorikoodi,
    case
    when s.koodi in ('001101','201100') then 'Esi- ja perusopetus'
    when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'Lukiokoulutus' --01=Yleissivistävä koulutus
    when tutkintotyyppikoodi='02' then 'Ammatillinen koulutus' --Ammatilliset perustutkinnot
    when tutkintotyyppikoodi='03' then 'Ammatillinen koulutus' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
    when tutkintotyyppikoodi='06' then 'Ammattikorkeakoulukoulutus' --Ammattikorkeakoulutus
    when tutkintotyyppikoodi='09' then 'Ammatillinen koulutus' --Muu ammatillinen koulutus
    when tutkintotyyppikoodi='10' then 'Tuntematon' --Muu koulutus
    when tutkintotyyppikoodi='12' then 'Ammattikorkeakoulukoulutus' --Ylempi ammattikorkeakoulututkinto
    when tutkintotyyppikoodi='13' then 'Yliopistokoulutus' --Alempi korkeakoulututkinto
    when tutkintotyyppikoodi='14' then 'Yliopistokoulutus' --Ylempi korkeakoulututkinto
    when tutkintotyyppikoodi='15' then 'Yliopistokoulutus' --Lisensiaatin tutkinto
    when tutkintotyyppikoodi='16' then 'Yliopistokoulutus' --Tohtorin tutkinto
    else t.nimi
    end as koulutussektorinimi,
    case
    when s.koodi in ('001101','201100') then 'Förskoleundervisning och grundläggande utbildning'
    when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'Gymnasieutbildning' --01=Yleissivistävä koulutus
    when tutkintotyyppikoodi='02' then 'Yrkesutbildning' --Ammatilliset perustutkinnot
    when tutkintotyyppikoodi='03' then 'Yrkesutbildning' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
    when tutkintotyyppikoodi='06' then 'Yrkeshögskoleutbildning' --Ammattikorkeakoulutus
    when tutkintotyyppikoodi='09' then 'Yrkesutbildning' --Muu ammatillinen koulutus
    when tutkintotyyppikoodi='10' then (select top 1 nimi_sv from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
    when tutkintotyyppikoodi='12' then 'Yrkeshögskoleutbildning' --Ylempi ammattikorkeakoulututkinto
    when tutkintotyyppikoodi='13' then 'Universitetsutbildning' --Alempi korkeakoulututkinto
    when tutkintotyyppikoodi='14' then 'Universitetsutbildning' --Ylempi korkeakoulututkinto
    when tutkintotyyppikoodi='15' then 'Universitetsutbildning' --Lisensiaatin tutkinto
    when tutkintotyyppikoodi='16' then 'Universitetsutbildning' --Tohtorin tutkinto
    else t.nimi_sv
    end as koulutussektorinimi_sv,
    case
    when s.koodi in ('001101','201100') then 'Pre-primary and basic education'
    when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'General upper secondary education' --01=Yleissivistävä koulutus
    when tutkintotyyppikoodi='02' then 'Vocational education and training' --Ammatilliset perustutkinnot
    when tutkintotyyppikoodi='03' then 'Vocational education and training' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
    when tutkintotyyppikoodi='06' then 'University of applied sciences (UAS) education' --Ammattikorkeakoulutus
    when tutkintotyyppikoodi='09' then 'Vocational education and training' --Muu ammatillinen koulutus
    when tutkintotyyppikoodi='10' then (select top 1 nimi_en from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
    when tutkintotyyppikoodi='12' then 'University of applied sciences (UAS) education' --Ylempi ammattikorkeakoulututkinto
    when tutkintotyyppikoodi='13' then 'University education' --Alempi korkeakoulututkinto
    when tutkintotyyppikoodi='14' then 'University education' --Ylempi korkeakoulututkinto
    when tutkintotyyppikoodi='15' then 'University education' --Lisensiaatin tutkinto
    when tutkintotyyppikoodi='16' then 'University education' --Tohtorin tutkinto
    else t.nimi_en
    end as koulutussektorinimi_en,
    -- and add tutkintotyyppi to dimension as we already have it here
    coalesce(tutkintotyyppikoodi,t.koodi) as tutkintotyyppikoodi,
    COALESCE(tutkintotyyppinimi, tutkintotyyppinimi_sv, tutkintotyyppinimi_en, t.nimi) AS tutkintotyyppinimi,
    COALESCE(tutkintotyyppinimi_sv, tutkintotyyppinimi, tutkintotyyppinimi_en, t.nimi_sv) AS tutkintotyyppinimi_sv,
    COALESCE(tutkintotyyppinimi_en, tutkintotyyppinimi, tutkintotyyppinimi_sv, t.nimi_en) AS tutkintotyyppinimi_en,
    s.source
  FROM sa.sa_koulutusluokitus s
  cross join sa.sa_koodistot as t
  where t.koodisto='vipunenmeta' and t.koodi='-1'
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
    koulutusluokitus_koodi,koulutusluokitus_fi,koulutusluokitus_sv,koulutusluokitus_en,
    koulutusastetaso1_koodi,koulutusastetaso1_fi,koulutusastetaso1_sv,koulutusastetaso1_en,
    koulutusastetaso2_koodi,koulutusastetaso2_fi,koulutusastetaso2_sv,koulutusastetaso2_en,
    koulutusalataso1_koodi,koulutusalataso1_fi,koulutusalataso1_sv,koulutusalataso1_en,
    koulutusalataso2_koodi,koulutusalataso2_fi,koulutusalataso2_sv,koulutusalataso2_en,
    koulutusalataso3_koodi,koulutusalataso3_fi,koulutusalataso3_sv,koulutusalataso3_en,
    okmohjauksenala_koodi,okmohjauksenala_fi,okmohjauksenala_sv,okmohjauksenala_en,
    koulutussektori_koodi,koulutussektori_fi,koulutussektori_sv,koulutussektori_en,
    tutkintotyyppi_koodi,tutkintotyyppi_fi,tutkintotyyppi_sv,tutkintotyyppi_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    isced2011koulutusastetaso1koodi,isced2011koulutusastetaso1nimi,isced2011koulutusastetaso1nimi_sv,isced2011koulutusastetaso1nimi_en,
    isced2011koulutusastetaso2koodi,isced2011koulutusastetaso2nimi,isced2011koulutusastetaso2nimi_sv,isced2011koulutusastetaso2nimi_en,
    isced2011koulutusalataso1koodi,isced2011koulutusalataso1nimi,isced2011koulutusalataso1nimi_sv,isced2011koulutusalataso1nimi_en,
    isced2011koulutusalataso2koodi,isced2011koulutusalataso2nimi,isced2011koulutusalataso2nimi_sv,isced2011koulutusalataso2nimi_en,
    isced2011koulutusalataso3koodi,isced2011koulutusalataso3nimi,isced2011koulutusalataso3nimi_sv,isced2011koulutusalataso3nimi_en,
    okmohjauksenalakoodi,okmohjauksenalanimi,okmohjauksenalanimi_sv,okmohjauksenalanimi_en,
    koulutussektorikoodi,koulutussektorinimi,koulutussektorinimi_sv,koulutussektorinimi_en,
    tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en,
    src.source
  );
	
	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso1_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso1_koodi AS case when koulutusalataso1_koodi = -1 then '99999' else cast(koulutusalataso1_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso2_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso2_koodi AS case when koulutusalataso2_koodi = -1 then '99999' else cast(koulutusalataso2_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso3_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso3_koodi AS case when koulutusalataso3_koodi = '-1' then '99999' else cast(koulutusalataso3_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso1_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso1_koodi AS case when koulutusastetaso1_koodi = '-1' then '99999' else cast(koulutusastetaso1_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso2_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso2_koodi AS case when koulutusastetaso2_koodi = '-1' then '99999' else cast(koulutusastetaso2_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusluokitus_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusluokitus_koodi AS case when koulutusluokitus_koodi = '-1' then '9999999' else cast(koulutusluokitus_koodi as varchar(10))
	  END
	END

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutussektori_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutussektori_koodi AS case when koulutussektori_koodi = '-1' then '99999' else cast(koulutussektori_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_okmohjauksenala_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_okmohjauksenala_koodi AS case when okmohjauksenala_koodi = '-1' then '99999' else cast(okmohjauksenala_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_tutkintotyyppi_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_tutkintotyyppi_koodi AS case when tutkintotyyppi_koodi = -1 then '99999' else cast(tutkintotyyppi_koodi as varchar(10))
	  END
	END
