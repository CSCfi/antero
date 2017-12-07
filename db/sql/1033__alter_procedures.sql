USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 7.12.2017 17:29:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_organisaatioluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_maatjavaltiot2]    Script Date: 7.12.2017 17:29:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_maatjavaltiot2]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_koulutusluokitus]    Script Date: 7.12.2017 17:29:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_koulutusluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_kieli]    Script Date: 7.12.2017 17:29:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_kieli]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_kieli]    Script Date: 7.12.2017 17:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_kieli]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_kieli] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_kieli] AS
IF (
		SELECT count(1)
		FROM dw.d_kieli
		WHERE kieli_koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_kieli
	set identity_insert dw.d_kieli on
	INSERT dw.d_kieli (
		id
		,kieli_koodi
		,kieli_fi
		,kieli_sv
		,kieli_en
		,kieliryhma1_koodi
		,kieliryhma1_fi
		,kieliryhma1_sv
		,kieliryhma1_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_kieli'
		)
	set identity_insert dw.d_kieli off
END
MERGE dw.d_kieli AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
	CASE 
		WHEN koodi in ('FI','SE') THEN 1
		WHEN koodi = 'SV' THEN 2
		ELSE 3
	END 
	AS kieliryhma1_koodi,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'suomi (sis. saame)'
		WHEN koodi = 'SV' THEN 'ruotsi'
		ELSE 'muut kielet ja tuntematon'
	END 
	AS kieliryhma1_fi,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'finska (inkl. samiska)'
		WHEN koodi = 'SV' THEN 'svenska'
		ELSE 'övriga språk och okänt'
	END 
	AS kieliryhma1_sv,
	CASE 
		WHEN koodi in ('FI','SE') THEN 'Finnish (incl. Sámi)'
		WHEN koodi = 'SV' THEN 'Swedish'
		ELSE 'other languages and unknown'
	END 
	AS kieliryhma1_en,
    'ETL: p_lataa_d_kieli' AS source
  FROM sa.sa_koodistot
  where koodisto='kieli'

UNION

	SELECT
    kieli_avain,
    NULL AS nimi,
    NULL AS nimi_sv,
    NULL AS nimi_en,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 1
		WHEN kieli_avain = 'SV' THEN 2
		ELSE 3
	END 
	AS kieliryhma1_kieli_avain,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'suomi (sis. saame)'
		WHEN kieli_avain = 'SV' THEN 'ruotsi'
		ELSE 'muut kielet ja tuntematon'
	END 
	AS kieliryhma1_fi,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'finska (inkl. samiska)'
		WHEN kieli_avain = 'SV' THEN 'svenska'
		ELSE 'övriga språk och okänt'
	END 
	AS kieliryhma1_sv,
	CASE 
		WHEN kieli_avain in ('FI','SE') THEN 'Finnish (incl. Sámi)'
		WHEN kieli_avain = 'SV' THEN 'Swedish'
		ELSE 'other languages and unknown'
	END 
	AS kieliryhma1_en,
    'ETL: p_lataa_d_kieli' AS source
	FROM sa.sa_hakukohde_kielet
	WHERE LEN(kieli_avain)>2

) AS src
ON target.kieli_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    kieli_fi = src.nimi,
    kieli_sv = src.nimi_sv,
    kieli_en = src.nimi_en,
	kieliryhma1_koodi = src.kieliryhma1_koodi,
	kieliryhma1_fi = src.kieliryhma1_fi,
	kieliryhma1_sv = src.kieliryhma1_sv,
	kieliryhma1_en = src.kieliryhma1_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    kieli_koodi,
    kieli_fi,
    kieli_sv,
    kieli_en,
	kieliryhma1_koodi,
	kieliryhma1_fi,
	kieliryhma1_sv,
	kieliryhma1_en,
    source
  )
  VALUES (
    src.koodi, 
	src.nimi, 
	src.nimi_sv, 
	src.nimi_en,
	src.kieliryhma1_koodi,
	src.kieliryhma1_fi,
	src.kieliryhma1_sv,
	src.kieliryhma1_en,
    src.source
  );
  --lisaa hakuraportoinnissa tarvittavat kielikombinaatiot
  UPDATE k
  SET 
  kieli_fi = k1.kieli_fi + ', ' + k2.kieli_fi + case when k3.kieli_fi is not null then ', ' + k3.kieli_fi else '' end,
  kieli_sv = k1.kieli_sv + ', ' + k2.kieli_sv + case when k3.kieli_sv is not null then ', ' + k3.kieli_sv else '' end,
  kieli_en = k1.kieli_en + ', ' + k2.kieli_en + case when k3.kieli_en is not null then ', ' + k3.kieli_en else '' end
  FROM DW.d_kieli k
  left join dw.d_kieli k1 on k1.kieli_koodi=LEFT(k.kieli_koodi,2)
  left join dw.d_kieli k2 on k2.kieli_koodi=SUBSTRING(k.kieli_koodi,3,2)
  left join dw.d_kieli k3 on k3.kieli_koodi=SUBSTRING(k.kieli_koodi,5,2)
  where k.kieli_fi is null
  

  IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kieli' AND COLUMN_NAME='jarjestys_kieliryhma1')

BEGIN
  ALTER TABLE dw.d_kieli ADD jarjestys_kieliryhma1 AS case when kieliryhma1_koodi = '-1' then 99999 else kieliryhma1_koodi END
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_koulutusluokitus]    Script Date: 7.12.2017 17:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_koulutusluokitus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_koulutusluokitus] AS' 
END
GO
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
	koulutusaste2002_koodi,koulutusaste2002_fi,koulutusaste2002_sv,koulutusaste2002_en,
	koulutusala2002_koodi,koulutusala2002_fi,koulutusala2002_sv,koulutusala2002_en,
	opintoala2002_koodi,opintoala2002_fi,opintoala2002_sv,opintoala2002_en,
	opintoala1995_koodi,opintoala1995_fi,opintoala1995_sv,opintoala1995_en,
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
	koodi,nimi,nimi_sv,nimi_en, --koulutusaste2002
	koodi,nimi,nimi_sv,nimi_en, --koulutusala2002
	koodi,nimi,nimi_sv,nimi_en, --opintoala2002
	koodi,nimi,nimi_sv,nimi_en, --opintoala1995
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
	koulutusaste2002_koodi=s.koodi,koulutusaste2002_fi=s.nimi,koulutusaste2002_sv=s.nimi_sv,koulutusaste2002_en=s.nimi_en,
	koulutusala2002_koodi=s.koodi,koulutusala2002_fi=s.nimi,koulutusala2002_sv=s.nimi_sv,koulutusala2002_en=s.nimi_en,
	opintoala2002_koodi=s.koodi,opintoala2002_fi=s.nimi,opintoala2002_sv=s.nimi_sv,opintoala2002_en=s.nimi_en,
	opintoala1995_koodi=s.koodi,opintoala1995_fi=s.nimi,opintoala1995_sv=s.nimi_sv,opintoala1995_en=s.nimi_en,
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
	--koulutusaste2002
	coalesce(koulutusaste2002koodi,t.koodi) as koulutusaste2002koodi,
    COALESCE(koulutusaste2002nimi, koulutusaste2002nimi_sv, koulutusaste2002nimi_en, t.nimi) AS koulutusaste2002nimi,
    COALESCE(koulutusaste2002nimi_sv, koulutusaste2002nimi, koulutusaste2002nimi_en, t.nimi_sv) AS koulutusaste2002nimi_sv,
    COALESCE(koulutusaste2002nimi_en, koulutusaste2002nimi, koulutusaste2002nimi_sv, t.nimi_en) AS koulutusaste2002nimi_en,
	--koulutusala2002
	coalesce(koulutusala2002koodi,t.koodi) as koulutusala2002koodi,
    COALESCE(koulutusala2002nimi, koulutusala2002nimi_sv, koulutusala2002nimi_en, t.nimi) AS koulutusala2002nimi,
    COALESCE(koulutusala2002nimi_sv, koulutusala2002nimi, koulutusala2002nimi_en, t.nimi_sv) AS koulutusala2002nimi_sv,
    COALESCE(koulutusala2002nimi_en, koulutusala2002nimi, koulutusala2002nimi_sv, t.nimi_en) AS koulutusala2002nimi_en,
	--opintoala2002
	coalesce(opintoala2002koodi,t.koodi) as opintoala2002koodi,
    COALESCE(opintoala2002nimi, opintoala2002nimi_sv, opintoala2002nimi_en, t.nimi) AS opintoala2002nimi,
    COALESCE(opintoala2002nimi_sv, opintoala2002nimi, opintoala2002nimi_en, t.nimi_sv) AS opintoala2002nimi_sv,
    COALESCE(opintoala2002nimi_en, opintoala2002nimi, opintoala2002nimi_sv, t.nimi_en) AS opintoala2002nimi_en,
	--opintoala1995
	coalesce(opintoala1995koodi,t.koodi) as opintoala1995koodi,
    COALESCE(opintoala1995nimi, opintoala1995nimi_sv, opintoala1995nimi_en, t.nimi) AS opintoala1995nimi,
    COALESCE(opintoala1995nimi_sv, opintoala1995nimi, opintoala1995nimi_en, t.nimi_sv) AS opintoala1995nimi_sv,
    COALESCE(opintoala1995nimi_en, opintoala1995nimi, opintoala1995nimi_sv, t.nimi_en) AS opintoala1995nimi_en,
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
    when tutkintotyyppikoodi='10' then (select top 1 nimi from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
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
	koulutusastetaso2_fi = src.isced2011koulutusastetaso2nimi,
	koulutusastetaso2_sv = src.isced2011koulutusastetaso2nimi_sv,
	koulutusastetaso2_en = src.isced2011koulutusastetaso2nimi_en,
	koulutusaste2002_koodi = src.koulutusaste2002koodi,
	koulutusaste2002_fi = src.koulutusaste2002nimi,
	koulutusaste2002_sv = src.koulutusaste2002nimi_sv,
	koulutusaste2002_en = src.koulutusaste2002nimi_en,
	koulutusala2002_koodi = src.koulutusala2002koodi,
	koulutusala2002_fi = src.koulutusala2002nimi,
	koulutusala2002_sv = src.koulutusala2002nimi_sv,
	koulutusala2002_en = src.koulutusala2002nimi_en,
	opintoala2002_koodi = src.opintoala2002koodi,
	opintoala2002_fi = src.opintoala2002nimi,
	opintoala2002_sv = src.opintoala2002nimi_sv,
	opintoala2002_en = src.opintoala2002nimi_en,
	opintoala1995_koodi = src.opintoala1995koodi,
	opintoala1995_fi = src.opintoala1995nimi,
	opintoala1995_sv = src.opintoala1995nimi_sv,
	opintoala1995_en = src.opintoala1995nimi_en,
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
	koulutusaste2002_koodi,koulutusaste2002_fi,koulutusaste2002_sv,koulutusaste2002_en,
	koulutusala2002_koodi,koulutusala2002_fi,koulutusala2002_sv,koulutusala2002_en,
	opintoala2002_koodi,opintoala2002_fi,opintoala2002_sv,opintoala2002_en,
	opintoala1995_koodi,opintoala1995_fi,opintoala1995_sv,opintoala1995_en,
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
	koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en,
	koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en,
	opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en,
	opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en,
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


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusaste2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusaste2002_koodi AS case when koulutusaste2002_koodi = -1 then '99999' else cast(koulutusaste2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusala2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusala2002_koodi AS case when koulutusala2002_koodi = -1 then '99999' else cast(koulutusala2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_opintoala2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_opintoala2002_koodi AS case when opintoala2002_koodi = -1 then '99999' else cast(opintoala2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_opintoala1995_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_opintoala1995_koodi AS case when opintoala1995_koodi = -1 then '99999' else cast(opintoala1995_koodi as varchar(10))
	  END
	END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_maatjavaltiot2]    Script Date: 7.12.2017 17:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_maatjavaltiot2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_maatjavaltiot2] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_maatjavaltiot2] AS

if not exists (select * from dw.d_maatjavaltiot2 where id=-1) begin
  set identity_insert dw.d_maatjavaltiot2 on;
  insert into dw.d_maatjavaltiot2 (
    id,
    maatjavaltiot2_koodi,maatjavaltiot2_fi,maatjavaltiot2_sv,maatjavaltiot2_en,
    maanosa_koodi,maanosa_fi,maanosa_sv,maanosa_en,
    maanosa2_koodi,maanosa2_fi,maanosa2_sv,maanosa2_en,
    maanosa3_koodi,maanosa3_fi,maanosa3_sv,maanosa3_en,
	maanosa0_koodi,maanosa0_fi,maanosa0_sv,maanosa0_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en, --maa
    koodi,nimi,nimi_sv,nimi_en, --maanosa
    koodi,nimi,nimi_sv,nimi_en, --maanosa2
    koodi,nimi,nimi_sv,nimi_en, --maanosa3
	koodi,nimi,nimi_sv,nimi_en, --maanosa0
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_maatjavaltiot2 off;
end else begin
  update d
  set
    maatjavaltiot2_koodi=s.koodi,maatjavaltiot2_fi=s.nimi,maatjavaltiot2_sv=s.nimi_sv,maatjavaltiot2_en=s.nimi_en,
    maanosa_koodi=s.koodi,maanosa_fi=s.nimi,maanosa_sv=s.nimi_sv,maanosa_en=s.nimi_en,
    maanosa2_koodi=s.koodi,maanosa2_fi=s.nimi,maanosa2_sv=s.nimi_sv,maanosa2_en=s.nimi_en,
    maanosa3_koodi=s.koodi,maanosa3_fi=s.nimi,maanosa3_sv=s.nimi_sv,maanosa3_en=s.nimi_en,
	maanosa0_koodi=s.koodi,maanosa0_fi=s.nimi,maanosa0_sv=s.nimi_sv,maanosa0_en=s.nimi_en,
    d.source=s.source
  from dw.d_maatjavaltiot2 d
  join sa.sa_koodistot s on s.koodi=d.maatjavaltiot2_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_maatjavaltiot2 AS target
USING (
  SELECT
    s.koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv) AS nimi_en,
    -- CSCVIPUNEN-518: alter amerikas
    case when maanosatkoodi='2' then coalesce(maanosat2koodi,m.koodi)
    else coalesce(maanosatkoodi,m.koodi)
    end as maanosatkoodi,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi, maanosat2nimi_sv, maanosat2nimi_en),m.nimi)
    else coalesce(COALESCE(maanosatnimi, maanosatnimi_sv, maanosatnimi_en),m.nimi)
    end AS maanosatnimi,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi_sv, maanosat2nimi, maanosat2nimi_en),m.nimi_sv)
    else coalesce(COALESCE(maanosatnimi_sv, maanosatnimi, maanosatnimi_en),m.nimi_sv)
    end AS maanosatnimi_sv,
    case when maanosatkoodi='2' then coalesce(COALESCE(maanosat2nimi_en, maanosat2nimi, maanosat2nimi_sv),m.nimi_en)
    else coalesce(COALESCE(maanosatnimi_en, maanosatnimi, maanosatnimi_sv),m.nimi_en)
    end AS maanosatnimi_en,

    coalesce(maanosat2koodi,m.koodi) as maanosat2koodi,
    coalesce(COALESCE(maanosat2nimi, maanosat2nimi_sv, maanosat2nimi_en),m.nimi) AS maanosat2nimi,
    coalesce(COALESCE(maanosat2nimi_sv, maanosat2nimi, maanosat2nimi_en),m.nimi_sv) AS maanosat2nimi_sv,
    coalesce(COALESCE(maanosat2nimi_en, maanosat2nimi, maanosat2nimi_sv),m.nimi_en) AS maanosat2nimi_en,
    coalesce(maanosat3koodi,m.koodi) as maanosat3koodi,
    coalesce(COALESCE(maanosat3nimi, maanosat3nimi_sv, maanosat3nimi_en),m.nimi) AS maanosat3nimi,
    coalesce(COALESCE(maanosat3nimi_sv, maanosat3nimi, maanosat3nimi_en),m.nimi_sv) AS maanosat3nimi_sv,
    coalesce(COALESCE(maanosat3nimi_en, maanosat3nimi, maanosat3nimi_sv),m.nimi_en) AS maanosat3nimi_en,
	coalesce(maanosatkoodi,m.koodi) as maanosat0koodi,
    coalesce(COALESCE(maanosatnimi, maanosatnimi_sv, maanosatnimi_en),m.nimi) AS maanosat0nimi,
    coalesce(COALESCE(maanosatnimi_sv, maanosatnimi, maanosatnimi_en),m.nimi_sv) AS maanosat0nimi_sv,
    coalesce(COALESCE(maanosatnimi_en, maanosatnimi, maanosatnimi_sv),m.nimi_en) AS maanosat0nimi_en,
    s.source
  FROM sa.sa_maaluokitus s
  left join sa.sa_koodistot m on m.koodisto='vipunenmeta' and m.koodi='-1'
) AS src
ON target.maatjavaltiot2_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    maatjavaltiot2_fi=src.nimi,maatjavaltiot2_sv=src.nimi_sv,maatjavaltiot2_en=src.nimi_en,
    maanosa_koodi=src.maanosatkoodi,maanosa_fi=src.maanosatnimi,maanosa_sv=src.maanosatnimi_sv,maanosa_en=src.maanosatnimi_en,
    maanosa2_koodi=src.maanosat2koodi,maanosa2_fi=src.maanosat2nimi,maanosa2_sv=src.maanosat2nimi_sv,maanosa2_en=src.maanosat2nimi_en,
    maanosa3_koodi=src.maanosat3koodi,maanosa3_fi=src.maanosat3nimi,maanosa3_sv=src.maanosat3nimi_sv,maanosa3_en=src.maanosat3nimi_en,
	maanosa0_koodi=src.maanosat0koodi,maanosa0_fi=src.maanosat0nimi,maanosa0_sv=src.maanosat0nimi_sv,maanosa0_en=src.maanosat0nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    maatjavaltiot2_koodi,maatjavaltiot2_fi,maatjavaltiot2_sv,maatjavaltiot2_en,
    maanosa_koodi,maanosa_fi,maanosa_sv,maanosa_en,
    maanosa2_koodi,maanosa2_fi,maanosa2_sv,maanosa2_en,
    maanosa3_koodi,maanosa3_fi,maanosa3_sv,maanosa3_en,
	maanosa0_koodi,maanosa0_fi,maanosa0_sv,maanosa0_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.maanosatkoodi,src.maanosatnimi,src.maanosatnimi_sv,src.maanosatnimi_en,
    src.maanosat2koodi,src.maanosat2nimi,src.maanosat2nimi_sv,src.maanosat2nimi_en,
    src.maanosat3koodi,src.maanosat3nimi,src.maanosat3nimi_sv,src.maanosat3nimi_en,
    src.maanosat0koodi,src.maanosat0nimi,src.maanosat0nimi_sv,src.maanosat0nimi_en,	
    src.source
  );
  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa_koodi AS case when maanosa_koodi = '-1' then 'ZZZZZ' else cast(maanosa_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa2_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa2_koodi AS case when maanosa2_koodi = '-1' then 'ZZZZZ' else cast(maanosa2_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa3_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa3_koodi AS case when maanosa3_koodi = '-1' then 'ZZZZZ' else cast(maanosa3_koodi as varchar(10))
    END
  END

  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maatjavaltiot2_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maatjavaltiot2_koodi AS case when maatjavaltiot2_koodi = '-1' then '99999' else cast(maatjavaltiot2_koodi as varchar(10))
    END
  END
 
  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa0_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa0_koodi AS case when maanosa0_koodi = '-1' then 'ZZZZZ' else cast(maanosa0_koodi as varchar(10))
    END
  END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus]    Script Date: 7.12.2017 17:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_organisaatioluokitus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_organisaatioluokitus] AS' 
END
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
  inner join (select koodi,oid,ROW_NUMBER()OVER(PARTITION BY koodi ORDER BY koodi) as nro from sa.sa_organisaatioluokitus group by koodi,oid) as rnk on rnk.koodi=s.koodi and rnk.oid = s.oid
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


